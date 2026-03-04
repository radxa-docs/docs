# Agent Reading Guide

本指南定义 Agent 在本仓库阅读文档时的统一策略，目标是降低壳页、引用和 import 带来的解析歧义。

## 1. Reading Order

1. 先读取 front matter，识别 `doc_kind`。
2. 根据 `doc_kind` 决定是否继续读正文或先跳转真源：
   - `page`：直接读取当前文件正文。
   - `wrapper`：优先跳转 `imports_resolve_to` 指向的真源文件。
   - `partial`：仅作为片段引用源，不作为独立最终文档。
   - `template`：仅作为模板参考，不作为最终事实源。
3. 仅在真源文件中提取步骤、命令、结论；壳页正文仅作导航信息。

## 2. Wrapper Resolution Rules

对于 `doc_kind: wrapper` 文件：

1. 必须读取：
   - `source_of_truth`
   - `imports_resolve_to`
2. `imports_resolve_to` 为仓库根目录相对路径列表，按顺序尝试打开。
3. 若 `imports_resolve_to` 与正文中的 `import ... from ...` 不一致，以 `imports_resolve_to` 为准。
4. 若列表有多个目标，默认第一个为主要正文源，其余作为补充来源。

## 3. Import and Reference Handling

1. 将 `import` 视为“内容组装信息”，不是最终事实文本。
2. 将 `_*.mdx` 视为可复用片段（partial），引用时应回到调用页面确认上下文。
3. 引用外部页面时，优先使用仓库内路径，不依赖站点构建后的 URL。
4. 对同名章节冲突，优先采用 `source_of_truth` 指向的来源内容。

## 4. Extraction Guardrails

1. 命令必须来自带语言标注的代码块（如 `bash`/`powershell`）。
2. 遇到变量示例（如 `<loader-file>.bin`）时，保留占位，不擅自填具体值。
3. 文档编写时，尖括号占位符应写成行内代码（如 `` `<loader-file>.bin` ``），避免 MDX 解析漂移。
4. 发现 `TODO/TBD/XXX` 等占位内容时，标记为未完备信息，不作为最终结论。
5. 中英文内容冲突时，优先读取当前目标语种目录；需要跨语种比对时应显式说明。

## 5. Quick Decision Table

| 场景                             | Agent 动作                            |
| -------------------------------- | ------------------------------------- |
| 壳页 + `imports_resolve_to` 完整 | 直接跳转真源并提取内容                |
| 壳页缺少真源字段                 | 回退解析正文 `import`，并标记低置信度 |
| partial 被直接请求解释           | 返回“片段语义 + 典型调用位置”         |
| template 被直接请求执行步骤      | 返回“模板结构”，不输出可执行结论      |

## 6. Related Files

- 规范：`AGENT-DOC-SPEC.md`
- 页面模板：`.github/agent-doc-page-template.md`
- 校验脚本：`scripts/agent-doc-lint.sh`
- 漂移门禁：`scripts/agent-doc-drift-guard.sh`
- 翻译占位门禁：`scripts/agent-doc-translation-guard.sh`
