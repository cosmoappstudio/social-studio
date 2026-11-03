# Orphex MCP — ürün bilgisi (post üretiminde tek doğruluk kaynağı)

Kaynak (platform sayısı hariç; sayı için üstteki karara bak): `sources/orphex-baslangic-rehberi.pdf` (12 s.), `sources/orphex-kullanim-rehberi.pdf` (19 s.; tablo "Ekim 2026 itibarıyla"). PDF'ten elle derlendi. Çelişki varsa PDF kazanır; güncel olmayabilir, tarihli iddialarda ürün ekibine sor.

## Tek cümle
Orphex MCP, Claude ve ChatGPT'yi (Microsoft Copilot da) reklam hesaplarına bağlar: soruyu yaz, cevap bağlı hesaplardaki güncel veriden gelsin; değişiklikler sohbetten yapılır ama önizleme + onayla.

## Platform sayısı (KARAR VERİLDİ)
- Güncel sayı: **65+ kaynak/platform**. PDF rehberlerdeki "55 platform" ifadesi eskidir; **PDF'lerde platform sayısı geçen her yerde 65+ kullan** (örn. 49/5/1 dağılımı artık geçerli değil, dağılım verme).
- PDF'ler dışında kalan her bilgi geçerlidir. Tablodaki platform listesi 55'lik eski listedir: yeni eklenen platformları bilmiyoruz, listeyi "tam liste" diye sunma; "ve daha fazlası" de.

## Nasıl çalışır (3 adım, ~10 dk, teknik bilgi gerekmez)
1. mcp.orphex.co'da hesap aç (şifresiz: e-postaya 6 haneli kod, ya da Google ile giriş). Çalışma alanı (workspace) oluştur — ajanslar her müşteriye ayrı açar.
2. Platformları bağla (Meta, Google Ads…). İzin platformun kendi ekranında verilir; Orphex şifre görmez; izin geri alınabilir.
3. Asistanı bağla: Claude (tek link; ücretsiz dahil tüm planlar) · ChatGPT (Business/Enterprise/Edu; özel MCP sunucusu adresi) · Copilot (M365 + Copilot lisansı).

## İki tür iş
- **Bilgi almak:** harcama, satış, ROAS, kampanya listesi, karşılaştırma. Hesapta hiçbir şey değişmez, sınırsız sorulur.
- **Değişiklik yapmak:** bütçe, durdurma/başlatma, teklif, negatif kelime, yayın saati, yeni kampanya (örn. Meta trafik kampanyası), kopyalama, katalog seti. Asistan **önizleme kartı** hazırlar (şu an ne var → ne olacak); **Approve** edilince platforma gider. Kart ~15 dk geçerli ("Approve by 16:50"). Geri alınamayanlar kartta açıkça yazılır. Yeni kampanya **duraklatılmış** kurulur. Değişiklik için: platform bağlı + **Action planı** + çalışma alanında değişiklikler açık + düzenleme yetkisi. Diğer planlarda sadece okuma.

## Güven / kontrol (postlarda öne çıkarılabilir)
- Değişiklik özelliği siz açmadıkça kapalı (Settings › Assistant permissions). Limitler: Settings › Action limits (kim onaylar, ikinci onay, bütçe sınırı, dokunulmayacak kampanya adları).
- Asistan yalnızca bağlanan çalışma alanlarını, **kullanıcının yetkisi kadar** görür.
- Orphex veriyi model eğitiminde kullanmaz; Claude/ChatGPT tarafında kendi ayarları geçerli. (Postlarda "model eğitimi" iddiasını bu cümleyle sınırla.)
- Bağlantı tek tıkla kaldırılır (Revoke); reklam hesapları etkilenmez.
- Ekipte: Öneri → Karar (kural gereği onaylayan) → Kayıt; Approvals sayfası tüm değişiklikleri gösterir.
- Ücretsiz plan: 1 bağlı hesap, son 30 gün veri, kredi kartı yok. Ücretli planlarda daha uzun karşılaştırma.

