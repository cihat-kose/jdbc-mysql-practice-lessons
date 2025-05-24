-- Techno Study Mentoring Practices in Sakila Database
-- Join, DDL-DML Komutları

-- ------------------------------------------------------------------------
-- Practice 01
-- En az 60 filmi olan kategorileri döndürünüz.

-- Adım 1: Kategorileri ve film_category tablolarını birleştirme

SELECT
    category.name, film_category.film_id
FROM
    category
        JOIN
    film_category ON category.category_id = film_category.category_id;

-- Bu sorgu, `category` ve `film_category` tablolarını birleştirir ve
-- her bir kategoriye ait film kimlik numaralarını döndürür.

-- Adım 2: Kategorileri ve film sayılarını gruplama

SELECT
    category.name,
    COUNT(DISTINCT film_category.film_id) AS film_count
FROM
    category
        JOIN
    film_category ON category.category_id = film_category.category_id
GROUP BY category.name;

-- Bu sorgu, kategorileri ve her bir kategorinin kaç farklı film içerdiğini sayar.
-- `COUNT(DISTINCT film_category.film_id)` ifadesi, her kategorideki benzersiz film sayısını döndürür.

-- Adım 3: En az 60 film içeren kategorileri filtreleme

SELECT
    category.name,
    COUNT(DISTINCT film_category.film_id) AS film_count
FROM
    category
        JOIN
    film_category ON category.category_id = film_category.category_id
GROUP BY category.name
HAVING COUNT(DISTINCT film_category.film_id) >= 60;

-- Bu sorgu, en az 60 farklı film içeren kategorileri filtreler.
-- `HAVING COUNT(DISTINCT film_category.film_id) >= 60` ifadesi,
-- film sayısı 60'dan fazla olan kategorileri seçer.

-- Sonuç olarak, bu adımları takip ederek sakila veritabanında en az
-- 60 farklı film içeren kategorilerin adlarını ve film sayılarını elde edebilirsiniz.


-- ------------------------------------------------------------------------
-- Practice 02
-- Bir veritabanı oluşturun.
-- Oluşturduğunuz bu veritabanına bir müşteri tablosu ekleyin.
-- Oluşturduğunuz bu  müşteri tablosuna bir müşteri ekleyin
-- Eklediğiniz bu müşterinin e-posta adresini güncelleyin.

-- Adım 1: Veritabanı Oluşturma

CREATE DATABASE customer_database;

-- Veritabanı oluşturmak için "CREATE DATABASE" ifadesini kullanırız.
-- Bu ifade, yeni bir veritabanı oluşturmak için kullanılan bir DDL (Data Definition Language) ifadesidir.
-- Bu sorgu, "customer_database" adında bir veritabanı oluşturacaktır.

-- Adım 2: Veritabanını Seçme

USE customer_database;

-- Veritabanını kullanmak için "USE" ifadesini kullanırız.
-- Bu ifade, belirli bir veritabanını seçmek için kullanılan bir DML (Data Manipulation Language) ifadesidir.
-- Bu sorgu, "customer_database" veritabanını seçer. Artık bu veritabanı üzerinde çalışabilirsiniz.
-- Diğer sorguları bu veritabanı üzerinde gerçekleştireceksiniz.

-- Adım 3: Tablo Oluşturma

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    address VARCHAR(200)
);

-- Tablo, veritabanında verileri organize etmek için kullanılan bir yapıdır.
-- Bir tablo oluşturmak için "CREATE TABLE" ifadesini kullanırız.
-- Bu sorgu, "customers" adında bir tablo oluşturacaktır.
-- Tablonun sütunları "customer_id", "first_name", "last_name", "email" ve "address" olacaktır.
-- Her sütunun veri türü belirtilmiştir.
-- "customer_id" sütunu, birincil anahtar (primary key) sütunu olarak belirlenmiştir.
-- Birincil anahtar, her bir satırı benzersiz bir şekilde tanımlayan bir değerdir.
-- Bu durumda, "customer_id" sütunu INT (tamsayı) veri türüne sahiptir ve her müşteri için benzersiz bir değer içermelidir.
-- "first_name", "last_name", "email" ve "address" sütunları ise VARCHAR veri türüne sahiptir.
-- VARCHAR, değişken uzunluklu karakter dizilerini saklamak için kullanılan bir veri türüdür.
-- Örneğin, "first_name" sütunu 50 karakter uzunluğunda bir karakter dizisi saklayabilir.

-- Adım 4: Veri Ekleme

INSERT INTO customers (customer_id, first_name, last_name, email, address)
VALUES (1, 'John', 'Doe', 'john.doe@example.com', '123 Main St');

-- Oluşturduğunuz tabloya veri eklemek için "INSERT INTO" ifadesini kullanırız.
-- Bu sorgu, "customers" tablosuna yeni bir müşteri ekleyecektir.
-- "VALUES" ifadesi içindeki sütunlara göre, eklediğiniz müşterinin bilgilerini belirtirsiniz.
-- Yukarıdaki örnekte, müşteri ID'si 1, adı "John", soyadı "Doe", e-posta adresi "john.doe@example.com" ve adresi "123 Main St" olarak belirlenmiştir.

-- Adım 5: Veri Güncelleme

UPDATE customers
SET
    email = 'johndoe@example.com'
WHERE
    customer_id = 1;

-- Eklediğiniz müşterinin bilgilerini güncellemek için "UPDATE" ifadesini kullanırız.
-- Bu sorgu, "customers" tablosundaki müşterilerden "customer_id" değeri 1 olan müşterinin e-posta adresini "johndoe@example.com" olarak güncelleyecektir.
-- "SET" ifadesi ile güncellemek istediğiniz sütunu belirtir ve "WHERE" ifadesi ile güncellemek istediğiniz satırı belirtirsiniz.
