# Veritabanı Yönetim Sistemleri Vize Projesi

## Senaryo

- **Alan:** Logistics & Delivery (Lojistik ve Teslimat)
- **Sistem:** Computer Vision Camera (Görüntü İşleyen Kamera)
- **Yapay zekâ bileşeni:** Anomaly Detection (Anomali Tespiti)

## Projenin Amacı

Bu projede, lojistik ve teslimat alanında kutuların görsel olarak sağlam veya hasarlı durumda olmasını inceleyen bir kamera sistemi senaryosu ele alınmaktadır. Hasarlı kutular anormal durum olarak değerlendirilir.

## Veri Kaynağı

- **Adı:** Damaged Intact Box Dataset, v1
- **Kaynak:** https://universe.roboflow.com/damages-intact-box-dataset/damaged-intact-box-dataset/dataset/1
- **Lisans:** CC BY 4.0
- **Toplam:** 581 JPG görüntü; 325 sağlam (`intact`), 256 hasarlı (`damaged`).
- **Bölümler:** train 412, valid 113, test 56 görüntü.

Kaynağın ayrıntıları, veri kalitesi değerlendirmesi ve sınırlamalar için [VERI_KARTI.md](VERI_KARTI.md) dosyasına bakınız.

## SQL Analizi ve Çalıştırma

SQL sorguları [sorgular.sql](sorgular.sql) dosyasındadır.

1. Visual Studio Code'da PostgreSQL bağlantısını ve bir veritabanını seçin.
2. `sorgular.sql` dosyasını açın.
3. Sorguları `;` işaretinde biten bloklar hâlinde **tek tek** seçerek çalıştırın.
4. Kodların altındaki yorum satırlarından beklenen sonuçları karşılaştırın.

**Önemli:** Bu aşamada kalıcı tablo oluşturulmamıştır. İlk iki sorgu sayılarla hesaplama yapar. Diğer sorgular `WITH` ve `VALUES` kullanarak veri seti klasörlerinden elde edilen altı **özet kaydı** geçici olarak tanımlar; görüntüleri veritabanına aktarıp sorgulamaz. `COUNT(*)` sonucu altı özet kaydı sayar, toplam görüntüyü hesaplamak için `SUM(adet)` kullanılır. Bu yöntem dersin sonraki haftalarında kurulacak veritabanının yerine geçmez.

İlk iki sorgu PostgreSQL üzerinde çalıştırılarak kontrol edildi. Diğer sorguların beklenen sonuçları dosyada belirtilmiştir; tamamının PostgreSQL üzerinde çalıştırıldığı iddia edilmemektedir.

## Dosyalar

- `README.md`: Proje senaryosu ve çalıştırma açıklamaları
- `VERI_KARTI.md`: Veri kaynağı, kapsamı, sayımları ve sınırlamalar
- `sorgular.sql`: SQL soruları, sorgular ve beklenen sonuçlar
- `AI_BEYAN.md`: Yapay zekâ kullanım beyanı

## Bu Aşamanın Kapsamı

Bu çalışma veri setinin seçilmesi, veri kartının hazırlanması ve 3–5. hafta SQL konularına yönelik ön analiz çalışmasıdır. Henüz görüntülere karşı çalışan bir görüntü işleme modeli veya kalıcı veritabanı oluşturulmamıştır.
