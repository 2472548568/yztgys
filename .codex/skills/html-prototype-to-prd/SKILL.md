---
name: html-prototype-to-prd
description: Convert existing HTML prototype systems into structured PRD artifacts, including module architecture baselines, page-menu mapping, field extraction, interaction rules, screenshots, validation reports, merged PRD files, and DOCX-ready outputs. Use for requests like HTML原型转PRD, 根据原型生成PRD, 从原型提取需求, 生成00-功能模块架构, or reverse-engineer product requirements from prototype pages.
---

# HTML Prototype To PRD

Generate PRD documents from an existing HTML prototype. Treat the prototype as the source of truth for menus, fields, controls, interactions, states, and visible business rules.

This skill supports two modes:

- Initial reverse generation: create PRDs from a prototype when no reliable PRD exists.
- Incremental sync: compare a modified prototype with existing PRDs, generate a change report first, then update PRDs only after the user confirms the sync scope.

## Expected Repository Layout

Default input and output:

- Backend input root: `<workspace>/原型/后台管理端/<系统名>/`
- Backend output root: `<workspace>/PRD/<系统名>/后台管理端/`
- Backend sync root: `<workspace>/变更同步/<系统名>/后台管理端/`
- Baseline: `<workspace>/PRD/<系统名>/00-功能模块架构.md`

## Initial Reverse Generation Workflow

1. Determine the backend system name from the prototype path.
2. Read all `.html` files for the target system. Do not infer only from filenames.
3. Locate the main frame page, usually `index.html`, by scoring menu completeness, iframe/content area, navigation links, and page title evidence.
4. Generate or update `00-功能模块架构.md` as the single baseline for all module IDs, function IDs, and page mappings.
5. Capture or reference screenshots for business pages when feasible.
6. Generate one PRD per function under the backend output directory.
7. Validate coverage:
   - every menu item maps to a module/function
   - every business page maps to the baseline
   - every generated PRD traces back to the baseline
   - fields, states, and actions come from prototype evidence
   - only backend pages are documented

## Incremental Sync Workflow

Use this workflow when PRDs already exist and the user modified the prototype.

1. Determine the backend system name from the prototype path.
2. Read the latest prototype and extract evidence:
   - page routes and menu entries
   - visible fields, table columns, detail fields, form controls
   - buttons, batch actions, toolbar actions
   - modals, drawers, dialogs
   - validation messages, empty/error/loading states
   - permissions, status tags, state transitions when visible
3. Read existing PRDs under the backend PRD directory and the baseline.
4. Compare prototype evidence with existing PRDs and classify changes:
   - new page
   - removed page
   - changed page entrance
   - added/removed/changed field
   - added/removed/changed operation
   - changed validation/rule/state
   - changed permission or data scope
   - copy/layout-only change
5. Write a change report first:
   - Backend: `变更同步/<系统名>/后台管理端/变更差异报告.md`
6. Do not update PRDs until the user confirms which changes should sync.
7. After confirmation, update only the affected PRD files and `00-功能模块架构.md`.
8. Write a sync record:
   - Backend: `变更同步/<系统名>/后台管理端/同步记录.md`

## Sync Safety Rules

- Never overwrite an existing PRD wholesale during incremental sync.
- Preserve user-authored sections unless prototype evidence directly changes them.
- If a prototype change contradicts PRD business rules, mark it as `需要确认` instead of deciding silently.
- Copy/layout/style changes should not update PRD unless they affect fields, actions, states, rules, permissions, or user understanding.
- New prototype evidence can update field lists, page mappings, interaction flows, validation rules, status rules, permissions, and acceptance criteria.
- Removed prototype elements should be marked as candidate removals in the change report before deleting them from PRD.
- Keep sync reports under the backend sync directory.

## Field Extraction Priority

Use this order when extracting fields:

1. Explicit form controls: `input`, `select`, `textarea`
2. Detail page key-value fields
3. Table/grid headers
4. Modal/drawer fields
5. Confirmed script text, validation messages, or comments

For each field, include name, type, requiredness, validation, editability, enum values if any, and source page/function.

## PRD Rules

- Functional PRDs must start with `# FXXX-功能名称`.
- Keep section order aligned with the backend function PRD template.
- Use `PRD/<系统名>/后台管理端/M01-模块名称/F001-功能名称.md` as the backend function PRD template when present.
- Include target side and prototype path in page mappings.
- 后台管理端 PRDs should preserve table fields, filters, toolbar actions, batch actions, modal/drawer fields, permissions, and pagination.
- Remove unused optional sections instead of leaving empty headings.
- Do not invent fields, APIs, roles, states, or permissions that are not supported by prototype evidence; mark unclear items as pending confirmation.

## Recommended Prompts

Generate a diff report only:

```text
使用 html-prototype-to-prd，对比 原型/后台管理端/系统名称/ 和 PRD/系统名称/后台管理端/，生成变更同步差异报告，输出到 变更同步/系统名称/后台管理端/变更差异报告.md。先不要修改 PRD。
```

Apply confirmed changes:

```text
根据 变更同步/系统名称/后台管理端/变更差异报告.md 中我确认的同步项，更新 PRD/系统名称/后台管理端/ 和 PRD/系统名称/00-功能模块架构.md，并输出同步记录到 变更同步/系统名称/后台管理端/同步记录.md。
```
