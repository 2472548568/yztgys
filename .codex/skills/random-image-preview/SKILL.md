---
name: random-image-preview
description: Provide realistic random placeholder images for HTML prototypes, product mockups, avatars, banners, upload previews, demo UI states, and Chinese requests such as 图片预览, 演示图片, 随机图片, 占位图片. Use when Codex needs image URLs for prototype/demo content without creating or storing real image assets.
---

# Random Image Preview

Use Picsum Photos for all random/demo image previews in prototypes unless the user asks for a specific brand, product, or uploaded asset.

## Project Priority

For this project, prefer reusable shared mock assets before remote placeholder URLs:

1. Use the online shared mock asset library when `onlineBaseUrl` is available.
2. Reuse a shared local source library and sync it into the target prototype with `工具/同步mock素材.sh` for offline demos.
3. Use local synced mock assets from `原型/后台管理端/系统名称/assets/images/mock/`.
4. Use business-themed remote images when shared assets are missing.
5. Use Picsum only for early drafts or non-critical images.

Follow `设计规范/03-演示素材规范.md`.
See online asset config examples in `在线素材库/` and `原型/素材库配置.example.js`.

Local folders:

```text
assets/images/mock/products/   商品图片
assets/images/mock/avatars/    头像图片
assets/images/mock/banners/    横幅图片
assets/images/mock/receipts/   单据票据
assets/images/mock/stores/     门店现场
assets/images/mock/uploads/    上传预览
assets/images/mock/empty/      空状态图
assets/images/mock/icons/      业务图标
```

## Core Pattern

Use `https://picsum.photos/{width}/{height}?random={seed}`.

Common sizes:

- Product thumbnail: `https://picsum.photos/60/60?random=1`
- Product image: `https://picsum.photos/100/100?random=1`
- Avatar: `https://picsum.photos/40/40?random=1`
- Banner/header: `https://picsum.photos/750/300?random=1`
- Large preview: `https://picsum.photos/200/200?random=1`

Project-side sizes:

- Backend table thumbnail: `https://picsum.photos/48/48?random=1`
- Backend detail preview: `https://picsum.photos/160/120?random=1`

Business-themed remote fallback:

- Product/card image: `https://loremflickr.com/343/180/product?random=101`
- Store/warehouse image: `https://loremflickr.com/343/180/store?random=102`
- Receipt/document image: `https://loremflickr.com/320/200/document?random=103`
- Avatar initials: `https://api.dicebear.com/9.x/initials/svg?seed=张三`

## Implementation Guidance

- Use stable `random` seeds so previews stay visually stable across reloads.
- Use different seeds for repeated list items.
- Match image dimensions to the rendered container to avoid layout jumps.
- Use normal `img` elements with `object-fit: cover` for product cards, avatars, and banners.
- For backend prototypes, keep images compact in tables and use larger previews only in detail pages or upload components.
- For high-fidelity prototypes, use local relative paths such as `./assets/images/mock/products/product-001.jpg`.