## Platform kapsamı (Ekim 2026 tablosu)
- **Reklam, okuma + değişiklik:** Meta, Google Ads (+YouTube reklamları), TikTok, Microsoft Ads, Apple Search Ads, Pinterest, Yandex Direct, LinkedIn Ads, Snapchat, Criteo, Reddit Ads, X Ads (değişiklik kapsamı platforma göre değişir; tabloya bak). Taboola/OpenAI Ads sınırlı. Sadece okuma: CM360, DV360, Akakçe; Amazon Ads (hesap/kampanya listesi); RTB House (okuma + durdur/başlat).
- **Analitik/takip:** GA4, Google Tag Manager, Search Console, Microsoft Clarity, Similarweb, Meta Pixel, TikTok Pixel, BigQuery.
- **E-ticaret/CRM:** Shopify, ikas, Ticimax, T-Soft, Merchant Center, Meta/TikTok Catalog, Klaviyo, Insider One, HubSpot.
- **Mobil:** App Store Connect, Google Play, AppsFlyer, Adjust, Singular, AppLovin MAX, RevenueCat, Adapty.
- **Organik sosyal:** Facebook sayfası/Instagram, YouTube, TikTok organik.
- **Kreatif:** Higgsfield, Content Automation, Creative.
- **Google bağlantısıyla:** E-Tablolar, Slaytlar (okuma + yazma).
- **Ekiple kurulanlar (5):** Hardal, Gelir Ortakları, ReklamStore, Yango, HubSpot.
- Postta platform adı sayarken: sadece "okuma" olanı "yönet/değiştir" diye yazma.

## 29 hazır skill (mcp.orphex.co/skills) — içerik fikirleri
- Kampanya optimizasyonu (8): arama terimi temizliği, yeni anahtar kelime, kalite puanı, hesap yapısı denetimi, PMax varlık/arama teması denetimi, yerleşim temizliği, teklif stratejisi/öğrenme dönemi, … 
- Bütçe/büyüme (6): bütçe değişikliği önerisi, kampanyalar arası kaydırma, harcama hızı & ay sonu tahmini, ürün kârlılığı, müşteri grubu & LTV, …
- Raporlama/teşhis (5): haftalık performans, **yöneticiye haftalık özet**, ani değişim incelemesi, şehir/ülke/cihaz kırılımı, gösterim payı, Meta yayın/kitle, Merchant Center feed.
- Kreatif/mesaj (4): kreatif yorgunluğu, hangi kreatif neden çalışıyor, kreatif test brief'i, arama reklamı metni.
- Ölçüm (3): dönüşüm takibi sağlık kontrolü, raporlar arası tutarlılık, lead kalitesi/CRM.
- Deney (3): planlama, sonuç değerlendirme, açılış sayfası dönüşüm.
- Skill'ler değişikliği uygulamaz, öneri üretir; uygulama yine onay kartıyla.
- Paketler: Haftalık hesap incelemesi (5), Arama optimizasyonu (4), Deney döngüsü (2).

## Soru yazma formülü (eğitici içerik için)
Platform+hesap · tarih aralığı · neyle kıyas · ne istiyorsun. Belirsiz → net örnekleri:
- "Kampanyalar nasıl gidiyor?" → "Meta'da son 14 günde ROAS'ı en çok düşen 3 kampanya hangisi? Önceki 14 günle karşılaştır."
- "Boşa para harcıyor muyuz?" → "Google Ads'te son 30 günde para harcayıp hiç dönüşüm getirmeyen arama terimlerini listele."
- "Rapor hazırla." → "Geçen haftanın harcama, satış ve ROAS'ını kampanya bazında tablo yap, önceki haftayla farkı da ekle."

## Hazır örnek sorular (postta alıntılanabilir)
"Meta'da ROAS geçen haftaya göre neden düştü?" · "Bu ay Google Ads'te dönüşüm maliyetim ne?" · "Meta mı Google mı daha ucuza satış getiriyor, son 30 gün?" · "Para harcayıp hiç satış getirmeyen reklamları listele." · "Bu haftanın sonuçlarını yöneticime gidecek 5 maddelik bir özet olarak yaz. Teknik terim kullanma." · "Kasım İndirimi kampanyasının günlük bütçesini 750 TL yap."

## Dikkat: doğru söylem
- Asistan hata yapabilir; büyük bütçe kararından önce rakam platform panelinde de kontrol edilir (rehberin kendi önerisi — şeffaf içerik malzemesi).
- Platformlar aynı satışı ikisi de kendine yazabilir (çifte sayım) — iyi eğitici içerik konusu.
- "Her şeyi otomatik yapar" deme: her değişiklik onaylıdır.
- Fiyat/plan adı (Free/Read/Action) ve limitler PDF'te yok; ürün ekibinden güncel plan tablosunu alıp bu dosyaya ekle.

## Linkler / kanallar
mcp.orphex.co · /academy (videolu dersler, hazır sorular) · /skills · /support · support@orphex.co · app.orphex.co · YouTube kurulum videoları (Claude'a bağlama, ChatGPT'ye bağlama, sohbetten Meta kampanyası kurma).
