# <span id="前言">⏬JobsSoftware.MacOS</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [一、目录结构](#repository-layout)
- [二、脚本流程](#repository-script-flows)
  - [【MacOS】⏬双击浏览器跳转第三方软件官网下载.command](#jobs-toc-heading-3)
  - [【MacOS】✂️源文件压缩拆分➤子卷.command](#jobs-toc-heading-4)
  - [【MacOS】🧩子卷➤合而为一源文件.command](#jobs-toc-heading-5)

</details>
<!-- jobs-toc:end -->

[目录结构](#repository-layout) · [脚本流程](#repository-script-flows)

本仓保存 Mac 软件安装包、软件网站入口，以及大文件拆分和合并工具。

## 一、<span id="repository-layout">目录结构</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
⏬JobsSoftware.MacOS/
├── README.md / icon.png
├── *.dmg / *.zip / *.pkg                   # 本仓现有软件安装包，按实际文件名取用
├── googlechrome/
│   └── googlechrome.dmg@001of007 … @007of007
├── 【MacOS】⏬双击浏览器跳转第三方软件官网下载.command
├── 【MacOS】✂️源文件压缩拆分➤子卷.command/
│   ├── 【MacOS】✂️源文件压缩拆分➤子卷.command
│   └── README.md
└── 【MacOS】🧩子卷➤合而为一源文件.command/
    ├── 【MacOS】🧩子卷➤合而为一源文件.command
    └── README.md
```

安装包和分卷是本仓保存的文件；浏览器入口只打开预设页面，实际下载和安装仍由用户完成。拆分脚本按字节切片，不对内容做压缩。

## 二、<span id="repository-script-flows">脚本流程</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### <span id="jobs-toc-heading-3" data-jobs-toc="v2">[【MacOS】⏬双击浏览器跳转第三方软件官网下载.command](./【MacOS】⏬双击浏览器跳转第三方软件官网下载.command)</span><!-- jobs-toc:heading-end -->

> **目的：** 批量打开脚本预设的软件网站，方便在浏览器中选择下载。

* 阅读自述并确认，准备本次日志。
* 依次用系统浏览器打开预设的软件官网及指定第三方下载页。
* 在浏览器中自行核对软件和来源并下载；脚本结束时输出访问结果，不自动安装软件。

### <span id="jobs-toc-heading-4" data-jobs-toc="v2">[【MacOS】✂️源文件压缩拆分➤子卷.command](./【MacOS】✂️源文件压缩拆分➤子卷.command/【MacOS】✂️源文件压缩拆分➤子卷.command)</span><!-- jobs-toc:heading-end -->

> **目的：** 把超过所选体积阈值的文件拆成连续编号子卷，便于分批保存或传输。

* 阅读说明，选择是否自检依赖，再设置分卷阈值（默认 50 MB，也可选预设或自定义值）。
* 选择单个文件或一个目录作为来源。
  * 目录模式只处理该目录第一层中超过阈值的文件，不递归扫描。
* 为符合条件的文件建立同名目录，按原文件名和 `@001ofNNN` 格式生成编号子卷。
* 检查生成结果，再决定是否删除原文件。
  * 只有精确输入 `YES` 才删除；其它输入保留原文件。

### <span id="jobs-toc-heading-5" data-jobs-toc="v2">[【MacOS】🧩子卷➤合而为一源文件.command](./【MacOS】🧩子卷➤合而为一源文件.command/【MacOS】🧩子卷➤合而为一源文件.command)</span><!-- jobs-toc:heading-end -->

> **目的：** 按编号顺序把已有子卷合并回完整文件。

* 阅读说明，选择是否自检依赖，再选择保存分卷的目录。
* 识别编号分卷组，选择单组或全部处理，并核对分卷是否齐全。
* 按编号拼接并生成原文件。
  * 输出文件已存在时，直接回车会覆盖，输入非空内容则跳过该项。
* 合并完成后决定是否删除子卷目录。
  * 只有精确输入 `YES` 才删除；其它输入保留子卷。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
