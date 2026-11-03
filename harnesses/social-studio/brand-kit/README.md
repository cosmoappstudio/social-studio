# brand-kit/ — buraya markanın resmi kitini bırak
`install.sh` bunu `docs/brand-kit/` altına koyar; tüm ajanlar tasarım/yazım öncesi `brand.md` ve `voice.md` dosyalarını okur. Resmi kit gelince:
1. Logoları `logos/` (SVG öncelikli; açık/koyu/ikon-only varyantları), fontları `fonts/`, örnek beğenilen postları `reference-posts/` altına at.
2. `brand.md` içindeki renk/font/kural alanlarını resmi değerlerle güncelle (şu an **Orphex PH çalışmasından türetilmiş, ONAYSIZ** değerler var). Resmi değerler farklıysa `docs/templates/brand.css` değişkenlerini de aynı değerlere çek (`/brand-kickoff`).
3. `voice.md`'yi ekibin gerçek ton kurallarına göre düzenle.
Kit yoksa ajanlar `brand.md`'deki geçici değerleri kullanır ve her teslimde "resmi kit yok" notu düşer.
