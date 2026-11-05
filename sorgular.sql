
-- Veritabani Vize Odevim
-- Veri seti: Damaged Intact Box Dataset
-- Sayilar indirilen goruntu klasorlerinden elde edilmistir.
-- Bu sorgularda kalici tablo olusturulmaz.

-- Soru 1: Toplam kac goruntu var?

SELECT 325 + 256 AS toplam_goruntu;

-- Beklenen sonuc: 581


-- Soru 2: Hasarli goruntulerin yuzdesi nedir?

SELECT ROUND(256.0 * 100 / 581, 2) AS hasarli_orani;

-- Beklenen sonuc: 44.06


-- Soru 3: Toplam goruntu sayisi ve ozet kayit sayisi

WITH veri(bolum, durum, adet) AS (
    VALUES
    ('train', 'intact', 228),
    ('train', 'damaged', 184),
    ('valid', 'intact', 61),
    ('valid', 'damaged', 52),
    ('test', 'intact', 36),
    ('test', 'damaged', 20)
)
SELECT COUNT(*) AS ozet_kayit_sayisi,
       SUM(adet) AS toplam_goruntu
FROM veri;

-- Beklenen sonuc: 6 ozet kayit, 581 goruntu


-- Soru 4: Hasarli goruntu sayisi

WITH veri(bolum, durum, adet) AS (
    VALUES
    ('train', 'intact', 228),
    ('train', 'damaged', 184),
    ('valid', 'intact', 61),
    ('valid', 'damaged', 52),
    ('test', 'intact', 36),
    ('test', 'damaged', 20)
)
SELECT SUM(adet) AS hasarli_goruntu
FROM veri
WHERE durum = 'damaged';

-- Beklenen sonuc: 256


-- Soru 5: Saglam ve hasarli goruntu sayilari

WITH veri(bolum, durum, adet) AS (
    VALUES
    ('train', 'intact', 228),
    ('train', 'damaged', 184),
    ('valid', 'intact', 61),
    ('valid', 'damaged', 52),
    ('test', 'intact', 36),
    ('test', 'damaged', 20)
)
SELECT durum, SUM(adet) AS goruntu_sayisi
FROM veri
GROUP BY durum;

-- Beklenen sonuc:
-- damaged: 256
-- intact: 325


-- Soru 6: Bolumlere gore goruntu sayilari

WITH veri(bolum, durum, adet) AS (
    VALUES
    ('train', 'intact', 228),
    ('train', 'damaged', 184),
    ('valid', 'intact', 61),
    ('valid', 'damaged', 52),
    ('test', 'intact', 36),
    ('test', 'damaged', 20)
)
SELECT bolum, SUM(adet) AS goruntu_sayisi
FROM veri
GROUP BY bolum;

-- Beklenen sonuc:
-- train: 412
-- valid: 113
-- test: 56
