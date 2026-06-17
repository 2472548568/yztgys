---
name: prototype-generator
description: Generate professional static HTML/CSS/JavaScript prototype systems from requirements or PRDs. This project only supports backend prototypes that emulate Vue 3 + Ant Design Vue. Use for 创建原型, 生成原型, 原型开发, 原型设计, 根据需求生成HTML原型, 检查页面交互, or repair prototype interactions.
---

# Prototype Generator

Build static prototype systems that can be opened by a local HTTP server. Use the repository's existing prototype conventions when present.

## Project Defaults

This project supports one prototype target:

| Target | Required PRD Input | Required Design Specs | Output Root | UI Style |
|---|---|---|---|---|
| 后台管理端 | `PRD/<系统名称>/后台管理端/` | `设计规范/00-全局规范.md`, `设计规范/01-后台管理端规范.md` | `原型/后台管理端/<系统名称>/` | Vue 3 + Ant Design Vue |

If the user does not specify a target, use 后台管理端.

## Workflow

1. Analyze requirements deeply:
   - target side: 后台管理端
   - system boundary and business domain
   - roles and permissions
   - core business objects and states
   - feature list and page routing
   - interaction rules and edge cases
   - mock data model
2. Read the global spec and the target-side spec before generating UI.
3. Generate the main frame and business pages.
   - 后台管理端: use a desktop admin frame with side menu, top bar, content area, tables, filters, modals, drawers, pagination, permissions.
4. Verify navigation, modals, forms, filters, tables, conditional buttons, and mock state transitions.
5. Run bundled checkers when useful, then fix reported issues.

## Recommended Output Shape

后台管理端:

```text
原型/后台管理端/<系统名称>/
├── index.html
├── pages/
├── assets/
│   ├── css/
│   ├── js/
│   └── images/
└── data/
```

## UI Boundary Rules

- 后台管理端 must emulate Ant Design Vue patterns. Do not use Vant, mobile Tabbar as the main frame, mobile Picker, or mobile card-only navigation.
- Shared colors, status meanings, typography base, copy tone, and empty/error states come from `设计规范/00-全局规范.md`.
- Static HTML can use plain CSS/JS and local helper code, but the visual and interaction patterns must match the target UI library.

## Prototype Quality Rules

- Build the actual usable prototype first, not a marketing landing page.
- Use realistic mock data and meaningful empty/error/success states.
- Implement visible controls that match the business workflow.
- Keep page links and iframe routes working.
- Use Picsum placeholders for demo images when `random-image-preview` is available and no real image assets are provided.
- After frontend changes, preview through a local server and verify desktop layouts when feasible.
- Before delivery, check the target-side验收清单 in the corresponding design spec.
