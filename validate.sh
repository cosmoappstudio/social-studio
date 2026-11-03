#!/bin/bash
# Kit doğrulaması: frontmatter, hook sözdizimi, settings JSON, kurulum denemesi.
KIT="$(cd "$(dirname "$0")" && pwd)"; fail=0
bad(){ echo "FAIL: $1"; fail=1; }
for f in "$KIT"/core/agents/*.md "$KIT"/harnesses/*/agents/*.md; do
  head -1 "$f" | grep -q '^---$' || bad "$f: no frontmatter"
  for k in name description tools model; do sed -n '2,12p' "$f" | grep -q "^$k:" || bad "$f: missing $k"; done
  n=$(sed -n 's/^name: //p' "$f" | head -1); [ "$n" = "$(basename "$f" .md)" ] || bad "$f: name '$n' != filename"
done
for f in "$KIT"/harnesses/*/skills/*/SKILL.md "$KIT"/vendor/skills/*/SKILL.md; do
  [ -f "$f" ] || continue
  head -1 "$f" | grep -q '^---$' || bad "$f: no frontmatter"; grep -q '^name:' "$f" || bad "$f: no name"; grep -q '^description:' "$f" || bad "$f: no description"
done
for h in "$KIT"/harnesses/*/; do
  [ -f "$h/vendor.txt" ] && while read -r s; do [ -z "$s" ] || [ -d "$KIT/vendor/skills/$s" ] || bad "$h vendor.txt: missing $s"; done < "$h/vendor.txt"
  for a in "$h"agents/*.md; do sk=$(sed -n 's/^skills: \[\(.*\)\]/\1/p' "$a"); for s in ${sk//,/ }; do [ -d "$KIT/vendor/skills/$s" ] || [ -d "$h/skills/$s" ] || bad "$a: preloads unknown skill $s"; done; done
done
for f in "$KIT"/core/hooks/*.sh "$KIT"/install.sh; do bash -n "$f" || bad "$f: syntax"; done
python3 -c "import json;json.load(open('$KIT/core/settings.base.json'))" || bad "settings.base.json invalid"
# hook behaviour
echo '{"tool_input":{"command":"git push --force origin main"}}' | bash "$KIT/core/hooks/guard-bash.sh" 2>/dev/null; [ $? -eq 2 ] || bad "guard-bash did not block force push"
echo '{"tool_input":{"command":"ls -la"}}' | bash "$KIT/core/hooks/guard-bash.sh"; [ $? -eq 0 ] || bad "guard-bash blocked ls"
# install dry runs + real install into temp
T=$(mktemp -d); for h in $(ls "$KIT/harnesses"); do "$KIT/install.sh" "$h" --to "$T/$h" >/dev/null 2>&1 || bad "install $h failed"; [ -f "$T/$h/.claude/settings.json" ] || bad "$h: no settings"; done
"$KIT/install.sh" social-studio --to "$T/social-studio" >/dev/null 2>&1 || bad "idempotent re-install failed"
rm -rf "$T"
[ $fail -eq 0 ] && echo "ALL CHECKS PASSED" || { echo "SOME CHECKS FAILED"; exit 1; }
