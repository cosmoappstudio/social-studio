# Social Studio — sosyal medya ekibi için Claude Code harness'ı

Claude Code'a "bu hafta için post hazırla" dersiniz; **strateji, metin, tasarım, video ve denetim** ajanları sırayla çalışır. Görseller HTML'den PNG'ye üretilir, ürün bilgisine (`knowledge`) ve marka kitine (`brand-kit`) bağlı kalır. Yayınlamayı siz yaparsınız, ajanlar taslak üretir.

Orphex MCP için kuruldu; **kendi markanıza uyarlamak için** aşağıdaki [Kendi markanıza uyarlayın](#kendi-markanıza-uyarlayın) bölümüne bakın.

## Neler yapar
| İş | Nasıl |
|---|---|
| Haftalık içerik planı | `/weekly-social-plan` |
| Tek post için brief → metin → görsel | `/post-brief` → `/caption-pack` → `/render-graphic` |
| X / LinkedIn / Instagram metinleri (TR + EN) | `/caption-pack` |
| Lansman ve duyuru görselleri, galeri | `/social-pack`, `/gallery-pack` |
| Ekran görüntüsünü tarayıcı/telefon çerçevesine koyma | `/mockup-shot` |
| Ürün demo videosu, kart ve altyazı ekleme | `/screen-demo`, `/video-overlay` |
| Font seçimi ve uygulama | `/font-pick` |
| Kontrol (rakam, tarih, kurallar, görünüm) | `/launch-copy-check`, `/design-review`, `/slop-audit` |
| Logo toplama | `/logo-collect` |
| Bilgi tabanını yenileme | `/knowledge-refresh` |

Ekip: `social-lead` (buradan başlayın) · `content-strategist` · `copywriter` · `graphic-designer` · `video-editor` · `brand-guardian` · lansman projeleri için `design-lead`.

---

## Kurulum (5 dakika)

### 1) Gerekenler (bir kere)
| Araç | Kontrol | Kurulum (Mac) |
|---|---|---|
| Claude Code | `claude --version` | https://claude.com/claude-code |
| Python 3 | `python3 --version` | macOS'ta hazır |
| ffmpeg (video için) | `ffmpeg -version` | `brew install ffmpeg` |
| Edge veya Chrome (PNG render için) | `/Applications` içinde | — |

> Şablonlar **macOS** için yazıldı. Windows/Linux'ta `render.sh` içindeki tarayıcı yolu ve bazı komutlar uyarlama ister.

### 2) Repoyu al ve projeye kur
```bash
git clone https://github.com/cosmoappstudio/social-studio.git ~/social-studio
cd ~/social-studio
./install.sh --to ~/sosyal-medya       # boş klasör ya da mevcut proje
```
Kurulum `~/sosyal-medya` içine şunları koyar. Var olan dosyaların üzerine **yazmaz** (`--force` ile yazar).

| Klasör | İçerik |
|---|---|
| `.claude/` | ajanlar, skill'ler, kurallar, güvenlik hook'ları |
| `docs/brand-kit/` | marka kitiniz (logolar, fontlar, renkler, ton) — **sizin dolduracağınız yer** |
| `docs/knowledge/` | ürün bilgisi ve kaynak PDF'ler — iddiaların kaynağı |
| `docs/templates/` | tasarım şablonları, `render.sh`, `set-fonts.py`, mockup, video tarifleri |

### 3) Kullanın
```bash
cd ~/sosyal-medya && claude
```
Örnek istekler:
- `Bu hafta LinkedIn ve X için içerik planı çıkar`
- `Plandaki ilk post için brief, metin ve görsel hazırla`
- `Bu ekran görüntüsünü tarayıcı çerçevesine koy` (görseli klasöre koyun)
- `Fontu Sora yap`

Çıktılar `out/<yıl-hafta>/<kanal>/` altına düşer (`.md` metin, `.png` görsel, `.mp4` video).

### Güncelleme
```bash
cd ~/social-studio && git pull
./install.sh --to ~/sosyal-medya --force   # önce kendi düzenlemelerinizi (brand-kit, knowledge) yedekleyin
```

---

## Kendi markanıza uyarlayın

Her şey **`docs/brand-kit/`** içinden yönetilir. Sırayla:

### 1) Logolar → `docs/brand-kit/logos/`
SVG tercih edin (açık zemin, koyu zemin ve sadece-ikon varyantları). Üçüncü taraf logolar (platform/entegrasyon) için `/logo-collect` çalıştırın; `assets/` altına indirir.

### 2) Renkler → `docs/brand-kit/brand.md` + `docs/templates/brand.css`
`brand.md` içindeki renk tablosunu resmi hex değerlerinizle doldurun. Sonra aynı değerleri `docs/templates/brand.css` içindeki değişkenlere aktarın (ya da Claude Code'a `/brand-kickoff` deyin, aktarır):
```css
:root{--ind:#0d0670;--ink:#07033f;--paper:#f3eee4;--or:#ff8a1a;--lav:#b9aef0;--mint:#8fe3bf}
```
`--ind` ana koyu, `--ink` çerçeve/gölge, `--paper` açık zemin, `--or` vurgu (turuncu blok), `--lav`/`--mint` ikincil.

### 3) Fontlar → `docs/brand-kit/fonts.md` + `fonts/`
- **Google Fonts'ta varsa:**
  ```bash
  python3 docs/templates/set-fonts.py --display "Sora" --mono "JetBrains Mono"
  ```
- **Markaya özel (lisanslı) font:** `.woff2/.ttf/.otf` dosyalarını `docs/brand-kit/fonts/` içine koyun (dosya adında Medium/Bold/ExtraBold/Black geçsin), sonra:
  ```bash
  python3 docs/templates/set-fonts.py --display "Marka Sans" --local
  ```
- Karar vermek için Claude Code'da `/font-pick`: 3 eşleşme önerir, örnek sayfa üretir, seçileni uygular. Fontta Türkçe karakter (ğ ı İ ş ç ö ü) desteği olmalı; lisansın web ve sosyal medya kullanımını kapsadığını kontrol edin.

### 4) Ton ve ses → `docs/brand-kit/voice.md`
Dil (TR/EN), ton, post yapısı (kanca → tek fikir → örnek → CTA), emoji ve hashtag politikası, uzunluk sınırları. İyi/kötü örnek cümleler ekleyin; metin ajanı bunları referans alır.

### 5) Marka kuralları, sayılar, tarihler → `docs/brand-kit/brand.md`
- **Canonical numbers:** postlarda geçen tüm sayılar tek yerde (ör. "65+ kaynak"). Ajanlar bu listede olmayan sayıyı yazmaz.
- **Tarihler:** lansman/etkinlik tarihi. Onaysız saatleri "ONAYSIZ" diye işaretleyin.
- **Yasaklar:** kullanmak istemediğiniz ifadeler, maskotlar, görsel stiller.
- **Kanallar:** hesap adları ve hashtag politikası.

### 6) Örnek postlar → `docs/brand-kit/reference-posts/`
Beğendiğiniz mevcut postların görsellerini koyun. Tasarım ajanı tonu ve düzeni bunlardan okur.

### 7) Başka bir ürün/marka için bilgi tabanı → `docs/knowledge/`
- Bu repo Orphex MCP bilgisiyle gelir (`orphex-product.md`, `sources/` altında PDF'ler). **Başka bir ürün için** `orphex-product.md`'yi silip kendi ürününüzün `.md` dosyasını koyun; rehber, SSS, blog, release notes ekleyebilirsiniz.
- Her `.md` şunları içersin: tek cümle tanım, nasıl çalışır, güvenlik/gizlilik iddiaları, rakamlar, kapsam/entegrasyonlar, kullanılmaması gereken ifadeler.
- PDF eklediyseniz Claude Code'da `/knowledge-refresh` deyin; metni çıkarıp `.md`'ye işler ve çelişkileri raporlar.
- **Kural:** postta yazan her rakam ve özellik `docs/knowledge/` içinde geçmelidir; geçmiyorsa ajan yazmaz, sorar.

### 8) Şablonları kendinize göre değiştirin → `docs/templates/examples/`
`teaser-*` ve `live-*` dosyaları güncel, düz stilde şablonlardır. `ph-*` dosyaları ilk tur Product Hunt galeri düzenleridir (koyu/cam stil); yapıyı koruyup düz stile çevirin. Her şablon `assets/` altındaki logoları kullanır.

### Kit boşken ne olur?
Harness geçici değerlerle çalışır ve her teslimde "resmi kit yok" notu düşer. Resmi kit eklendiğinde kit kazanır.

---

## Çalışma kuralları (özet)
Düz tasarım (gradient, glow, blur, cam yok) · anahtar 1-3 kelimeye kontrast vurgu · gerçek marka logoları · Product Hunt'ta oy istenmez · rakam ve özellik `knowledge`'da yoksa yazılmaz · "otomatik yapar" denmez, değişiklikler önizleme ve onayla gider · her turda eski çıktılar `out/_archive/`'a taşınır. Tamamı: `harnesses/social-studio/rules/social-studio.md`.

## Sık sorunlar
| Sorun | Çözüm |
|---|---|
| `render.sh` tarayıcıyı bulamıyor | Edge ya da Chrome'u `/Applications` içine kurun |
| Görsellerde logo yok | Önce `/logo-collect` çalıştırın (logolar repoda yok) |
| Font bozuk / Türkçe karakter eksik | `/font-pick` ile Türkçe karakter testini render edin |
| Başlık taştı (font değişince) | `/render-graphic` ile PNG'ye bakın, `font-size`/`letter-spacing` düşürün |
| PDF metni çıkmıyor | Metni kendiniz `.md` olarak `docs/knowledge/`'a koyun |

## Repo yapısı
```
core/                 ortak ajanlar, kurallar, hook'lar, settings
harnesses/social-studio/
  agents/ skills/ rules/ CLAUDE.md
  templates/          brand.css, render.sh, set-fonts.py, mockup, examples/, recipes/
  knowledge/          orphex-product.md + sources/ (PDF'ler)
  brand-kit/          brand.md, voice.md, fonts.md, logos/ fonts/ reference-posts/
  upstream.txt        opsiyonel tasarım araçları (OpenScreen, simple-icons, satori…)
install.sh  validate.sh
```
Opsiyonel araçlar ve lisans notları: `harnesses/social-studio/upstream.txt`, `NOTICE.md`.

## Katkı
Ajan/skill eklemek: `harnesses/social-studio/agents/<isim>.md` (frontmatter: name, description, tools, model, maxTurns) ya da `skills/<ad>/SKILL.md`. Değişiklikten sonra `./validate.sh` çalıştırın.
