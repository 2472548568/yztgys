# 图表

> 本目录用于存放由 `diagram-generator` 生成的流程图、架构图、时序图、泳道图、ER 图、UML 图、组织架构图等图表资产。

## 目录结构

```text
交付物/图表/
└── 系统名称/
    ├── src/
    │   └── <模块>-<描述>.xml
    └── <模块>-<描述>.png
```

## 使用原则

- 图表源文件统一保存为 draw.io XML。
- 渲染图片统一保存为 PNG 或 SVG。
- PRD、操作手册、汇报材料需要图表时，优先引用本目录下的统一图表资产。
- 文件名使用英文、数字和短横线，不使用中文文件名。

## 推荐图表

- `system-architecture.png`：系统功能架构图。
- `business-flow.png`：核心业务流程图。
- `<功能>-operation-flow.png`：功能操作流程图。
- `<功能>-sequence.png`：功能时序图。
- `role-permission.png`：角色权限关系图。
