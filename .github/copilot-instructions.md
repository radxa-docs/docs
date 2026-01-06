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

## 项目目录结构约束（配件除外）

- 目标：为每个产品/型号在 `docs/` 下保持一致、清晰的目录结构，便于维护、侧栏配置与 i18n 同步（参照 `docs/cubie/a7z`）。
- 建议顶层结构（示例，来自 `a7z`）：

```text
.
├── app-dev
│   ├── mediapipe-dev
│   ├── npu-dev
│   ├── ollama-dev
│   ├── opencv-dev
│   ├── README.md
│   ├── ros-dev
│   ├── virtual-env
│   └── vscode-remote-ssh.md
├── download.md
├── faq.md
├── getting-started
│   ├── install-system
│   ├── quickly-start.md
│   └── README.md
├── hardware-use
│   ├── ante.md
│   ├── fan.md
│   ├── hardware-info.md
│   ├── microhdmi.md
│   ├── microsd.md
│   ├── mipi-csi.md
│   ├── pcie-fpc.md
│   ├── pin-gpio.md
│   ├── README.md
│   ├── type-c.md
│   └── uboot.md
├── low-level-dev
│   ├── build-system
│   └── README.md
├── other-system
│   ├── android
│   └── README.md
├── README.md
└── system-config
    ├── app_usage.md
    ├── audio_usage.md
    ├── auto_login.md
    ├── blue_usage.md
    ├── no_display.md
    ├── README.md
    ├── rsetup.md
    ├── ssh_remote.md
    ├── system_update.md
    ├── uart_debug.md
    ├── vnc_remote.md
    └── wifi_usage.md
```

- 规则摘要：
  - 每个型号目录须包含 `README.md` 作为入口（不要使用 `index.md`）。
  - 常见子目录建议包括：`getting-started/`（含 `install-system/`）、`hardware-use/`、`system-config/`、`app-dev/`、`low-level-dev/`、`other-system/`。
  - 每个子目录应包含 `README.md`（目录首页）。
  - 文件/目录命名必须使用 **小写 + 连字符**（例如 `quickly-start.md`）。
  - 安装相关目录统一使用 `install-system`（代替 `install-os`）。
  - 侧栏顺序通过 `sidebar_position` 控制，避免使用 `0`，并在目录内按逻辑顺序编号（例如 `README:1, getting-started:2, hardware-use:3`）。
  - 所有变更在 `docs/` 发生后需评估是否同步到 `i18n/en/...`，镜像结构以英文树为准并调整图片路径（英文图像路径在 HTML 标签中使用 `/en/img/...`）。
  - 避免过深嵌套，保持每个产品树在 2-3 层内清晰可读。

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

## AI 文档写作约束与提示词

为保证 AI（Copilot / LLM）生成的文档质量与仓库规范一致，请遵守以下约束并优先使用示例提示词进行交互：

### 基本约束（必须遵守）

- 语言与目录对应：`docs/` 下为中文；若要生成英文版本，请同步到 `i18n/en/docusaurus-plugin-content-docs/current/` 并确保英文文件中不包含中文。
- 文件命名与路径：使用小写 + 连字符（如 `quickly-start.md`），不要使用下划线或空格；新的 section 用 `README.md` 做目录入口。
- Frontmatter 必须包含至少 `sidebar_position`，建议添加 `slug` 与 `description`；**禁止使用** `sidebar_label`（由侧栏配置控制）。
- 图片资源：统一使用 `.webp`；在中文文档中引用 `/img/...`，在英文文档中 HTML `<img>` 使用 `/en/img/...`。
- 链接与引用：内链优先使用相对路径（如 `./install-system/`）；避免硬编码站内绝对 URL。
- 风格与语气：专业、简洁、客观；步骤使用清晰的标题（例如 `## 使用前提`、`## 安装系统`）。
- 组件与模板：尽量复用仓库的 `_*.mdx` 组件（勿新增未注册组件）；确保 `Tabs` 组件带 `queryString` 属性。
- 提交与测试：修改后运行本地 pre-commit / lint；如果更改了 `docs/`，同时评估是否需要更新 `i18n/en/...`。

### AI 生成内容的质量检查（必须执行）

1. 检查 Frontmatter 是否完整且格式正确。
2. 验证所有内链是否有效（相对路径无错）。
3. 确认图片存在于 `static/img/`，且格式为 `.webp`。
4. 英文文件不得出现中文字符；中文文件符合写作风格。
5. 对含步骤的段落，保证“命令/操作”用动词开头并列出明确步骤。

### 术语约束（必须遵守）

- 单一术语来源：所有术语首选写法应记录并维护在 `.github/terminology.md`（包含：术语、中文写法、英文写法、说明）。提交新术语需同时更新该术语表并在 PR 描述中注明。
- 产品/商标：产品型号与商标保持原文写法，不随意翻译（例如 `Radxa`、`Rock 5`、芯片型号 `RK3588` 等）；在中文文档首次出现时可在括号中添加简短说明。
- 专有名词大小写：严格使用官方写法，例如 `U-Boot`、`eMMC`、`UFS`、`NVMe`、`Linux`、`Android`、`U-Boot`。
- 单位与数值：单位与数值之间保留空格（如 `8 GB`、`3.5 mm`）；在英文与中文文档中均使用阿拉伯数字表示数值。
- 术语翻译：对常见技术词（如 `flash` → `刷机/写入镜像`、`bootloader` → `引导加载程序`、`system image` → `系统镜像`）在术语表中给出首选译法并固定。
- 命名一致性：板卡、接口、引脚、配置项等命名须统一（例如 `GPIO` 引脚命名规则），避免在不同页面使用冲突写法。
- AI 生成内容：使用 AI 生成文本前，需先读取并遵循 `.github/terminology.md`；AI 提示词中应明确写明“请遵循术语表的写法”，并在生成结果中加入“术语一致性”自检项。

### 执行与校验（建议流程）

- 执行方式：建议通过 Vale 或 textlint 集成术语检查规则（将术语表输出为规则或词典）。如暂未集成，提交人需在 PR 描述中列出已核对的术语项并说明核查结果。
- 自检清单：在 PR 模板或说明中包含：已核对 Frontmatter / 已按照术语表规范用词 / 英文文件无中文 / 图片路径格式正确。
- 术语提议流程：新增或修正术语时，更新 `.github/terminology.md` 并在 PR 描述中说明改动缘由；维护者将评审后合并并可同步到 CI 词库。

### 可选改进（建议）

- 为重要页面添加 `description` 和 `tags` 以增强 SEO 与站内检索。
- 对复杂操作（刷机、底层开发）提供“警告/注意”块 (`:::warning` / `:::tip`) 并配图示例。

### 小提示（Prompt engineering）

- 明确输出格式：要求返回完整文件内容、只返回修改后的片段、或返回 diff（请写明）。
- 指定约束：例如“保持表格列顺序不变”、“别改行内 HTML”，或“图片路径保持原仓库相对规则”。
- 要求自检清单：在回复末尾添加“自检清单”并列出上面『质量检查』项的逐项确认。

> 例子 (英文提示词)
> "Using `docs/cubie/a7z/README.md` as a reference, produce an English `README.md` for a new board `XYZ`: include product overview, specs (table), quick start, install system (MicroSD/eMMC/UFS/NVMe), tips/ warnings. Add frontmatter: `sidebar_position: 1`, `slug: /xyz`, `description`. Ensure English files contain no Chinese. Return the full markdown file and a self-check list confirming frontmatter + local image paths + internal links are valid."
