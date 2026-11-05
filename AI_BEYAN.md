# Yapay Zekâ Kullanım Beyanı

Bu vize projesini hazırlarken **OpenAI ChatGPT** aracından destek aldım.

## Yapay zekâyı kullandığım aşamalar

1. Lojistik ve teslimat senaryosuna uygun bir görüntü veri seti bulma ve proje kapsamını belirleme konusunda fikir aldım.
2. `README.md` ve `VERI_KARTI.md` metinlerinin düzenlenmesi, anlaşılır hâle getirilmesi ve eksiklerin değerlendirilmesi için destek aldım.
3. `sorgular.sql` dosyasındaki SQL sorgularının yazılması, açıklanması ve gözden geçirilmesi aşamalarında yapay zekâdan yararlandım.
4. GitHub'da dal (branch), commit ve pull request işlemlerini öğrenmek ve yürütmek için yardım aldım.

## Veri ve sorgularla ilgili açıklama

Veri seti Roboflow Universe üzerindeki **Damaged Intact Box Dataset v1** kaynağından alınmıştır. Görüntü sayılarına ilişkin bilgiler indirilen veri setinin klasör yapısından elde edilmiştir.

Bu vize aşamasında kalıcı veritabanı tablosu oluşturulmadı. SQL analizlerinde görüntü dosyalarının kendileri yerine, klasörlere göre elde edilen **altı özet sayım kaydı** kullanıldı. `WITH` ve `VALUES` ifadeleri geçici sorgu verisi oluşturmak amacıyla kullanıldı.

İlk iki hesaplama sorgusunun sonuçları Visual Studio Code üzerinden PostgreSQL bağlantısıyla kontrol edildi. Kalan sorguların beklenen sonuçları hesaplandı ve kodları gözden geçirildi; hepsinin PostgreSQL'de ayrı ayrı çalıştırıldığı iddia edilmemektedir.

## Sorumluluk

Yapay zekâ desteği aldığım bölümleri bu belgede açıkça belirttim. Veri kaynağının belirtilmesi, çıktıların kontrolü ve teslim ettiğim çalışmanın içeriğinden sorumluyum.
