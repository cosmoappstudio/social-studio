# Font seçimi
Durum: **GEÇİCİ** — Figtree (başlık+gövde) + IBM Plex Mono (etiket).

Resmi fontlar farklıysa iki yol:
1. **Google Fonts'ta varsa:** `python3 docs/templates/set-fonts.py --display "Sora" --mono "JetBrains Mono"`
2. **Markaya özel (lisanslı) font dosyası:** `.woff2/.ttf/.otf` dosyalarını `docs/brand-kit/fonts/` içine koy, sonra `python3 docs/templates/set-fonts.py --display "Marka Sans" --local`. Dosya adında Medium/Bold/ExtraBold/Black geçmeli (ağırlık buradan okunur).
Emin değilsen `/font-pick`: 3 eşleşme (ana font + mono) önerir, örnek sayfa render eder, seçilen uygulanır. Seçilen değerler bu dosyaya yazılır.
Kural: en fazla 2 aile + 1 mono; başlık ağırlığı 800-900, gövde 500-600; Türkçe karakterler (ğ ı İ ş ç ö ü) fontta olmalı — specimen'de test edilir.
