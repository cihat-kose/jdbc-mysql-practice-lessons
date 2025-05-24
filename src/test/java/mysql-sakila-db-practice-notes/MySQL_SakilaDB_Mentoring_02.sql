-- Techno Study Mentoring Practices in Sakila Database
-- Group By, Having

-- Summary

-- GROUP BY: Bu ifade, belirli bir sütuna göre verileri gruplamak için kullanılır.
-- Örneğin, bir tablodaki verileri müşteri numarasına göre gruplamak istediğinizde GROUP BY customer_number ifadesini kullanabilirsiniz.
-- Bu, aynı müşteri numarasına sahip tüm satırları bir grup olarak birleştirir.

-- HAVING: Bu ifade, GROUP BY ifadesinden sonra kullanılır ve gruplar üzerinde filtreleme yapmak için kullanılır.
-- HAVING ifadesi, grupların belirli bir koşulu karşılaması gerektiğinde kullanılır.
-- Örneğin, toplam satış miktarı 1000 birimden fazla olan grupları filtrelemek istediğinizde HAVING SUM(sales_amount) > 1000 ifadesini kullanabilirsiniz.

-- Özetle, GROUP BY ifadesi verileri gruplamak için kullanılırken, HAVING ifadesi gruplar üzerinde filtreleme yapmak için kullanılır.

-- ------------------------------------------------------------------------
-- Practice 01
-- Her bir kategori için kaç film olduğunu döndürünüz.

SELECT 
    category_id, COUNT(*) AS film_sayisi
FROM
    film_category
GROUP BY category_id;

-- Bu sorgu, film_category tablosunu kullanarak her bir kategori için film sayısını hesaplar:

-- film_category: Filmlerin kategorilerini ilişkilendiren bir ilişki tablosudur.
-- COUNT(*) AS film_sayisi: Her bir kategori için film sayısını hesaplar.
-- GROUP BY category_id: Kategori bazında gruplama yaparız, her bir kategori için ayrı bir grup oluştururuz.

-- ------------------------------------------------------------------------
-- Practice 02
-- Her bir müşteri için kaç kiralama işlemi yapıldığını döndürünüz.

SELECT 
    customer_id, COUNT(*) AS kiralama_sayisi
FROM
    rental
GROUP BY customer_id;

-- Bu sorgu, rental tablosunu kullanarak her bir müşteri için yapılan kiralama işlemi sayısını hesaplar.

-- rental: Kiralama işlemlerinin bilgilerini içeren bir tablodur.
-- COUNT(*) AS kiralama_sayisi: Her bir müşteri için yapılan kiralama işlemi sayısını hesaplar:
-- GROUP BY customer_id: Müşteri bazında gruplama yaparız, her bir müşteri için ayrı bir grup oluştururuz.
-- Bu sorgu, her bir müşteri için yapılan kiralama işlemi sayısını döndürecektir.

-- ------------------------------------------------------------------------
-- Practice 03
-- Her bir çalışanın kaç müşteriye hizmet verdiğini döndürünüz.

SELECT 
    staff_id, COUNT(DISTINCT customer_id) AS musteri_sayisi
FROM
    rental
GROUP BY staff_id;

-- Bu sorgu, rental tablosunu kullanarak her bir çalışanın kaç farklı müşteriye hizmet verdiğini hesaplar:

-- rental: Kiralama işlemlerinin bilgilerini içeren bir tablodur.
-- COUNT(DISTINCT customer_id) AS musteri_sayisi: Her bir çalışanın kaç farklı müşteriye hizmet verdiğini hesaplar.
-- GROUP BY staff_id: Çalışan bazında gruplama yaparız, her bir çalışan için ayrı bir grup oluştururuz.
-- Bu sorgu, her bir çalışanın kaç müşteriye hizmet verdiğini döndürecektir.

-- ------------------------------------------------------------------------
-- Practice 04
-- Her bir mağazadaki çalışan sayısını döndürünüz.

SELECT 
    store_id, COUNT(*) AS calisan_sayisi
FROM
    staff
GROUP BY store_id;

-- Bu sorgu, staff tablosunu kullanarak her bir mağazadaki çalışan sayısını hesaplar:

-- staff: Çalışanların bilgilerini içeren bir tablodur.
-- COUNT(*) AS calisan_sayisi: Her bir mağazadaki çalışan sayısını hesaplar.
-- GROUP BY store_id: Mağaza bazında gruplama yaparız, her bir mağaza için ayrı bir grup oluştururuz.
-- Bu sorgu, her bir mağazadaki çalışan sayısını döndürecektir.

-- ------------------------------------------------------------------------
-- Practice 05
-- En az 1 tane çalışanı olan mağazaları döndürünüz.

SELECT 
    store_id, COUNT(*) AS calisan_sayisi
FROM
    staff
GROUP BY store_id
HAVING COUNT(*) >= 1;

