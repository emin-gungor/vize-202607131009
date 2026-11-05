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

## SQL Sorgularını Çalıştırma (Adım Adım)

SQL kodları [sorgular.sql](sorgular.sql) dosyasındadır. Bu açıklamalar **Visual Studio Code ve PostgreSQL bağlantısı** üzerinden çalıştırmak içindir.

### 1. SQL dosyasını bilgisayarda açma

1. GitHub'da `vize-calismasi` dalına geçin ve `sorgular.sql` dosyasına tıklayın.
2. Dosya sayfasındaki **Raw** seçeneğiyle düz metin içeriğini açıp bilgisayara `sorgular.sql` olarak kaydedin. Alternatif olarak dosyanın kodunu kopyalayıp VS Code'da yeni bir `.sql` dosyasına yapıştırın.
3. VS Code'u açın. **File > Open File (Ctrl + O)** yoluyla `sorgular.sql` dosyasını açın. Mevcut eski ödev dosyalarının içeriğini değiştirmeyin.

### 2. PostgreSQL bağlantısını seçme

4. VS Code'da SQL dosyası açık ve etkin durumdayken sol alttaki **Select Postgres Server** bağlantısına tıklayın.
5. Daha önce yapılandırılmış PostgreSQL sunucusunu ve kullanılacak veritabanını seçin. Bu çalışmada bağlantıyı test etmek için daha önce kullanılan `llm_ops` veritabanı seçilmiştir; bu sorgular `llm_ops` içindeki tablolara bağlı değildir.
6. Altta bir sunucu veya veritabanı seçilmediğine dair uyarı çıkarsa SQL dosyası sekmesini etkinleştirip bağlantıyı tekrar seçin. Bu örneklerde PowerShell terminaline `psql` yazmak gerekmiyor; sorgular VS Code'un PostgreSQL sorgu çalıştırma özelliğiyle çalıştırılır.

### 3. Sorguları tek tek çalıştırma

7. `sorgular.sql` içinde önce **Soru 1** başlığının altındaki `SELECT 325 + 256 AS toplam_goruntu;` kodunu fareyle seçin.
8. Seçili kod üzerinde sağ tıklayın ve VS Code'daki PostgreSQL eklentisinin **Run Query / Execute Query (sorguyu çalıştır)** seçeneğini kullanın. Sonuçlar ayrı bir **Results** sekmesinde gösterilir.
9. **Soru 2** için `SELECT ROUND(256.0 * 100 / 581, 2) AS hasarli_orani;` kodunu seçip aynı işlemi yapın.
10. **Soru 3, 4, 5 ve 6** için her sorguyu **`WITH veri...` satırından başlayıp `;` ile biten son satıra kadar** bütün olarak seçin. Yalnızca son `SELECT` satırlarını seçmek yeterli değildir; `WITH` bloğu aynı sorgunun parçasıdır.
11. Sonuçları dosyadaki `-- Beklenen sonuc` yorumları ve aşağıdaki tabloyla karşılaştırın. `GROUP BY` sonuçlarında satır sırası değişebilir; sayılar aynı olmalıdır.

### 4. Beklenen sonuçlar

| Soru | Beklenen sonuç |
|---|---|
| 1 | Toplam 581 görüntü |
| 2 | Hasarlı görüntü oranı 44.06 (%44,06) |
| 3 | 6 özet kayıt ve toplam 581 görüntü |
| 4 | 256 hasarlı görüntü |
| 5 | `damaged`: 256, `intact`: 325 |
| 6 | `train`: 412, `valid`: 113, `test`: 56 |

### 5. Önemli açıklamalar

- Kalıcı tablo oluşturmak veya yeni veritabanı kurmak gerekmiyor. Sorguların `WITH` ve `VALUES` bölümleri yalnızca ilgili sorgu çalışırken kullanılan geçici **özet veri satırlarını** tanımlar.
- Bu kodlar JPG dosyalarını doğrudan okumaz. Veri setinin klasörlerinden elde edilen adet bilgileriyle sayısal analiz yapar.
- **Soru 3'teki `COUNT(*) = 6` sonucu görüntü adedini değil, altı özet veri satırını sayar.** Toplam görüntü sayısı `SUM(adet) = 581` ile hesaplanır.
- İlk iki sorgunun sonuçları VS Code üzerinden PostgreSQL bağlantısında çalıştırılarak kontrol edilmiştir. Diğer sorguların beklenen sonuçları dokümante edilmiştir; tamamının PostgreSQL üzerinde ayrı ayrı çalıştırıldığı iddia edilmemektedir.
- Bu aşama henüz görüntü verilerini bir veritabanı tablosuna aktarma veya bir yapay zekâ modeli eğitme aşaması değildir.

## Dosyalar

- `README.md`: Proje senaryosu ve SQL çalıştırma adımları
- `VERI_KARTI.md`: Veri kaynağı, kapsamı, sayımları ve sınırlamalar
- `sorgular.sql`: SQL soruları, sorgular ve beklenen sonuçlar
- `AI_BEYAN.md`: Yapay zekâ kullanım beyanı

## Bu Aşamanın Kapsamı

Bu çalışma veri setinin seçilmesi, veri kartının hazırlanması ve 3–5. hafta SQL konularına yönelik ön analiz çalışmasıdır. Henüz görüntülere karşı çalışan bir görüntü işleme modeli veya kalıcı veritabanı oluşturulmamıştır.
