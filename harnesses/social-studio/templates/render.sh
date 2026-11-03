#!/bin/bash
# Render HTML -> PNG with headless Edge/Chrome.
#   render.sh <file.html> <out.png> [width] [height] [transparent]
set -euo pipefail
IN="$1"; OUT="$2"; W="${3:-1080}"; Hh="${4:-1080}"; TR="${5:-}"
for B in "/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge" "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" chromium google-chrome; do
  if [ -x "$B" ] || command -v "$B" >/dev/null 2>&1; then BIN="$B"; break; fi; done
[ -n "${BIN:-}" ] || { echo "no Chromium-based browser found"; exit 1; }
UD="/tmp/render_$(basename "$IN" .html)_$RANDOM"
EXTRA=(); [ "$TR" = "transparent" ] && EXTRA+=(--default-background-color=00000000)
"$BIN" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=2 \
  --window-size="${W},${Hh}" --virtual-time-budget=6000 --user-data-dir="$UD" \
  "${EXTRA[@]}" --screenshot="$OUT" "file://$(cd "$(dirname "$IN")" && pwd)/$(basename "$IN")" >/dev/null 2>&1
rm -rf "$UD"; echo "rendered $OUT (${W}x${Hh} @2x)"
