#!/bin/bash
# SessionStart: print harness identity + open work so the model starts oriented.
ROOT="${CLAUDE_PROJECT_DIR:-$PWD}"; cd "$ROOT" 2>/dev/null || exit 0
[ -f .claude/HARNESS ] && echo "Harness: $(cat .claude/HARNESS)"
git rev-parse --is-inside-work-tree >/dev/null 2>&1 && { echo "Branch: $(git branch --show-current)"; git status --short | head -10; }
[ -f docs/STATE.md ] && { echo "--- docs/STATE.md (head)"; head -30 docs/STATE.md; }
exit 0
