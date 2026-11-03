#!/bin/bash
# social-studio installer
#   ./install.sh --to DIR [--force] [--dry-run]
#   ./install.sh --list
# Varsayılan harness: social-studio
set -euo pipefail
KIT="$(cd "$(dirname "$0")" && pwd)"
TARGET="$PWD"; FORCE=0; DRY=0; NAMES=()
while [ $# -gt 0 ]; do case "$1" in
  --list) for d in "$KIT"/harnesses/*/; do n=$(basename "$d"); printf "%-12s agents:%-3s skills:%-3s  %s\n" "$n" "$(ls "$d/agents" | wc -l | tr -d ' ')" "$(ls "$d/skills" | wc -l | tr -d ' ')" "$(sed -n '1p' "$d/CLAUDE.md" | sed 's/^# //')"; done; exit 0;;
  --to) TARGET="$2"; shift 2;; --force) FORCE=1; shift;; --dry-run) DRY=1; shift;;
  -h|--help) sed -n '2,6p' "$0"; exit 0;; *) NAMES+=("$1"); shift;; esac; done
[ ${#NAMES[@]} -eq 0 ] && NAMES=(social-studio)
for n in "${NAMES[@]}"; do [ -d "$KIT/harnesses/$n" ] || { echo "unknown harness: $n (try --list)"; exit 1; }; done
mkdir -p "$TARGET"; TARGET="$(cd "$TARGET" && pwd)"; C="$TARGET/.claude"
copied=0; skipped=0
put() { # put <src> <dst>
  if [ -e "$2" ] && [ $FORCE -eq 0 ]; then skipped=$((skipped+1)); echo "  skip (exists): ${2#$TARGET/}"; return; fi
  [ $DRY -eq 1 ] && { echo "  would copy: ${2#$TARGET/}"; copied=$((copied+1)); return; }
  mkdir -p "$(dirname "$2")"; cp -R "$1" "$2"; copied=$((copied+1))
}
copy_dir() { # copy_dir <srcdir> <dstdir> : each child separately so existing items are preserved
  [ -d "$1" ] || return 0
  for f in "$1"/*; do [ -e "$f" ] && put "$f" "$2/$(basename "$f")"; done
}
echo "Installing [${NAMES[*]}] into $TARGET"
copy_dir "$KIT/core/agents" "$C/agents"; copy_dir "$KIT/core/rules" "$C/rules"; copy_dir "$KIT/core/hooks" "$C/hooks"
for n in "${NAMES[@]}"; do
  H="$KIT/harnesses/$n"
  copy_dir "$H/agents" "$C/agents"; copy_dir "$H/skills" "$C/skills"; copy_dir "$H/rules" "$C/rules"
  [ -d "$H/templates" ] && copy_dir "$H/templates" "$TARGET/docs/templates"
  [ -d "$H/knowledge" ] && copy_dir "$H/knowledge" "$TARGET/docs/knowledge"
  [ -d "$H/brand-kit" ] && copy_dir "$H/brand-kit" "$TARGET/docs/brand-kit"
  [ -f "$H/vendor.txt" ] && while read -r s; do [ -n "$s" ] && put "$KIT/vendor/skills/$s" "$C/skills/$s"; done < "$H/vendor.txt"
  if [ -f "$H/extras.txt" ]; then while read -r e; do [ -z "$e" ] && continue
    case "$e" in data/*) put "$KIT/vendor/$e" "$C/$e";; tools/*) put "$KIT/$e" "$C/$e";; esac; done < "$H/extras.txt"; fi
done
if [ $DRY -eq 0 ]; then
  chmod +x "$C"/hooks/*.sh "$C"/tools/*.sh 2>/dev/null || true
  # CLAUDE.md
  { cat "$KIT/core/CLAUDE.base.md"; for n in "${NAMES[@]}"; do echo; cat "$KIT/harnesses/$n/CLAUDE.md"; done; } > "$TARGET/.harness-claude.tmp"
  if [ -f "$TARGET/CLAUDE.md" ] && [ $FORCE -eq 0 ]; then mv "$TARGET/.harness-claude.tmp" "$TARGET/CLAUDE.harness.md"; echo "  CLAUDE.md exists -> wrote CLAUDE.harness.md (merge by hand or add '@CLAUDE.harness.md' to CLAUDE.md)"
  else mv "$TARGET/.harness-claude.tmp" "$TARGET/CLAUDE.md"; fi
  # settings.json (merge if present)
  if [ -f "$C/settings.json" ]; then
    python3 - "$C/settings.json" "$KIT/core/settings.base.json" <<'PY'
import json,sys
cur=json.load(open(sys.argv[1])); base=json.load(open(sys.argv[2]))
p=cur.setdefault("permissions",{})
for k in("allow","deny"):
    p[k]=list(dict.fromkeys(p.get(k,[])+base["permissions"][k]))
h=cur.setdefault("hooks",{})
for ev,entries in base["hooks"].items():
    have=json.dumps(h.get(ev,[]))
    for e in entries:
        if json.dumps(e["hooks"][0]["command"]) not in have: h.setdefault(ev,[]).append(e)
json.dump(cur,open(sys.argv[1],"w"),indent=2); print("  merged settings.json")
PY
  else cp "$KIT/core/settings.base.json" "$C/settings.json"; fi
  echo "${NAMES[*]}" > "$C/HARNESS"
  mkdir -p "$TARGET/docs/decisions"
  [ -f "$TARGET/docs/STATE.md" ] || printf '# Project state\n\n## Goal\n\n## Decisions\n\n## Open questions\n\n## Next step\n' > "$TARGET/docs/STATE.md"
fi
echo "Done: $copied copied, $skipped skipped."
echo "Optional upstream add-ons (run yourself if wanted):"
for n in "${NAMES[@]}"; do [ -f "$KIT/harnesses/$n/upstream.txt" ] && awk -F'|' -v h="$n" '{printf "  [%s] %s\n      %s\n      %s\n", h,$1,$2,$3}' "$KIT/harnesses/$n/upstream.txt"; done
echo "Next: open the folder in Claude Code and say what you want; the 'lead' agent (or the harness lead named in CLAUDE.md) routes the work."
