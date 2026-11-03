---
name: mockup-shot
description: "Gerçek ekran görüntüsünü tarayıcı/telefon çerçevesine koyup postluk görsel üret. Ürün ekranı gösterilecek her tasarımda kullan."
user-invocable: true
---
1) Ekran görüntüsünü al/iste (PNG, `assets/shot.png`). 2) Müşteri adı, hesap adı, e-posta, kampanya adı gibi hassas alanları **maskele** (CSS blur değil, düz renk bloğu; stil kuralı: blur/glow yok). 3) `docs/templates/mockup.html`: browser ya da phone seç, başlıkta 1-3 kelimeye vurgu bloğu, gerekirse ok/sticker ile tek noktaya dikkat çek. 4) `render.sh mockup.html out.png 1080 1080`. 5) Ekran gerçek mi mock mu: mock ise `ILLUSTRATIVE EXAMPLE`; gerçek ürün ekranında platform logosu/ad izinsiz kullanılmaz. Kural: ekran görüntüsü güncel arayüzü yansıtmalı; eskiyse uyar.
