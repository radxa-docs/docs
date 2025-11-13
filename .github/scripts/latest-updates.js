const axios = require("axios");
const fs = require("fs");
const path = require("path");

function getRepoDir() {
  return path.resolve(__dirname, "../../");
}

function saveJson(data) {
  const outPath = path.resolve(
    getRepoDir(),
    "static/json/commit_update_data.json",
  );
  const dir = path.dirname(outPath);
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }
  fs.writeFileSync(outPath, JSON.stringify(data, null, 2), "utf8");
  console.log(`数据已保存到: ${outPath}`);
}

function getAuthHeaders() {
  const token = process.env.GITHUB_TOKEN || process.env.GH_TOKEN || "";
  return token ? { Authorization: `Bearer ${token}` } : {};
}

function getRepo() {
  return process.env.GITHUB_REPOSITORY || "radxa-docs/docs";
}

function isRetryable(error) {
  if (!error || !error.response) return true;
  const status = error.response.status;
  return status === 429 || (status >= 500 && status < 600);
}

async function httpGetWithRetry(
  url,
  config = {},
  retries = 3,
  backoffMs = 1000,
) {
  let lastErr;
  for (let i = 0; i <= retries; i++) {
    try {
      return await axios.get(url, config);
    } catch (err) {
      lastErr = err;
      if (i === retries || !isRetryable(err)) break;
      const wait = backoffMs * Math.pow(2, i);
      await new Promise((r) => setTimeout(r, wait));
    }
  }
  throw lastErr;
}

async function listCommits(days = 30, perPage = 100, maxPages = 3) {
  const repo = getRepo();
  const baseUrl = `https://api.github.com/repos/${repo}/commits`;
  const since = new Date(Date.now() - days * 24 * 60 * 60 * 1000).toISOString();

  const commits = [];
  for (let page = 1; page <= maxPages; page++) {
    const { data, headers } = await httpGetWithRetry(baseUrl, {
      headers: { Accept: "application/vnd.github+json", ...getAuthHeaders() },
      params: { since, per_page: perPage, page },
      timeout: 15000,
    });
    if (!Array.isArray(data) || data.length === 0) break;
    commits.push(...data);
    if (headers && headers["x-ratelimit-remaining"] !== undefined) {
      console.log(
        `GitHub API 剩余配额: ${headers["x-ratelimit-remaining"]}/${headers["x-ratelimit-limit"]}`,
      );
    }
    if (data.length < perPage) break;
  }
  return commits;
}

async function getCommitDetail(sha) {
  const repo = getRepo();
  const url = `https://api.github.com/repos/${repo}/commits/${sha}`;
  const { data } = await httpGetWithRetry(url, {
    headers: { Accept: "application/vnd.github+json", ...getAuthHeaders() },
    timeout: 15000,
  });
  return data;
}

async function getMarkdownCommits(days = 30) {
  const list = await listCommits(days, 100, 5);
  const result = [];
  const exts = [".md", ".mdx"];
  for (const item of list) {
    try {
      const sha = item.sha;
      const detail = await getCommitDetail(sha);
      const files = Array.isArray(detail.files) ? detail.files : [];
      const touchedMd = files.some((f) => {
        const name = (f.filename || "").toLowerCase();
        return exts.some((ext) => name.endsWith(ext));
      });
      if (!touchedMd) continue;

      const authorName =
        (detail.commit && detail.commit.author && detail.commit.author.name) ||
        (item.commit && item.commit.author && item.commit.author.name) ||
        (item.author && item.author.login) ||
        "unknown";
      const committedAt =
        (detail.commit && detail.commit.author && detail.commit.author.date) ||
        (item.commit && item.commit.author && item.commit.author.date) ||
        (item.committer && item.committer.date) ||
        "";
      const title =
        (detail.commit && detail.commit.message
          ? detail.commit.message.split("\n")[0]
          : "") ||
        (item.commit && item.commit.message
          ? item.commit.message.split("\n")[0]
          : "");
      const message =
        (detail.commit && detail.commit.message) ||
        (item.commit && item.commit.message) ||
        "";
      const url = detail.html_url || item.html_url || "";

      result.push({
        author: authorName,
        title,
        url,
        message,
        committed_at: committedAt,
        sha,
      });
    } catch (e) {
      // 忽略单条失败，继续
      continue;
    }
  }
  return result;
}

async function main() {
  try {
    const items = await getMarkdownCommits(30);
    const result = {
      generated_at: new Date().toISOString(),
      count: items.length,
      items,
    };
    saveJson(result);
  } catch (err) {
    console.error("latest-updates 生成失败:", err.message);
    process.exit(1);
  }
}

main();
