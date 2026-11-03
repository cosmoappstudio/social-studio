#!/bin/bash
# PreToolUse(Bash): block destructive commands. Exit 2 = block (stderr shown to Claude).
INPUT=$(cat)
CMD=$(printf '%s' "$INPUT" | python3 -c 'import sys,json;print(json.load(sys.stdin).get("tool_input",{}).get("command",""))' 2>/dev/null)
[ -z "$CMD" ] && exit 0
block() { echo "BLOCKED by guard-bash: $1. Ask the user to run it themselves if intended." >&2; exit 2; }
case "$CMD" in
  *"rm -rf /"*|*"rm -rf ~"*|*"rm -rf \$HOME"*|*"rm -rf *"*) block "recursive force delete";;
  *"git push"*"--force"*|*"git push"*" -f"*|*"git reset --hard"*|*"git clean -f"*|*"git clean -df"*) block "destructive git operation";;
  *"curl "*"| sh"*|*"curl "*"| bash"*|*"wget "*"| sh"*|*"wget "*"| bash"*) block "pipe-to-shell install";;
  *"DROP TABLE"*|*"DROP DATABASE"*|*"TRUNCATE "*) block "destructive SQL";;
esac
exit 0
