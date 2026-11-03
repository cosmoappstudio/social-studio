---
name: video-overlay
description: "Add motion cards/end card to a source video and export 16:9 and 9:16. Use when the user supplies a clip."
user-invocable: true
---
Probe with ffprobe, storyboard 3-5 cards with timestamps (hook <2s), render cards (transparent), assemble with `docs/templates/recipes/video-overlay.md`, export both ratios, extract a frame sheet to check. Concept first: one memorable line (e.g. 'Stay calm. Ask <product>.') beats generic captions.