-- SELECT: Bu kelime, sorgunun sonucunda döndürülecek sütunları belirtmek için kullanılır.
-- store_id: Bu, SELECT ifadesinin bir parçası olarak kullanılan bir sütun adıdır. Sonuçlarda her bir mağazanın kimlik numarasını temsil eder.
-- COUNT(*): Bu, SELECT ifadesinin bir parçası olarak kullanılan bir fonksiyondur. * sembolü, tüm satırları saymak için kullanılır. Bu durumda, her bir mağazadaki çalışan sayısını temsil eder.
-- AS calisan_sayisi: Bu ifade, COUNT(*) fonksiyonunun sonucunu calisan_sayisi olarak adlandırır. Bu, sonuçlarda çalışan sayısının görünen sütun adı olacaktır.
-- FROM: Bu kelime, sorgunun hangi tablodan veri alacağını belirtmek için kullanılır. Bu durumda, staff tablosundan veri alınır.
-- GROUP BY: Bu ifade, sorgunun sonuçlarını gruplamak için kullanılır. Bu durumda, her bir mağaza için ayrı bir grup oluşturulur.
-- HAVING: Bu ifade, GROUP BY ifadesinden sonra kullanılır ve gruplama sonrasında filtreleme yapmak için kullanılır.
-- COUNT(*) >= 1: Bu ifade, HAVING ifadesinin bir parçasıdır. COUNT(*) fonksiyonunun sonucunu kontrol eder ve en az 1 çalışana sahip olan mağazaları seçer.
-- Bu şekilde, sorgu her bir mağazanın çalışan sayısını hesaplar ve en az bir çalışana sahip olan mağazaları seçer.

-- ------------------------------------------------------------------------
-- Practice 06
-- En az 30 kiralama işlemi yapan müşterileri döndürünüz.

SELECT 
    customer_id, COUNT(*) AS kiralama_sayisi
FROM
    rental
GROUP BY customer_id
HAVING COUNT(*) >= 30;

-- Bu sorgu, rental tablosunu kullanarak en az 30 kiralama işlemi yapan müşterileri bulur:

-- rental: Kiralama işlemlerinin bilgilerini içeren bir tablodur.
-- COUNT(*) AS kiralama_sayisi: Her bir müşterinin yaptığı kiralama işlemi sayısını hesaplar.
-- GROUP BY customer_id: Müşteri bazında gruplama yaparız, her bir müşteri için ayrı bir grup oluştururuz.
-- HAVING COUNT(*) >= 30: En az 30 kiralama işlemi yapan müşterileri seçer.
-- Bu sorgu, en az 30 kiralama işlemi yapan müşterileri döndürecektir.

-- ------------------------------------------------------------------------
-- Practice 07
-- Toplam kiralama süresi en az 5 gün olan filmleri döndürünüz.

SELECT 
    film_id, title, SUM(rental_duration) AS toplam_sure
FROM
    film
GROUP BY film_id
HAVING SUM(rental_duration) >= 5;

-- Bu sorgu, film tablosundaki her bir film için film_id, title ve rental_duration sütunlarını kullanır. 
-- SUM(rental_duration) fonksiyonu, her bir film için toplam kiralama süresini hesaplar. 
-- GROUP BY koşulu ile her bir film için ayrı bir grup oluşturulur.
-- HAVING koşulu ile toplam kiralama süresi en az 5 gün olan filmler seçilir. 
-- Eğer bir film, toplam kiralama süresi 5 gün veya daha fazla ise, o film sonuçlarda yer alır.

-- Bu sorguyu kullanarak, toplam kiralama süresi en az 5 gün olan filmleri elde edebilirsiniz. 

-- ------------------------------------------------------------------------
-- Practice 08
-- Değeri (amount) 90'dan büyük olan kiralama işlemlerini döndürünüz.

SELECT 
    customer_id, SUM(amount) AS total_amount
FROM
    payment
GROUP BY customer_id
HAVING SUM(amount) > 90;

-- SELECT customer_id, SUM(amount) as total_amount : "customer_id" ve "SUM(amount)" sütunlarını seçiyoruz. 
-- "SUM(amount)" ifadesi, her bir müşteri için ödeme tutarlarının toplamını hesaplar. 
-- "total_amount" olarak adlandırılan bir sütunda bu toplamları görüntüleyeceğiz.
-- FROM payment : "payment" tablosunda sorguyu çalıştırıyoruz.
-- GROUP BY customer_id : "customer_id" değerine göre gruplama yapıyoruz. Bu, her bir müşteri için ayrı bir grup oluşturur.
-- HAVING SUM(amount) > 90 : Gruplama sonuçları üzerinde bir filtre uyguluyoruz. 
-- Sadece toplam tutarı 90'dan büyük olan müşterileri seçiyoruz.
-- Sonuç olarak, "amount" değeri 90'dan büyük olan kiralama işlemlerini seçiyoruz ve bu işlemlerin toplam tutarlarını "total_amount" sütununda gösteriyoruz.