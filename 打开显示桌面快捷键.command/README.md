# 打开显示桌面快捷键

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、功能与运行边界](#capabilities)
- [二、目录结构](#layout)
- [三、运行与设置](#usage)
- [四、常见问题与手动入口](#troubleshooting)
- [五、验证范围](#validation)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

[打开显示桌面快捷键.command](./打开显示桌面快捷键.command) 用于在 [**macOS**](https://www.apple.com/macos/) 中快速前往“桌面与程序坞 → 调度中心 → 快捷键”，方便手动配置“显示桌面”。脚本负责打开设置入口，不会自动启用、绑定或触发快捷键。

## 一、<span id="capabilities">功能与运行边界</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 当前行为 |
| --- | --- |
| 核心操作 | 使用系统 `open` 命令打开快捷键设置的深层链接。 |
| 快捷键配置 | 在系统设置中手动选择“显示桌面”的按键，脚本不修改偏好。 |
| 运行交互 | 直接发起打开请求，没有运行时自述、回车确认或选择菜单。 |
| 参数与依赖 | 无自定义参数，仅使用系统预置的 `zsh` 和 `open`。 |
| 文件与日志 | 不生成业务文件或独立日志，不下载、不安装软件。 |
| 兼容范围 | 依赖系统对该设置链接的支持；不同 macOS 版本的跳转效果须实际确认，不承诺全部版本均能直达。 |

当前脚本实际执行：

```shell
exec /usr/bin/open 'x-apple.systempreferences:com.apple.Desktop-Settings.extension?Shortcuts'
```

`open` 返回成功只表示打开请求已交给系统，不代表目标面板已正确展开，也不代表快捷键配置完成。

## 二、<span id="layout">目录结构</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
打开显示桌面快捷键.command/
├── 打开显示桌面快捷键.command
└── README.md
```

[返回仓库说明](../README.md)

## 三、<span id="usage">运行与设置</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

1、打开本目录，双击其中的 `打开显示桌面快捷键.command` 文件；外层同名目录只是工具包。

2、等待系统设置打开。在“桌面与程序坞”页面的“调度中心”区域找到“快捷键”，选择“显示桌面”的按键。

3、返回桌面，按所选快捷键确认效果。不需要修改时直接关闭设置窗口；脚本本身没有撤回步骤，已手动调整的按键需在同一页面重新选择。

也可以在本 README 所在目录的终端执行：

```shell
./打开显示桌面快捷键.command
```

若文件缺少执行权限，可直接指定系统解释器运行，无需修改文件权限：

```shell
zsh ./打开显示桌面快捷键.command
```

## 四、<span id="troubleshooting">常见问题与手动入口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- **只打开了设置页面，没有展开快捷键：** 在“桌面与程序坞”中向下滚动到“调度中心”，手动点按“快捷键”。系统版本不同可能影响深层链接定位。
- **没有成功打开设置：** 从苹果菜单进入“系统设置 → 桌面与程序坞”，再找到“调度中心 → 快捷键”。设置位置参见 [Apple 官方说明](https://support.apple.com/zh-cn/guide/mac-help/mchlp1119/mac)。
- **双击提示权限不足，或文件被编辑器打开：** 使用上面的 `zsh` 命令运行，并查看终端错误；无需使用管理员权限。
- **运行后仍未显示桌面：** 先在设置中完成按键选择，再实际按下该快捷键；运行脚本本身只打开设置入口。

## 五、<span id="validation">验证范围</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

文档按现有脚本行为编写，交付核对脚本静态语法、相对链接和目录结构；未实际打开系统设置或修改快捷键，深层链接在各系统版本中的跳转效果仍需实际确认。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
