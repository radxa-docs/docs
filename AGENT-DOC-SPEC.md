# Agent-Friendly Documentation Spec

本文档定义本仓库面向 Agent（Copilot / Codex / LLM）的文档约束，目标是让文档更易检索、更易解析、更可执行。

## Scope

- 生效路径：
  - `docs/**`
  - `i18n/en/docusaurus-plugin-content-docs/current/**`
- 生效文件：
  - `*.md`
  - `*.mdx`

## Document Kind

- `doc_kind: page`
  - 可直接阅读的页面文档（默认）。
- `doc_kind: wrapper`
  - 仅用于导入并渲染共享组件的包装页。
- `doc_kind: partial`
  - 可复用片段，通常为 `_*.mdx`。
- `doc_kind: template`
  - 模板文档，不应作为最终内容被索引。

## Front Matter

### Page (required)

页面文档应包含 front matter，至少包含以下字段：

```yaml
---
sidebar_position: 1
doc_kind: page
---
```

### Page (recommended)

```yaml
title: "..."
description: "..."
locale: zh|en
product: rock5|zero|cubie|...
board: rock5b|zero3|...
task_type: getting-started|install|config|troubleshooting|reference
last_verified: YYYY-MM-DD
source_of_truth: local|common|template
```

### Wrapper / Partial / Template

- `wrapper` 与 `partial` 可根据现有架构保留轻量写法。
- 新增模板建议显式声明 `doc_kind: template`。

## Page Structure

页面文档建议遵循以下结构：

1. `#` 一级标题（必须）
2. `## Prerequisites`（前置条件）
3. `## Steps`（步骤）
4. `## Expected Output`（预期输出）
5. `## Validation`（验证）
6. `## Rollback`（回滚，可选）
7. `## Troubleshooting`（排障，可选）

可复用模板：`.github/agent-doc-page-template.md`

## Command and Code Blocks

- 所有代码块必须声明语言，例如：
  - `bash`
  - `powershell`
  - `yaml`
  - `json`
- 禁止使用无语言标注的裸代码块（` ``` `）。
- 命令示例应可直接执行，避免隐式上下文。

## Placeholder and Draft Content

- 非模板文档禁止残留以下占位符：
  - `TODO`
  - `TBD`
  - `XXX`
  - `XXXXXX`
- 变量占位请使用显式格式：
  - `<loader-file>.bin`
  - `<system-image>.img`
  - `<your-ssid>`

## Translation Placeholder Policy

- 允许使用“翻译占位页”临时消除路径漂移，但必须记录并受基线管控。
- 占位页基线文件：`.github/agent-doc-translation-baseline.md`
- 占位页报告脚本：`scripts/agent-doc-translation-report.sh`
- 占位页门禁脚本：`scripts/agent-doc-translation-guard.sh`
- 默认策略：占位页数量只能减少，不能新增（除非在同一 PR 更新基线并说明原因）。

## CI / Pre-commit Policy

- 新增或修改文档时，必须通过 `scripts/agent-doc-lint.sh`。
- 新增或修改文档时，必须通过 `scripts/agent-doc-drift-guard.sh`，禁止引入新的 `docs-only` / `i18n-only` 路径漂移。
- 该检查以增量方式执行（仅检查本次改动文件），用于逐步治理存量文档。

## Review Checklist

- 文档不为空文件。
- 非 `partial/wrapper` 页面具备 front matter 与 H1。
- 代码块均带语言标注。
- 非模板文档不存在 `TODO/TBD/XXX` 占位符泄漏。
- 中英文变更已评估是否同步。
