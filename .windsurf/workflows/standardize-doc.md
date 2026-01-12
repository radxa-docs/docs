---
description: 标准化和验证中文文档路径、文件名及链接
---

# 文档标准化工作流

此工作流用于检查和修复中文文档，确保符合仓库规范，并同步到英文文档。

## 使用方法

提供需要检查的中文文档路径（相对于 `docs/` 或绝对路径），例如：

- `/Users/xiangzelong/Dev/docs-template/contents/docs/cubie/a7a/getting-started/quickly-start.md`
- `docs/cubie/a7a/hardware-use/pin-gpio.md`

## 工作流步骤

### 1. 路径与命名规范检查

检查文档路径是否符合以下规范：

- **文件/目录命名**：必须使用小写 + 连字符（如 `quickly-start.md`），不允许下划线、空格或大写字母
- **目录结构**：应遵循标准结构（`getting-started/`, `hardware-use/`, `system-config/`, `app-dev/`, `low-level-dev/`, `other-system/`）
- **入口文件**：每个目录应使用 `README.md`（不是 `index.md`）
- **安装目录**：统一使用 `install-system`（不是 `install-os`）
- **嵌套深度**：避免超过 2-3 层目录

**检查项**：

- 文件名是否包含大写字母、下划线或空格？
- 目录名是否符合规范？
- 是否使用了 `index.md` 而非 `README.md`？
- 路径是否在标准目录结构中？
- README 文件是否使用 `<DocCardList />` 组件展示子目录/文档（而非文字形式的目录列表）？
- **导入路径命名一致性**：检查 `import` 语句中的文件路径是否与实际文件名完全匹配（特别注意连字符 `-` 和下划线 `_` 的使用）

### 2. 文件重命名

如果文件名不符合规范，执行重命名操作：

- 将大写字母转为小写
- 将下划线 `_` 替换为连字符 `-`
- 将空格替换为连字符 `-`
- 将 `index.md` 重命名为 `README.md`
- 将 `install-os` 目录重命名为 `install-system`

**重要**：重命名前需要先检查是否有其他文件引用此文件。

### 3. 目录创建与文档移动

如果文档应该放在某个标准目录下，但该目录不存在，则需要创建目录并移动文档：

**操作步骤**：

1. 检查文档应该归属的标准分类目录（`getting-started/`、`hardware-use/`、`system-config/` 等）
2. 如果目标目录不存在，创建该目录及其 `README.md` 文件
3. 将文档移动到正确的目录位置
4. 在 `docs/` 和 `i18n/en/...` 中搜索所有引用旧路径的链接
5. 更新所有链接指向新路径
6. 验证所有链接目标文件存在且可访问

**目录 README 要求**：

- 新创建的目录必须包含 `README.md`（不是 `index.md`）
- README 需要包含 Frontmatter（`sidebar_position`、`description` 等）
- README 应使用 `<DocCardList />` 组件展示子文档，而非文字目录

**示例**：

如果文档 `docs/cubie/a7a/wifi-config.md` 应该归属于 `system-config/` 目录：

1. 检查 `docs/cubie/a7a/system-config/` 是否存在，如不存在则创建
2. 创建 `docs/cubie/a7a/system-config/README.md`
3. 移动文档到 `docs/cubie/a7a/system-config/wifi-config.md`
4. 搜索并更新所有引用 `wifi-config.md` 的链接
5. 同步在英文文档中执行相同操作

### 4. 链接完整性检查与修复

重命名后，检查并修复所有受影响的链接：

**需要检查的链接类型**：

- Markdown 相对链接：`[文本](./path/to/file.md)` 或 `[文本](../path/to/file.md)`
- Markdown 绝对链接：`[文本](/docs/cubie/a7a/...)`
- HTML 链接：`<a href="...">...</a>`
- 图片引用：`![alt](/img/...)` 或 `<img src="/img/..." />`
- 组件导入：`import Component from './_component.mdx'`

**修复步骤**：

1. 在 `docs/` 目录下搜索所有引用旧路径的文件
2. 更新所有链接指向新路径
3. 验证链接目标文件存在
4. **验证导入路径**：检查所有 `import` 语句中的文件路径是否与实际文件名完全匹配
   - 特别注意：`common/` 目录下的 MDX 组件文件名使用下划线 `_`
   - 错误示例：`import Component from '../../common/ai/_casaos-intro_general.mdx'` ❌
   - 正确示例：`import Component from '../../common/ai/_casaos_intro_general.mdx'` ✅
   - 使用 `grep` 搜索所有导入语句，验证路径正确性

