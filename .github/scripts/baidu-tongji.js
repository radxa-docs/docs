const axios = require("axios");
const fs = require("fs");
const path = require("path");
const cheerio = require("cheerio");

function getAccessToken() {
  return process.env.BAIDU_TONGJI_ACCESS_TOKEN || "";
}

async function refreshAccessTokenIfPossible() {
  const refreshToken = process.env.BAIDU_TONGJI_REFRESH_TOKEN || "";
  const clientId = process.env.BAIDU_TONGJI_CLIENT_ID || "";
  const clientSecret = process.env.BAIDU_TONGJI_CLIENT_SECRET || "";

  if (!refreshToken || !clientId || !clientSecret) {
    console.warn("缺少刷新令牌或客户端凭据，无法刷新 access_token");
    return "";
  }

  const url = "https://openapi.baidu.com/oauth/2.0/token";
  const params = {
    grant_type: "refresh_token",
    refresh_token: refreshToken,
    client_id: clientId,
    client_secret: clientSecret,
  };

  try {
    const { data } = await axios.get(url, { params, timeout: 15000 });
    if (data && data.access_token) {
      console.log("已通过 refresh_token 获取新的 access_token");
      return data.access_token;
    }
    console.warn("刷新 access_token 失败：响应无 access_token 字段");
    return "";
  } catch (e) {
    console.warn("刷新 access_token 异常：", e.message);
    return "";
  }
}

// 获取上一周的日期范围（格式：yyyyMMdd）
function getLastWeekDateRange() {
  const today = new Date();
  const dayOfWeek = today.getDay();

  const lastMonday = new Date(today);
  lastMonday.setDate(today.getDate() - dayOfWeek - 6);

  const lastSunday = new Date(lastMonday);
  lastSunday.setDate(lastMonday.getDate() + 6);

  const formatDate = (date) => {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, "0");
    const day = String(date.getDate()).padStart(2, "0");
    return `${year}${month}${day}`;
  };

  return {
    startDate: formatDate(lastMonday),
    endDate: formatDate(lastSunday),
  };
}
// 获取受访页面数据
async function getTopPages() {
  try {
    const dateRange = getLastWeekDateRange();
    const url = "https://openapi.baidu.com/rest/2.0/tongji/report/getData";
    let accessToken = getAccessToken();
    if (!accessToken) {
      accessToken = await refreshAccessTokenIfPossible();
      if (!accessToken) {
        throw new Error("无法获得可用的 access_token");
      }
    }

    let params = {
      access_token: accessToken,
      site_id: 22607172,
      method: "visit/toppage/a",
      start_date: dateRange.startDate,
      end_date: dateRange.endDate,
      max_results: 20,
      metrics: "pv_count",
    };

    let response = await axios.get(url, { params });

    if (response.data.error_code) {
      if (
        response.data.error_code === 110 ||
        response.data.error_code === 111
      ) {
        const refreshed = await refreshAccessTokenIfPossible();
        if (refreshed) {
          params.access_token = refreshed;
          response = await axios.get(url, { params });
        }
      }
      if (response.data.error_code) {
        console.log("失败", response.data);
        return false;
      }
    }
    console.log("访问数据获取成功");
    return response.data;
  } catch (error) {
    console.log("获取访问数据时出错:", error.message);
    return {};
  }
}

// 从URL检测语言
function detectLanguageFromUrl(url) {
  if (url.includes("/en/") || url.endsWith("/en")) {
    return "en";
  } else if (url.includes("/zh/") || url.endsWith("/zh")) {
    return "zh-CN";
  } else if (url.includes("/zh-CN/") || url.endsWith("/zh-CN")) {
    return "zh-CN";
  } else if (url.includes("/zh-TW/") || url.endsWith("/zh-TW")) {
    return "zh-TW";
  } else if (url.includes("/ja/") || url.endsWith("/ja")) {
    return "ja";
  } else if (url.includes("/ko/") || url.endsWith("/ko")) {
    return "ko";
  }
  return null;
}

