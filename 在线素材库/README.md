# 在线素材库

> 本目录是在线 mock 素材库的部署说明和示例配置。实际图片可以放在独立仓库、对象存储、Netlify、GitHub Pages 或任意静态资源服务中。

## 推荐结构

在线素材库建议保持和项目内 mock 目录一致：

```text
mock-assets/
├── products/
│   ├── product-001.jpg
│   └── product-002.jpg
├── avatars/
│   └── avatar-001.png
├── banners/
│   └── banner-001.jpg
├── receipts/
│   └── receipt-001.jpg
├── stores/
│   └── store-001.jpg
├── uploads/
│   └── upload-001.jpg
├── empty/
│   └── empty-list.png
├── icons/
│   └── icon-order.png
└── manifest.json
```

## 访问方式

部署后会得到一个基础地址，例如：

```text
https://assets.example.com/mock-assets/
```

原型中直接引用：

```html
<img src="https://assets.example.com/mock-assets/products/product-001.jpg" alt="商品图">
```

也可以在 JS 中统一配置：

```js
const MOCK_ASSET_BASE_URL = 'https://assets.example.com/mock-assets/'

const productImage = `${MOCK_ASSET_BASE_URL}products/product-001.jpg`
```

## 推荐部署方式

| 方式 | 适合场景 | 说明 |
|---|---|---|
| Netlify | 个人快速部署 | 上传素材目录即可获得 HTTPS 地址 |
| GitHub Pages | 开源/团队素材库 | 适合版本管理和多人协作 |
| 阿里云 OSS / 腾讯云 COS / 七牛云 | 正式团队资产 | 适合稳定 CDN、权限和大文件 |
| 内网静态服务器 | 企业内网演示 | 适合不允许公网访问的项目 |

## 项目使用原则

- 多项目复用时，优先使用在线素材库 URL。
- 需要离线演示时，再用 `工具/同步mock素材.sh` 同步成本地副本。
- 在线素材库图片命名必须稳定，不要随意覆盖不同含义的同名图片。
- 不要上传真实客户隐私数据、真实手机号、身份证、合同原件等敏感素材。
