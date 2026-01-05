# Copilot 编码助手说明（本仓库）

目标：以最小改动维护 Docusaurus 文档站点；文档简明、可读性好、专业；并保证能通过 pre-commit/CI 校验。

## 本地开发

- 本仓库内容目录是 `contents/`，站点需要在父目录启动：`cd .. && yarn start`

## 仓库结构

- 中文文档：`docs/`（按产品线/型号分目录，如 `docs/cubie/<model>/...`）
- 英文文档：`i18n/en/docusaurus-plugin-content-docs/current/`（通常与 `docs/` 结构镜像）
- 静态资源：`static/`，图片集中在 `static/img/**`
- 可复用片段/模块：常见于 `docs/**/_*.mdx`（不要改动其对外接口/导入路径）
- 模板参考：`docs/template/`

## 写作与链接约定

- 文档入口优先用 `README.md`（不要新建 `index.md`）
- 内链优先用相对链接或站内路径；不要用同站点的完整 URL
- 文件/目录命名用小写 + 连字符（如 `quickly-start.md`），避免下划线
- 图片路径：
  - 中文文档：统一使用 `/img/...`
  - 英文文档：HTML `<img>` 标签使用 `/en/img/...`，Markdown 语法 `![]()` 使用 `/img/...`

## pre-commit / CI 规则

- Frontmatter 禁止使用 `sidebar_label`（用文件名/目录结构或 sidebar 配置承载）
- 英文树（`i18n/en/...`）除特殊情况 (商标、图标、Logo) 不得包含中文
- 新增图片请使用 `.webp`（避免 png/jpg）

## 改动策略

- 先用搜索定位引用（链接、图片路径、导入的 `_*.mdx`），再做最小范围修改
- 重命名文件时必须同步更新所有引用（`docs/` 与 `i18n/en/...`）
- 如需批量替换：先限定目录范围，再全局校验是否残留旧路径

## 提交与协作

- 优先遵循现有格式化/校验工具的输出，不要引入新的格式/规则
- 提交前检查中英文文档是否同步：改动 `docs/` 时评估是否需要同步到 `i18n/en/docusaurus-plugin-content-docs/current/`（并确保英文树不含中文）
- 如果遇到 CI 失败，先根据 pre-commit 报错定位对应文件再修复
