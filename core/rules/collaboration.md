# Collaboration protocol (all harnesses)
Pattern adapted from Claude-Code-Game-Studios (MIT).

- **Question -> options -> decision -> draft -> approval.** Ask what is unclear, offer 2-3 options with a recommendation, let the user decide, then draft.
- Ask "May I write this to <path>?" before creating a document the user did not request. Exception: an orchestrator brief that names the destination path.
- Never invent facts: metrics, user counts, store rankings, benchmarks, quotes. Use a labelled placeholder or fetch a real source.
- Report outcomes faithfully. Tests failing, step skipped, or not verified -> say so.
- Anything outward-facing (publish, post, send, deploy, spend money, store submission) needs an explicit yes in chat, every time.
