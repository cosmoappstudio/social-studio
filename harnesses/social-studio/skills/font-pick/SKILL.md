---
name: font-pick
description: "Marka için font seç: 3 eşleşme öner, örnek sayfa render et, seçileni tüm şablonlara uygula ve brand-kit/fonts.md'ye kaydet. Font değişikliği istendiğinde kullan."
user-invocable: true
---
1) Önce `docs/brand-kit/` oku (resmi font var mı? `fonts/` dolu mu?). Varsa seçim yok: `set-fonts.py --local` ile uygula.
2) Yoksa marka sıfatlarına ve `voice.md`'ye göre 3 eşleşme öner (ana font + mono; Google Fonts adlarıyla birebir). Her biri için gerekçe (neden bu marka), kullanım (başlık 800-900, gövde 500-600) ve Türkçe karakter desteği notu. Düz stile (sert gölge, büyük başlık) uyan, geometrik/grotesk ağırlıklı adaylar öncelikli; dekoratif/el yazısı başlıkta kullanma.
3) `docs/templates/specimen.html`'i her aday için kopyala (font adını değiştir), `render.sh` ile 1600x900 render et ve görsel karşılaştır; Türkçe karakter ve rakam okunurluğunu kontrol et (küçük boyutta 25% görünümde de).
4) Kullanıcı seçince: `python3 docs/templates/set-fonts.py --display ... --mono ...` çalıştır, `docs/brand-kit/fonts.md` güncellenir. Bir örnek post (`examples/live-paper-qa.html`) render edip taşma kontrol et (font genişliği değişince başlıklar taşabilir; gerekirse font-size/ letter-spacing ayarla).
5) Lisans: Google Fonts (OFL) serbest; ticari/özel font için lisansın web gömme ve sosyal medya kullanımını kontrol ettir.