// 从HTML内容检测语言
function detectLanguageFromHtml($) {
  const htmlLang = $("html").attr("lang");
  if (htmlLang) {
    return htmlLang.toLowerCase();
  }

  const metaLang = $('meta[http-equiv="content-language"]').attr("content");
  if (metaLang) {
    return metaLang.toLowerCase();
  }

  const charset = $("meta[charset]").attr("charset");
  if (charset) {
    if (charset.toLowerCase().includes("utf-8")) {
      return "auto";
    }
  }

  return null;
}

// 获取页面标题和语言
async function getPageTitleAndLang(url) {
  try {
    const response = await axios.get(url, {
      timeout: 10000,
      headers: {
        "User-Agent":
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36",
      },
    });

    const $ = cheerio.load(response.data);

    // 获取标题
    let title = "";
    const titleElement = $("title");
    if (titleElement.length > 0) {
      title = titleElement.text().trim();
    } else {
      const h1Element = $("h1");
      if (h1Element.length > 0) {
        title = h1Element.first().text().trim();
      } else {
        title = url.split("/").pop() || url;
      }
    }

    let lang = detectLanguageFromUrl(url);
    if (!lang) {
      lang = detectLanguageFromHtml($);
    }

    if (!lang) {
      if (url.includes("docs.radxa.com") && !url.includes("/en/")) {
        lang = "zh-CN";
      } else {
        lang = "en";
      }
    }

    return { title, lang };
  } catch (error) {
    console.error(`获取页面标题失败 ${url}:`, error.message);
    let lang = detectLanguageFromUrl(url) || "en";
    return {
      title: url.split("/").pop() || url,
      lang,
    };
  }
}

async function updateDataWithTitles(data) {
  if (!data || !data.data || !data.data.items || !data.data.items[0]) {
    console.log("数据结构不符合预期，跳过标题更新");
    return data;
  }

  const items = data.data.items[0];
  const urlSet = new Set();

  // 收集所有唯一的URL
  for (const itemGroup of items) {
    for (const item of itemGroup) {
      if (item.name) {
        urlSet.add(item.name);
      }
    }
  }

  console.log(`找到 ${urlSet.size} 个唯一URL，开始获取标题和语言信息...`);

  // 获取所有URL的标题和语言
  const urlInfo = {};
  const urls = Array.from(urlSet);

  for (let i = 0; i < urls.length; i++) {
    const url = urls[i];
    console.log(`正在获取第 ${i + 1}/${urls.length} 个URL的信息: ${url}`);
    const { title, lang } = await getPageTitleAndLang(url);
    urlInfo[url] = { title, lang };

    await new Promise((resolve) => setTimeout(resolve, 500));
  }

  // 更新数据中的标题和语言信息
  for (const itemGroup of items) {
    for (const item of itemGroup) {
      if (item.name && urlInfo[item.name]) {
        item.title = urlInfo[item.name].title;
        item.lang = urlInfo[item.name].lang;
      }
    }
  }

  console.log("标题和语言信息更新完成");
  return data;
}

// 保存数据到 JSON 文件
function saveToJsonFile(data, filename = "static/json/baidu_tongji_data.json") {
  try {
    const filePath = path.join(filename);
    const dirPath = path.dirname(filePath);

    if (!fs.existsSync(dirPath)) {
      fs.mkdirSync(dirPath, { recursive: true });
    }
    const jsonData = JSON.stringify(data, null, 2);

    fs.writeFileSync(filePath, jsonData, "utf8");
    console.log(`数据已保存到: ${filePath}`);
    return filePath;
  } catch (error) {
    console.error("保存文件时出错:", error.message);
    throw error;
  }
}

async function main() {
  try {
    const visitData = await getTopPages();

    // 准备要保存的数据
    const resultData = {
      fetch_time: new Date().toISOString(),
      date_range: {
        start_date: getLastWeekDateRange().startDate,
        end_date: getLastWeekDateRange().endDate,
      },
      site_info: {
        site_id: 22607172,
      },
      data: visitData?.result,
    };

    // 获取并更新页面标题信息
    console.log("开始获取页面标题信息...");
    const updatedData = await updateDataWithTitles(resultData);

    // 保存到 JSON（写入 contents/static/json）
    saveToJsonFile(updatedData, "static/json/baidu_tongji_data.json");
  } catch (error) {
    process.exit(1);
  }
}

main();
