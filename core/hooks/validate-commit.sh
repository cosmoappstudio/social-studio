#!/bin/bash
# PreToolUse(Bash): on `git commit`, require a conventional-commit subject and refuse staged secrets.
INPUT=$(cat)
case "$INPUT" in *'"tool_input"'*git*commit*) ;; *) exit 0;; esac
if git diff --cached --name-only 2>/dev/null | grep -Eq '(^|/)(\.env(\..*)?|.*\.p8|.*\.pem|.*id_rsa.*|.*credentials.*\.json)$'; then
  echo "BLOCKED: staged file looks like a secret (.env/.p8/.pem/key). Unstage it." >&2; exit 2
fi
MSG=$(printf '%s' "$INPUT" | python3 -c 'import sys,json,re;c=json.load(sys.stdin).get("tool_input",{}).get("command","");m=re.search(r"-m\s+[\"\x27]([^\"\x27\n]+)",c);print(m.group(1) if m else "")' 2>/dev/null)
[ -z "$MSG" ] && exit 0
echo "$MSG" | grep -Eq '^(feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert)(\([a-z0-9._-]+\))?!?: .{3,}' || { echo "BLOCKED: commit subject must be conventional (feat|fix|docs|refactor|perf|test|chore...: summary)." >&2; exit 2; }
exit 0
