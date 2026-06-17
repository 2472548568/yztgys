# 后台管理端原型目录

在这里放置后台管理端 HTML/CSS/JavaScript 静态原型。

推荐结构：

```text
原型/后台管理端/系统名称/
├── index.html
├── pages/
├── assets/
│   ├── css/
│   ├── js/
│   └── images/
│       └── mock/
└── data/
```

高保真图片预览请优先使用：

```text
原型/后台管理端/系统名称/assets/images/mock/
```

生成原型时建议使用：

```text
使用 prototype-generator，根据 PRD/系统名称/后台管理端、设计规范/00-全局规范.md 和 设计规范/01-后台管理端规范.md 生成后台管理端 HTML 原型，输出到 原型/后台管理端/系统名称/。技术风格必须遵守 Vue 3 + Ant Design Vue，不得使用 Vant 风格组件。
```
