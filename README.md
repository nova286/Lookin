![Preview](https://cdn.lookin.work/public/style/images/independent/homepage/preview_en_1x.jpg "Preview")

# Introduction
You can inspect and modify views in iOS app via Lookin, just like UI Inspector in Xcode, or another app called Reveal.

Official Website：https://lookin.work/

# Integration Guide
To use Lookin macOS app, you need to integrate LookinServer (iOS Framework of Lookin) into your iOS project.

> **Warning**
Never integrate LookinServer in Release building configuration.

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

GitHub Actions builds the Release client for every push and pull request. Every push and manual **Build Lookin Desktop** run uploads an ad-hoc signed universal app ZIP as a workflow artifact. Pushing a `v*` tag also publishes the ZIP and its SHA-256 checksum to GitHub Releases.

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

GitHub Actions 会为每次 push 和 pull request 构建 Release 客户端。每次 push 和手动运行 **Build Lookin Desktop** 都会上传经过 ad-hoc 签名的通用架构 App ZIP。推送 `v*` tag 时，还会把 ZIP 和 SHA-256 校验文件发布到 GitHub Releases。

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