### 5. 文档分类检查

检查文档是否放置在正确的分类目录中：

**标准分类**：

- `getting-started/`：快速入门、安装系统等新手内容
- `hardware-use/`：硬件使用、接口说明、GPIO 等
- `system-config/`：系统配置、网络、远程访问等
- `app-dev/`：应用开发、SDK、框架使用等
- `low-level-dev/`：底层开发、编译系统、内核等
- `other-system/`：其他系统（Android 等）

**检查方法**：

- 根据文档内容判断是否在正确目录
- 列出可能分类错误的文档及建议分类

### 6. 同步到英文文档

对中文文档的所有修改需要同步到英文文档：

**同步路径映射**：

- 中文：`docs/cubie/a7a/getting-started/quickly-start.md`
- 英文：`i18n/en/docusaurus-plugin-content-docs/current/cubie/a7a/getting-started/quickly-start.md`

**同步操作**：

1. 如果重命名了中文文件，对应重命名英文文件
2. 如果移动了中文文件，对应移动英文文件
3. 如果修复了中文文档中的链接，同步修复英文文档中的链接
4. 检查英文文档中的图片路径（HTML `<img>` 标签应使用 `/en/img/...`）
5. 验证英文文档不包含中文字符（商标、Logo 除外）
6. **验证导入路径一致性**：
   - 检查英文文档中的所有 `import` 语句
   - 确保导入路径与 `i18n/en/.../common/` 目录下的实际文件名完全匹配
   - 文件名中的连字符 `-` 和下划线 `_` 必须与实际文件一致
   - 可使用命令验证：`grep -r "import.*from.*common/" i18n/en/ | grep "\-"`

### 7. 内容保护原则

**不要修改的内容**：

- 文档正文内容
- Frontmatter 中的 `sidebar_position`、`slug`、`description` 等
- 代码块内容
- 图片文件本身

**允许修改的内容**：

- 文件名和路径
- 文档内的链接引用（修复破损链接）
- 导入路径（如果组件被移动）

## 执行检查清单

完成工作流后，验证以下项目：

- [ ] 所有文件名使用小写 + 连字符
- [ ] 目录结构符合标准分类
- [ ] 所有内部链接可正常访问
- [ ] 英文文档已同步更新
- [ ] 英文文档不包含中文字符
- [ ] 图片路径格式正确（中文用 `/img/...`，英文 HTML 用 `/en/img/...`）
- [ ] 文档内容未被意外修改
- [ ] Frontmatter 不包含 `sidebar_label`
- [ ] **所有 `import` 语句的路径与实际文件名完全匹配**（特别检查 `common/` 目录下的组件导入）
- [ ] 开发服务器编译无错误（运行 `yarn start --locale en` 验证）

## 注意事项

1. **批量操作前备份**：如果需要重命名多个文件，建议先用 git 创建分支
2. **引用检查范围**：不仅要检查 `docs/`，还要检查 `i18n/en/...`
3. **组件引用**：`_*.mdx` 组件被引用时，更新所有导入路径
4. **侧栏配置**：如果修改了目录结构，可能需要更新侧栏配置文件
5. **Pre-commit 检查**：完成后运行 `pre-commit run --all-files` 验证
6. **导入路径命名规范**：
   - `common/` 目录下的 MDX 组件文件统一使用**下划线 `_`** 命名（如 `_casaos_intro.mdx`）
   - 导入语句中的路径必须与实际文件名**完全匹配**，包括连字符和下划线
   - 常见错误：将下划线误写为连字符（如 `_casaos-intro.mdx` 应为 `_casaos_intro.mdx`）
   - 验证方法：运行开发服务器检查是否有模块解析错误

## 示例

**输入**：`docs/cubie/a7a/Getting_Started/Quick_Start.md`

**执行结果**：

1. 检测到文件名不符合规范（大写字母、下划线）
2. 重命名为：`docs/cubie/a7a/getting-started/quickly-start.md`
3. 搜索并更新所有引用此文件的链接
4. 同步重命名英文文件：`i18n/en/.../getting-started/quickly-start.md`
5. 验证链接完整性和分类正确性
