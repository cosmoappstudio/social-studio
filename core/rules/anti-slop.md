# Anti-slop rules (UI and copy)
Adapted from OpenDesign `craft/anti-ai-slop.md` (Apache-2.0). Checkable, not taste.

## Blockers
1. Default indigo/violet accent (#6366f1 #4f46e5 #8b5cf6 #7c3aed #a855f7). Use the project's design tokens.
2. Two-stop "trust" gradient hero (purple->blue, blue->cyan, indigo->pink).
3. Emoji as feature icons. Use monoline SVG, currentColor.
4. Rounded card with a coloured left border.
5. Invented metrics ("10x faster", "99.9% uptime"). Real source or labelled placeholder.
6. Filler copy: lorem ipsum, "Feature one/two/three", "Unlock the power of", "Seamless", "Elevate", "Revolutionize".
7. Hardcoded hex/px in components when tokens exist.

## Should fix
- Hero -> Features -> Pricing -> FAQ -> CTA with no variation: add one unconventional section.
- Stock placeholder image CDNs in shipped pages.
- Every interactive state missing: hover, focus-visible, active, disabled, loading, empty, error.
- Motion without purpose or without `prefers-reduced-motion` handling.
- Touch targets < 44pt (iOS) / 48dp (Android); contrast < 4.5:1 body text.
