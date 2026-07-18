![Preview](https://cdn.lookin.work/public/style/images/independent/homepage/preview_en_1x.jpg "Preview")

# Introduction
You can inspect and modify views in iOS app via Lookin, just like UI Inspector in Xcode, or another app called Reveal.

Official Website：https://lookin.work/

Fork maintenance notes: [Imported Upstream Patches](UPSTREAM_PATCHES.md)

# Integration Guide
To use Lookin macOS app, you need to integrate LookinServer (iOS Framework of Lookin) into your iOS project.

> **Warning**
Never integrate LookinServer in Release building configuration.

# Standalone CLI

This repository also includes `lookinctl`, an adb-like standalone CLI for apps that integrate LookinServer. It talks to LookinServer directly and does not depend on `Lookin.app`.

Practical skills include:

- list connected LookinServer apps and select targets by serial, bundle id, app name, or index
- capture high-quality screenshots
- dump the view hierarchy as JSON
- find the current business view controller
- inspect coordinates with hit-test
- perform best-effort semantic tap with explicit machine-readable failure reasons
- inspect attributes, selectors, objects, images, gesture recognizers, and runtime patches

See [`LookinCLI/README.md`](LookinCLI/README.md) for CLI usage and [`Docs/lookinctl使用与维护.md`](Docs/lookinctl使用与维护.md) for development, build, publish, and directory structure design.

## via CocoaPods:
### Swift Project
`pod 'LookinServer', :subspecs => ['Swift'], :configurations => ['Debug']`
### Objective-C Project
`pod 'LookinServer', :configurations => ['Debug']`
## via Swift Package Manager:
`https://github.com/QMUI/LookinServer/`

## Experimental SwiftUI inspector

This fork pairs with the `codex/swiftui-attached-macro` branch of [nova286/LookinServer](https://github.com/nova286/LookinServer). When the inspected app exposes SwiftUI semantic nodes, the toolbar shows a **SwiftUI** mode with source types and source locations. Registered nodes provide editable temporary overrides for size, offset, scale, visibility, opacity, and background color. After an edit, Lookin automatically reloads the hierarchy and screenshot while preserving the selected node and expansion state.

Build the client with:

```bash
pod install
xcodebuild -workspace Lookin.xcworkspace -scheme LookinClient -configuration Debug -destination 'platform=macOS' build
```

These controls are intended only for local debugging. The matching server package must remain excluded from production app binaries.

## Automated macOS builds

GitHub Actions builds the Release client and universal `lookinctl` binary for every push and pull request. Every push and manual **Build Lookin Desktop** run uploads the ad-hoc signed app ZIP, CLI archive, and SHA-256 checksums as workflow artifacts. Pushing a `v*` tag publishes the same files to GitHub Releases.

# Repository
LookinServer: https://github.com/QMUI/LookinServer

macOS app: https://github.com/hughkli/Lookin/

# Tips
- How to display custom information in Lookin: https://bytedance.larkoffice.com/docx/TRridRXeUoErMTxs94bcnGchnlb
- How to display more member variables in Lookin: https://bytedance.larkoffice.com/docx/CKRndHqdeoub11xSqUZcMlFhnWe
- How to turn on Swift optimization for Lookin: https://bytedance.larkoffice.com/docx/GFRLdzpeKoakeyxvwgCcZ5XdnTb
- Documentation Collection: https://bytedance.larkoffice.com/docx/Yvv1d57XQoe5l0xZ0ZRc0ILfnWb

# Acknowledgements
https://qxh1ndiez2w.feishu.cn/docx/YIFjdE4gIolp3hxn1tGckiBxnWf

---
# 简介
Lookin 可以查看与修改 iOS App 里的 UI 对象，类似于 Xcode 自带的 UI Inspector 工具，或另一款叫做 Reveal 的软件。

官网：https://lookin.work/

# 安装 LookinServer Framework
如果这是你的 iOS 项目第一次使用 Lookin，则需要先把 LookinServer 这款 iOS Framework 集成到你的 iOS 项目中。

> **Warning**
记得不要在 AppStore 模式下集成 LookinServer。

# 独立 CLI

本仓库也包含 `lookinctl`，它是一个接近 adb 命令风格的独立 CLI。它直接连接已集成 LookinServer 的 App，不依赖 `Lookin.app`。

实用能力包括：

- 列出已连接的 LookinServer App，并按 serial、bundle id、App 名称或 index 选择目标
- 截取高清当前页面截图
- 导出视图层级 JSON
- 定位当前业务 View Controller
- 对坐标执行 hit-test
- 执行尽力而为的语义点击，并在不可点击时返回明确、可机器读取的失败原因
- 查看属性、selector、对象、图片、手势状态和运行时 patch

CLI 使用见 [`LookinCLI/README.md`](LookinCLI/README.md)，开发、构建、发布和目录结构设计见 [`Docs/lookinctl使用与维护.md`](Docs/lookinctl使用与维护.md)。

## 通过 CocoaPods：

### Swift 项目
`pod 'LookinServer', :subspecs => ['Swift'], :configurations => ['Debug']`
### Objective-C 项目
`pod 'LookinServer', :configurations => ['Debug']`

## 通过 Swift Package Manager:
`https://github.com/QMUI/LookinServer/`

## 实验性 SwiftUI Inspector

此 fork 与 [nova286/LookinServer](https://github.com/nova286/LookinServer) 的 `codex/swiftui-attached-macro` 分支配套使用。被检查的 App 暴露 SwiftUI 语义节点后，工具栏会出现独立的 **SwiftUI** 模式，显示真实源码类型和源码位置。每个注册节点都提供尺寸、偏移、缩放、隐藏、透明度和背景色等临时调试属性；修改后客户端会自动重新抓取层级与截图，并保留当前选中节点和展开状态。

客户端构建命令：

```bash
pod install
xcodebuild -workspace Lookin.xcworkspace -scheme LookinClient -configuration Debug -destination 'platform=macOS' build
```

这些能力只用于本地调试，配套 Server 包必须继续从生产 App 二进制中排除。

## 自动构建 macOS 客户端

GitHub Actions 会为每次 push 和 pull request 构建 Release 客户端和通用架构 `lookinctl`。每次 push 和手动运行 **Build Lookin Desktop** 都会上传经过 ad-hoc 签名的 App ZIP、CLI 压缩包及 SHA-256 校验文件；推送 `v*` tag 时会把同一组文件发布到 GitHub Releases。

# 源代码仓库

iOS 端 LookinServer：https://github.com/QMUI/LookinServer

macOS 端软件：https://github.com/hughkli/Lookin/

# 技巧
- 如何在 Lookin 中展示自定义信息: https://bytedance.larkoffice.com/docx/TRridRXeUoErMTxs94bcnGchnlb
- 如何在 Lookin 中展示更多成员变量: https://bytedance.larkoffice.com/docx/CKRndHqdeoub11xSqUZcMlFhnWe
- 如何为 Lookin 开启 Swift 优化: https://bytedance.larkoffice.com/docx/GFRLdzpeKoakeyxvwgCcZ5XdnTb
- 文档汇总：https://bytedance.larkoffice.com/docx/Yvv1d57XQoe5l0xZ0ZRc0ILfnWb

# 鸣谢
https://qxh1ndiez2w.feishu.cn/docx/YIFjdE4gIolp3hxn1tGckiBxnWf
