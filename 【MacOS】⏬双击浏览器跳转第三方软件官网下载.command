#!/bin/zsh
# 脚本自述：
# - 脚本名称：【MacOS】⏬双击浏览器跳转第三方软件官网下载.command
# - 核心用途：执行“⏬双击浏览器跳转第三方软件官网下载”对应的快捷打开任务。
# - 影响范围：主要影响应用启动与路径跳转，不主动改写业务文件。
# - 运行提示：运行后会先打印内置自述；终端模式按回车确认后继续，按 Ctrl+C 可取消。


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
SCRIPT_PATH="${SCRIPT_DIR}/$(basename -- "$0")"
SCRIPT_BASENAME="$(basename "$0" | sed 's/\.[^.]*$//')"
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"
# 同步输出终端信息与日志文件。
log() { print -r -- "$1" | tee -a "$LOG_FILE"; }
# 输出普通提示信息。
info_echo() { log "ℹ $1"; }
# 输出完成信息。
success_echo() { log "✔ $1"; }
# 展示脚本内置自述，并等待用户确认后执行。
show_script_intro_and_wait() {
  print -r -- '============================== 脚本内置自述 =============================='
  print -r -- '脚本名称：【MacOS】⏬双击浏览器跳转第三方软件官网下载.command'
  print -r -- '核心用途：执行“⏬双击浏览器跳转第三方软件官网下载”对应的快捷打开任务。'
  print -r -- '影响范围：主要影响应用启动与路径跳转，不主动改写业务文件。'
  print -r -- '取消方式：确认前按 Ctrl+C 终止，不会继续执行后续业务。'
  print -r -- '============================================================================'
  echo ""
  read -r "?👉 已了解脚本用途与影响，按回车继续；按 Ctrl+C 取消：" _
}
# 依次打开第三方软件的官方或指定下载页面。
open_download_pages() {
  local url=""
  local urls=(
    "https://zh.snipaste.com/"
    "https://www.google.com/intl/zh-CN/chrome/"
    "https://telegram.org/"
    "https://code.visualstudio.com/"
    "https://developer.android.com/studio"
    "https://mac.macxz.com/"
    "https://apps.apple.com/cn/app/超级右键-irightmouse/id1497428978?mt=12"
    "https://lookin.work/get/"
    "https://www.figma.com/downloads/"
    "https://claude.ai/downloads"
    "https://chatgpt.com/zh-Hans-CN/download/"
    "https://chatgpt.com/zh-Hans-CN/features/desktop/"
    "https://www.videolan.org/"
    "https://chigusa-web.com/clibor-for-mac-en/download/"
    "https://openai.com/codex/"
    "https://otty.sh/"
    "https://github.com/borawong/AiMaMi/releases"
  )

  for url in "${urls[@]}"; do
    info_echo "打开下载页面：$url"
    open "$url"
  done
}
# 编排脚本的高层业务流程。
# 初始化脚本运行环境，并集中承载原有的顶层执行逻辑。
initialize_script_runtime() {
  setopt NO_NOMATCH
  : > "$LOG_FILE"
}
# 编排脚本的高层业务流程。
main() {
  # 展示脚本内置自述，并按运行入口完成防误触确认。
  show_script_intro_and_wait
  # 初始化 Shell 选项、日志、依赖和入口运行状态。
  initialize_script_runtime
  # 执行 open_download_pages 对应的独立业务步骤。
  open_download_pages
  # 输出脚本执行结果、摘要和日志位置。
  success_echo "全部下载页面已打开。日志：$LOG_FILE"
}

main "$@"
