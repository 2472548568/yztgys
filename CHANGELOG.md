# 版本迭代记录

本文件用于记录项目每一次需求、设计、PRD、原型、交付物和工程配置的修改。每次提交前应同步更新本文件，保证后续可以追溯“改了什么、为什么改、影响哪些文件”。

## 记录规则

- 当前版本号维护在根目录 `VERSION`。
- 每次有效迭代都在 `CHANGELOG.md` 新增一条记录。
- 版本号建议使用 `主版本.次版本.修订号`：
  - 主版本：项目结构、技术路线或交付范围发生重大变化。
  - 次版本：新增模块、页面、PRD、原型、设计规范或交付物。
  - 修订号：文案修正、规则补充、小范围调整。
- 每条记录至少包含：日期、版本号、修改内容、影响范围。
- Git 提交说明应和本文件记录保持一致。

## [0.2.0] - 2026-06-17

### 新增

- 新增真实前端工程骨架，正式引入 `Vue 3 + Vite + Ant Design Vue`。
- 新增 `package.json`、`package-lock.json`、`vite.config.js`、根 `index.html` 和 `src/` 目录。
- 新增 `.gitignore`，忽略依赖、构建产物和本地环境文件。
- 新增后台主布局 `src/layouts/SupplierLayout.vue`。
- 新增概览页面 `src/views/OverviewView.vue`。
- 新增全局主题样式 `src/styles/theme.css`，对齐样例图视觉规范。
- 依赖安装后已执行 `npm audit fix --force`，当前 npm audit 结果为 0 vulnerabilities。

### 影响范围

- `package.json`
- `package-lock.json`
- `vite.config.js`
- `index.html`
- `.gitignore`
- `src/`
- `VERSION`
- `CHANGELOG.md`

## [0.1.0] - 2026-06-17

### 新增

- 初始化后台管理端项目模板。
- 建立原始需求、PRD、设计规范、后台原型、变更同步、图表、操作手册等目录结构。
- 添加 Codex skill、GitHub Prompt、VS Code 说明等辅助工作流。
- 添加后台视觉参考图 `设计规范/assets/backend-style-reference.png`。
- 新增版本管理文件 `VERSION` 和 `CHANGELOG.md`。

### 调整

- 将项目范围收敛为只做后台管理端，移除可生成移动端的规范入口和双端说明。
- 将设计规范更新为样例图风格：深色顶栏、白色侧栏、浅灰内容区、紫色操作强调、密集订单表格。

### 影响范围

- `README.md`
- `设计规范/`
- `.codex/skills/`
- `.github/prompts/`
- `.vscode/`
- `PRD/`
- `原型/`
- `变更同步/`
- `交付物/`
