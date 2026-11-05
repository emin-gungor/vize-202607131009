# Veri Kartı

## 1. Veri Seti Bilgileri

- **Veri seti adı:** Damaged Intact Box Dataset
- **Kaynak:** Roboflow Universe
- **Sürüm:** v1
- **Sürüm tarihi:** 9 Haziran 2025
- **İndirme tarihi:** 5 Kasım 2026
- **Lisans:** CC BY 4.0 (kaynak gösterilerek kullanılabilir)
- **Kaynak bağlantısı:** https://universe.roboflow.com/damages-intact-box-dataset/damaged-intact-box-dataset/dataset/1

## 2. Veri Setinin Amacı

Bu veri setinde sağlam ve hasarlı olarak sınıflandırılmış kutu ve ambalaj görüntüleri bulunmaktadır.

Projemde bu görüntüleri, lojistik merkezlerinde kargoların sevkiyat öncesinde kameralarla kontrol edilmesi senaryosu için kullanmayı planlıyorum.

Hasarlı görüntüler anormal, sağlam görüntüler ise normal durum olarak değerlendirilecektir. Böylece anomali tespiti konusu üzerinde çalışılacaktır.

## 3. Veri Setinin İçeriği

Veri setinde toplam 581 görüntü bulunmaktadır.

- **Sağlam (intact):** 325 görüntü
- **Hasarlı (damaged):** 256 görüntü
- **Dosya formatı:** JPG
- **Görüntü boyutu:** 640x640 piksel

Görüntüler eğitim, doğrulama ve test olarak üç bölüme ayrılmıştır.

| Bölüm | Sağlam | Hasarlı | Toplam |
|---|---:|---:|---:|
| train | 228 | 184 | 412 |
| valid | 61 | 52 | 113 |
| test | 36 | 20 | 56 |
| **Toplam** | **325** | **256** | **581** |

Veri setindeki görüntüler 640x640 piksel boyutuna yeniden ölçeklendirilmiştir. Görüntülere otomatik yön düzeltmesi uygulanmış, ek görüntü artırma işlemi yapılmamıştır.

## 4. Veri Kontrolü

İndirilen ZIP dosyasındaki 581 görüntünün tamamı kontrol edilmiş ve açılabildiği doğrulanmıştır.

Bozuk görüntü dosyası veya birebir aynı dosya içeriğine sahip tekrar bulunmamıştır.

Görüntüler `intact` ve `damaged` klasörlerinde tutulmaktadır. Ayrı bir CSV dosyası bulunmamaktadır.

Ancak görüntülerin sağlam veya hasarlı olarak doğru etiketlenip etiketlenmediği tek tek doğrulanmamıştır.

## 5. Veri Setinin Sınırlamaları

Veri setinde teslimat adresi, takip numarası veya teslimat süresi gibi bilgiler bulunmamaktadır.

Görüntülerin gerçek bir lojistik merkezinden toplandığı da doğrulanmamıştır.

Bu nedenle veri seti, kargo dağıtımını incelemek yerine kutu ve ambalajların görsel hasar durumlarını analiz etmek için kullanılacaktır

## 6. Planlanan SQL Analizleri

Bu veri setiyle aşağıdaki soruları incelemeyi planlıyorum:

1. Toplam kaç görüntü bulunmaktadır?
2. Kaç görüntü sağlam, kaçı hasarlı olarak etiketlenmiştir?
3. Eğitim, doğrulama ve test bölümlerinde kaç görüntü vardır?
4. Hasarlı görüntülerin toplam görüntülere oranı nedir?

Bu sorular için SELECT, WHERE, COUNT ve GROUP BY gibi temel SQL komutlarını kullanmayı planlıyorum.

Bu aşamada veri kaynağı incelenmiş ve analiz soruları belirlenmiştir. Henüz veritabanı tablosu oluşturulmadığı için SQL sorguları veri seti üzerinde çalıştırılmamıştır.
