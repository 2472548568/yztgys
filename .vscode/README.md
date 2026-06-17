# VS Code 使用指南

> 本目录用于让后台管理端模板在 VS Code 中也能顺手使用。Codex 的 `.codex/skills/` 仍然保留；在 VS Code 中，可通过 Copilot Chat、Continue、Cline 等 AI 助手读取本说明和 `.github/copilot-instructions.md` 来遵守同一套后台框架。

## 推荐打开方式

1. 用 VS Code 打开整个 `后台管理端模板` 根目录。
2. 先阅读根目录 `README.md`。
3. 所有 PRD、原型、图表、操作手册都按既有后台目录输出，不新建杂乱目录。

## AI 助手使用原则

- 开始任务前，先让 AI 读取 `README.md`、`设计规范/设计规范.md` 和 `设计规范/01-后台管理端规范.md`。
- 写 PRD 时，使用后台功能模板，不生成大一统 SRS 文档。
- 后台管理端遵守 `Vue 3 + Ant Design Vue + Vite`。
- 只生成后台管理端页面，不生成其他端页面、Vant 组件或手机端布局。
- 原型改动同步 PRD 时，必须先生成 `变更差异报告.md`，确认后再改 PRD。
- 交付物统一放入 `交付物/` 下的对应目录。

## 常用 Prompt 文件

- `backend-prd.prompt.md`：生成后台管理端功能 PRD。
- `backend-prototype.prompt.md`：生成后台管理端原型。
- `prototype-sync-prd.prompt.md`：原型变更反向同步 PRD。
- `operation-manual.prompt.md`：生成操作手册。
- `upgrade-old-project.prompt.md`：老项目升级迁移。

## 本地预览原型

```bash
python3 -m http.server 8000
```

浏览器访问：

```text
http://localhost:8000
```
