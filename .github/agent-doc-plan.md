# Agent-Friendly Documentation Plan

## 1. 目标

将仓库文档体系改造成对 Agent（Copilot / Codex / LLM）更友好的结构，提升以下能力：

- 可检索：文档可被稳定索引与召回。
- 可解析：文档结构一致，机器可可靠提取步骤与命令。
- 可执行：步骤、命令、验证与回滚信息明确。
- 可维护：通过 pre-commit 与 CI 持续约束质量，避免回退。

## 2. 范围

- 路径：
  - `docs/**`
  - `i18n/en/docusaurus-plugin-content-docs/current/**`
- 文件类型：
  - `*.md`
  - `*.mdx`

## 3. 分阶段执行

### Phase 1: 规范与守护（已完成）

目的：先建立标准和自动化门禁，防止问题继续扩散。

- 新增规范文档：
  - `AGENT-DOC-SPEC.md`
- 新增增量校验脚本：
  - `scripts/agent-doc-lint.sh`
- 接入 pre-commit：
  - 新增 `agent-doc-lint` hook
- 接入 CI：
  - 在 `Deploy` workflow 中对变更文档执行 lint
- 扩展 PR 模板：
  - 增加 agent 文档自检清单
- 对齐 AI 写作入口：
  - 在 `.github/copilot-instructions.md` 引用规范与脚本

### Phase 2: 高风险存量治理（进行中）

目的：修复最容易误导 Agent 的问题。

- 修复空文件与冲突文件名
- 清理非模板文档中的占位符（`TODO/TBD/XXX/XXXXXX`）
- 为变更文档中的代码块补齐语言标注（`bash/text/...`）
- 保证中英文对应文档同步更新

已落地示例（第一批）：

- `docs/rock4/rock4d/system-config/fcitx-usage.md`（空文件修复）
- `docs/common/ai/_flux_1.mdx`（TODO 清理）
- `docs/common/ai/_sd3.mdx`（TODO 清理）
- `docs/e/e24c/getting-started/install-os/maskrom/rkdevtool.md`
- `i18n/en/.../rkdevtool.md`（占位符与代码块语言修复）

### Phase 3: 结构一致性治理（进行中）

目的：降低长期漂移与重复维护成本。

- 统一页面结构模板（Prerequisites / Steps / Expected Output / Validation / Troubleshooting）
  - 新增 `.github/agent-doc-page-template.md` 作为标准页面骨架
- 治理 `docs` 与 `i18n/en` 路径漂移（docs-only / i18n-only）
  - 新增 `scripts/agent-doc-drift-guard.sh`，基于 `.github/agent-doc-drift-baseline.md` 阻止新增漂移
- 对高重复内容建立单一真源（common + wrapper 参数化）
- 分批补齐关键 front matter 元数据（`doc_kind`、`locale`、`task_type` 等）

### Phase 4: 持续质量运营（进行中）

目的：将规范转为长期稳定机制。

- 每周增量治理一批历史文档
- 按目录维护整改看板（通过率、占位符清理率、结构达标率）
- 持续收紧 lint 规则（从增量到目录级全量）
- 新增 `scripts/agent-doc-metrics.sh` 并产出快照：`.github/agent-doc-metrics.md`
- 新增翻译占位门禁：`scripts/agent-doc-translation-guard.sh` + `.github/agent-doc-translation-baseline.md`

## 4. 执行策略

- 增量优先：仅强制检查“本次改动文件”，先保证可落地。
- 风险优先：先处理空文件、占位符泄漏、无语言代码块。
- 对称更新：涉及 `docs/` 变更时评估并同步 `i18n/en/...`。
- 小步提交：每批改动可独立回滚与验证。

## 4.1 当前进度快照（2026-02-26）

- `placeholder_count_non_template`: `0`
- `docs_only_count`: `0`
- `i18n_only_count`: `0`
- `unlabeled_fence_count`: `0`（本轮已清零）
- `translation_placeholder_total_count`: `0`（由 translation baseline 守护，当前已清零）
- 详情见：`.github/agent-doc-metrics.md`

## 4.2 本轮推进记录（2026-02-26）

