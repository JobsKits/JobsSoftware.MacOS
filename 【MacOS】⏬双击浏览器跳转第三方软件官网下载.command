#!/bin/zsh
# 脚本自述：
# - 脚本名称：【MacOS】⏬双击浏览器跳转第三方软件官网下载.command
# - 核心用途：执行“⏬双击浏览器跳转第三方软件官网下载”对应的快捷打开任务。
# - 影响范围：主要影响应用启动与路径跳转，不主动改写业务文件。
# - 运行提示：运行后会先打印内置自述；终端模式按回车确认后继续，按 Ctrl+C 可取消。


# 仅渲染自述：标题红色加粗，编号正文蓝色常规字重；非彩色终端输出纯文本。
jobs_intro_style() {
  local intro_color=0
  if [ -t 1 ] && [ -n "${TERM:-}" ] && [ "${TERM:-}" != dumb ] &&
     [ -z "${NO_COLOR+x}" ] && [ "${PLAIN_OUTPUT:-0}" != 1 ] &&
     [ "${IS_SOURCETREE_RUNTIME:-0}" != 1 ]; then
    intro_color=1
  fi
  /usr/bin/awk -v color="$intro_color" -v role="${1:-body}" '
    BEGIN { esc = sprintf("%c", 27) }
    {
      gsub(esc "\\[[0-9;]*m", "")
      gsub(/\\(033|e|x1[bB])\[[0-9;]*m/, "")
      if (!color || $0 ~ /^[[:space:]]*$/) { print; next }
      numbered = ($0 ~ /^[[:space:]➤ℹ🔹✔⚠]*([0-9]+[、.)）]|[0-9]+️⃣|[-•])/)
      heading = ($0 ~ /^[[:space:]]*#{1,6}[[:space:]]/ || $0 ~ /[：:][[:space:]]*$/ || $0 ~ /^[[:space:]]*[=━─-]{3}/)
      title = (!numbered && (role == "title" || heading))
      if (role == "auto" && !seen && !numbered) title = 1
      if ($0 !~ /^[[:space:]]*[=━─-]+[[:space:]]*$/) seen = 1
      printf "%s%s%s\n", esc (title ? "[1;31m" : "[0;34m"), $0, esc "[0m"
    }
  '
}
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
  print -r -- '============================== 脚本内置自述 ==============================' | jobs_intro_style title
  print -r -- '脚本名称：【MacOS】⏬双击浏览器跳转第三方软件官网下载.command' | jobs_intro_style title
  print -r -- '核心用途：执行“⏬双击浏览器跳转第三方软件官网下载”对应的快捷打开任务。' | jobs_intro_style body
  print -r -- '影响范围：主要影响应用启动与路径跳转，不主动改写业务文件。' | jobs_intro_style body
  print -r -- '取消方式：确认前按 Ctrl+C 终止，不会继续执行后续业务。' | jobs_intro_style body
  print -r -- '============================================================================' | jobs_intro_style title
  echo "" | jobs_intro_style body
  read -r "?👉 已了解脚本用途与影响，按回车继续；按 Ctrl+C 取消：" _
}
# 依次打开第三方软件的官方或指定下载页面。
open_download_pages() {
  local url=""
  local urls=(
    "https://www.hammerspoon.org/"
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
    "https://pdfexpert.com/"
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
