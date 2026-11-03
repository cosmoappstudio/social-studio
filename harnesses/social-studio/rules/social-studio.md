# Launch-design rules (each one cost us a revision round)

1. **No slop look.** Gradient fills, glows, glass cards and blur read as AI-generated. Use flat colour + hard offset shadows + shapes. If the user says "AI slop", strip effects first, add shapes second.
2. **Highlight only the key words.** Contrast block (`.hk` orange / `.hi` indigo / `.hp` brand-red) goes on the 1-3 words that carry the message, never on the whole headline.
3. **Use real brand marks.** No generic or recoloured stand-ins. Prefer official multicolour icons (e.g. Google Ads, Search Console) over monochrome. If only a hand-drawn vector exists (e.g. Product Hunt logo), say so in the hand-off.
4. **No mascots the user rejected** (e.g. the PH cat). Ask once, then obey.
5. **Never ask for upvotes** on Product Hunt (platform rule). CTAs: "Check us out", "See it on Product Hunt". Mock data is stamped `ILLUSTRATIVE EXAMPLE`.
6. **Numbers must agree across assets.** One source of truth for counts ("65+ sources") in `docs/brand.md`; grep every HTML before delivering. Derived counts ("+46 more") are recomputed, not guessed.
7. **Dates are facts.** Never invent a launch date/time; take from `docs/brand.md` or ask. "Today" teasers and "live" announcements are separate sets.
8. **Fit before beauty.** After every render, look at the PNG: overflow, overlap (sticker vs. footer, star vs. headline), wrapped headline. Fix geometry, re-render.
9. **Render hygiene (macOS).** Unique `--user-data-dir` per run, render sequentially, 2x scale, `sed -i ''`, avoid zsh reserved words (`fi`) as function names.
10. **Archive, don't overwrite.** New style round -> move previous PNGs to `out/_archive/<round>/`.
11. **Deliver files, then a short note**: what changed, where saved, what is unverified (dates, logo source, counts).
12. **Bilgi kaynağı zorunlu.** Postta geçen her rakam/özellik/platform adı `docs/knowledge/` içinde bir dosyada geçmeli; geçmiyorsa yazma, sor. Sadece "okuma" olan entegrasyonu "yönet/değiştir" diye yazma.
13. **Onay mesajı korunur.** "Otomatik yapar" deme; değişiklikler önizleme + onay ile gider, Action planı gerekir.
14. **Resmi brand kit önceliklidir.** `docs/brand-kit/` doluysa geçici token'lar geçersiz; çelişkide kit kazanır.
15. **Platform sayısı 65+**. PDF'lerdeki eski sayıyı (55) yazma; tam liste iddiası kurma, "ve daha fazlası" de.
