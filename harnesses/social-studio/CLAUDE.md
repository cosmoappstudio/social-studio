# Social-studio harness (sosyal medya ekibi: planla, yaz, tasarla, video, denetle)

Goal: sosyal ekip her gün/hafta tutarlı, doğru ve markaya uygun post üretsin — sadece lansman değil. Bilgi `docs/knowledge/`, marka `docs/brand-kit/`. HTML + headless tarayıcı + ffmpeg ile üretim; "AI slop" görünümü yok.

## Önce oku (her görevde)
1. `docs/brand-kit/brand.md` + `voice.md` (marka, ton, canonical numbers, yasaklar)
2. `docs/knowledge/*.md` (ürün bilgisi; iddia kaynağı)
Çelişki / eksik varsa kullanıcıya sor, uydurma. Resmi brand kit yoksa teslimde "geçici marka değerleri" notu düş.

## Team (`.claude/agents/`)
`social-lead` (buradan başla) · `content-strategist` · `copywriter` · `graphic-designer` · `video-editor` · `brand-guardian` + core agents. (`design-lead` lansman/PH projeleri için.)

## Pipeline (skills)
Haftalık: `/weekly-social-plan` -> `/post-brief` -> `/caption-pack` + `/render-graphic` (`/social-pack`, `/gallery-pack`) -> `/video-overlay` -> `/launch-copy-check` -> `/design-review`.
Ürün ekranı: `/mockup-shot` (görsel) · `/screen-demo` (video, OpenScreen).
Kurulum/bakım: `/font-pick` (font seç/uygula) · `/brand-kickoff` (brand-kit'i token'lara işler) · `/logo-collect` · `/knowledge-refresh`.

## Defaults
- Tasarım: `docs/templates/brand.css`, örnekler `docs/templates/examples/`, render `docs/templates/render.sh`. Düz renk, sert gölge, şekiller, 1-3 kelime kontrast vurgu.
- Çıktı: `out/<yıl-hafta>/<kanal>/`; eski turlar `out/_archive/`. Her post için `.md` (metin) + `.png/.mp4`.
- Yayınlamak/zamanlamak kullanıcının işi; taslak üretilir (Buffer vb. bağlıysa ancak açık onayla).
- Kurallar: `.claude/rules/anti-slop.md`, `social-studio.md`. Opsiyonel repolar: `upstream.txt`.