- 已连续完成多批“无语言代码块”治理，按中英文配对文件同步修改。
- 本轮重点目录：
  - `common/radxa-os/**`
  - `common/other-system/android/**`
  - `cubie/**`
  - `rock2/**`
  - `rock4/rock4d/**`
  - `rock5/rock5c/**`
  - `nio/nio12l/**`
  - `som/cm/**`
  - `fogwise/airbox-q900/**`
  - `accessories/**`
- 指标变化：
  - `unlabeled_fence_count`: `2906 -> 0`（净下降 `2906`）
  - `docs_only_count`: `14 -> 0`
  - `i18n_only_count`: `31 -> 0`
  - `placeholder_count_non_template`: 持续保持 `0`
  - 漂移数量：收敛至 `docs_only=0` / `i18n_only=0`（由基线守护）
- 当前“无语言代码块”“路径漂移”“翻译占位”均已清零，后续主线为翻译质量提升与元数据完善。

## 4.3 本次推进更新（2026-02-26）

- 本轮完成：`docs` 与 `i18n/en/...` 两侧翻译占位页均已替换完成（`translation_placeholder_total_count: 0`）。
- 门禁状态：`agent-doc-translation-guard` 基线已更新到 `0`，阻止占位数量回升。
- 进度记录：`.github/agent-doc-metrics.md` 与 `.github/agent-doc-translation-backlog.md` 已同步更新为清零状态。

## 4.4 本次推进更新（2026-02-28）

- 定向治理目录：
  - `docs/dragon/q6a/app-dev/**`
  - `docs/rock5/**/(app-development|app-development|app-dev)/**`
  - `i18n/en/docusaurus-plugin-content-docs/current` 对应目录
- 批量补齐 wrapper 元数据：
  - 为目标范围 wrapper 候选补齐 `doc_kind: wrapper`、`source_of_truth`、`imports_resolve_to`。
  - 目标范围复扫结果：wrapper 元数据缺失已收敛为 `0`。
- 结构修复：
  - README `sidebar_position` 缺失已清零（`docs` 与 `i18n/en`）。
  - 裸代码块语言标注缺失已清零（统一标注为 `bash` 或 `text`）。
- 校验结果：
  - 目标目录执行 `scripts/agent-doc-lint.sh` 通过。

## 4.5 本次推进更新（2026-02-28）

- 全仓 wrapper 元数据补齐（`docs/**` + `i18n/en/**`）：
  - 按 lint 识别规则覆盖全部非 partial wrapper 候选；
  - 批量补齐 `doc_kind: wrapper`、`source_of_truth`、`imports_resolve_to`；
  - `imports_resolve_to` 统一写入仓库根目录相对路径，保证 Agent 可直接跳转真源。
- 执行结果：
  - 本轮全仓补齐写入 `2466` 个文件；
  - 复扫结果：非 partial wrapper 候选元数据缺失为 `0`（`docs` 与 `i18n/en` 均清零）。
- 回归校验：
  - 变更文档执行 `scripts/agent-doc-lint.sh` 通过；
  - `scripts/agent-doc-drift-guard.sh` 与 `scripts/agent-doc-translation-guard.sh` 均通过。

## 5. 验收标准

- 所有变更文档通过 `scripts/agent-doc-lint.sh`
- CI 中 `Agent doc lint` 通过
- 新增/改动页面无空文件、无占位符泄漏
- 变更范围内代码块具备语言标注
- PR 模板自检项完整填写

## 6. 回滚策略

- 规则回滚：可先在 pre-commit 或 CI 中临时移除 `agent-doc-lint` 步骤。
- 内容回滚：按批次提交回退对应 commit，不影响其他目录。
- 渐进恢复：先恢复核心检查（空文件、占位符），再恢复结构性检查。

## 7. 下一步任务清单

1. 按高访问目录优先对镜像替换页面开展英文质量翻译（避免仅与 `docs` 内容机械同步）。
2. 为关键页面分批补齐推荐元数据（`doc_kind`、`locale`、`task_type`、`last_verified`）。
3. 评估是否将 `agent-doc-lint` 从“仅增量”提升到“目录级抽样/全量”。
4. 持续维护 `.github/agent-doc-metrics.md` 与漂移基线，防止回退。
