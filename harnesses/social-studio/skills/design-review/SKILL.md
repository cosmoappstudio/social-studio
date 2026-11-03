---
name: design-review
description: "Visual review of rendered PNGs against the flat/shape style and slop rules; produce P0/P1/P2 list. Use at the end of each design round."
user-invocable: true
---
Open each PNG. P0: overflow/overlap, unreadable text, wrong logo. P1: gradients/glow/glass crept in, >3 highlight blocks, centered-symmetric template look, weak hierarchy. P2: spacing, alignment. Compare against previous round; say what changed. Also run `/slop-audit` where applicable.
