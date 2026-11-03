---
name: screen-demo
description: "Ürün ekran kaydından kısa demo videosu üret (zoom, kırpma, altyazı, 16:9 ve 9:16). OpenScreen ya da ffmpeg ile."
user-invocable: true
---
Kayıt için getopenscreen/openscreen (MIT, bakımda; kurulum `upstream.txt`) önerilir: otomatik zoom, imleç efekti, altyazı, MP4/GIF export. Kullanıcı kaydı/dışa aktarımı uygulamada yapar (GUI; ajan sürmez). Sonra ajan: `ffprobe`, 9:16 kırpma, overlay kart/uçkart (`/video-overlay`), frame sheet kontrolü. Demoda sadece onaylı/maskeli hesap verisi görünsün; ilk 2 sn kanca; her değişiklik adımında onay kartı göster (güven mesajı).
