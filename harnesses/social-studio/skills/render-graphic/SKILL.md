---
name: render-graphic
description: "Render an HTML design to PNG (2x) and visually QA it. Use after every edit of a design HTML."
user-invocable: true
---
Run `docs/templates/render.sh <file.html> <out.png> <w> <h> [transparent]`. Render sequentially (unique profile dir per run). Read the PNG: check overflow, overlaps, wrapped headlines, legibility at thumbnail size (view at 25%). Fix geometry and re-render until clean.
