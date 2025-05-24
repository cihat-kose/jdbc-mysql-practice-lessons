-- Techno Study Mentoring Practices in Sakila Database
-- Select, Where, And, Or, Between, Like, Is Null, Order By, Limit, Distinct, Alias

-- ------------------------------------------------------------------------
-- Practice 01
-- "sakila" database'ini kullanınız.

USE sakila;

-- ------------------------------------------------------------------------
-- Practice 02
-- Tüm aktörlerin soyadını (last_name) döndürünüz.

SELECT 
    last_name
FROM
    actor;

-- ------------------------------------------------------------------------
-- Practice 03
-- Tüm aktörlerin ilk adını (first_name) ve soyadını (last_name) döndürünüz.

SELECT 
    first_name, last_name
FROM
    actor;

-- ------------------------------------------------------------------------
-- Practice 04
-- Aktör tablosundaki tüm sütunları döndürünüz.

-- 1. yöntem:
SELECT 
    *
FROM
    actor;
    
-- 2. yöntem:
SELECT 
    actor_id, first_name, last_name, last_update
FROM
    actor;
    
-- ------------------------------------------------------------------------
-- Practice 05
-- 60/3*5 şeklindeki matematik işleminin sonucunu döndürünüz.

-- 1. yöntem:
 SELECT 60 / 3 * 5;
 
 -- 2. yöntem:
SELECT 60 / 3 * 5 FROM DUAL;

-- ------------------------------------------------------------------------
-- Practice 06
-- Sistem zamanını sorgulayınız.

-- 1. yöntem:
SELECT NOW();

-- 2. yöntem:
SELECT NOW() FROM DUAL;

-- ------------------------------------------------------------------------
-- Practice 07
-- Soyadı ALLEN olan tüm oyuncuları döndürünüz.

SELECT 
    *
FROM
    actor
WHERE
    last_name = 'ALLEN';

-- ------------------------------------------------------------------------
-- Practice 08
-- Soyadları DAVIS ve adları SUSAN olan tüm aktörleri döndürünüz:

SELECT 
    *
FROM
    actor
WHERE
    last_name = 'DAVIS'
        AND first_name = 'SUSAN';

-- ------------------------------------------------------------------------
-- Practice 09
-- Soyadları ALLEN veya DAVIS olan tüm aktörleri döndürünüz.

-- 1. Yöntem
SELECT 
    *
FROM
    actor
WHERE
    last_name = 'ALLEN'
        OR last_name = 'DAVIS';

-- 2.Yöntem
SELECT 
    *
FROM
    actor
WHERE
    last_name IN ('ALLEN' , 'DAVIS');


-- ------------------------------------------------------------------------
-- Practice 10
-- Soyadı DAVIS olan ve actor_id değeri 100'den küçük olan aktörleri döndürünüz.

SELECT 
    *
FROM
    actor
WHERE
    last_name = 'DAVIS' AND actor_id < 100;

-- ------------------------------------------------------------------------
-- Practice 11
-- Değiştirme maliyeti 1 ile 10 fiyat arasında OLAN filmleri döndürünüz.

-- 1.Yöntem
SELECT 
    film_id, title, replacement_cost
FROM
    film
WHERE
    replacement_cost BETWEEN 1 AND 10;

-- 2. Yöntem
SELECT 
    film_id, title, replacement_cost
FROM
    film
WHERE
    replacement_cost >= 1
        AND replacement_cost <= 10;

-- ------------------------------------------------------------------------
-- Practice 12
-- Değiştirme maliyeti 1 ile 10 fiyat arasında OLMAYAN filmleri döndürünüz.

SELECT 
    film_id, title, replacement_cost
FROM
    film
WHERE
    replacement_cost NOT BETWEEN 1 AND 10;

-- ------------------------------------------------------------------------
-- Practice 13
-- İlk_adı P ile başlayan tüm aktörleri filtreleyiniz.

SELECT 
    *
FROM
    actor
WHERE
    first_name LIKE 'P%';

-- ------------------------------------------------------------------------
-- Practice 14
-- İlk_adı ES ile biten tüm aktörleri filtreleyiniz.

SELECT 
    *
FROM
    actor
WHERE
    first_name LIKE '%ES';

-- ------------------------------------------------------------------------
-- Practice 15
--  first_name öğesi ES içeren tüm aktörleri filtreleyiniz.alter

SELECT 
    *
FROM
    actor
WHERE
    first_name LIKE '%ES%';

-- ------------------------------------------------------------------------
-- Practice 16
-- first_name'i AY ile biten ve 3 karakter içeren tüm aktörleri filtreleyiniz.

SELECT 
    *
FROM
    actor
WHERE
    first_name LIKE '_AY';

-- ------------------------------------------------------------------------
-- Practice 17
-- Adı A ile başlamayan tüm kategorileri filtreleyiniz.

SELECT 
    *
FROM
    category
WHERE
    name NOT LIKE 'A%';

-- ------------------------------------------------------------------------
-- Practice 18
-- Parola belirlememiş tüm personeli ad ve soyadları ile birlikte listeleyiniz.

SELECT 
    first_name, last_name, password
FROM
    staff
WHERE
    password IS NULL;

-- ------------------------------------------------------------------------
-- Practice 19
-- Parola belirlememiş tüm personeli ad, soyad ve parolaları ile birlikte listeleyiniz.

SELECT 
    first_name, last_name, password
FROM
    staff
WHERE
    password IS NOT NULL;

-- ------------------------------------------------------------------------
-- Practice 20
-- Tüm aktörleri soyadlarına göre ARTAN sırada döndürünüz.

SELECT 
    actor_id, first_name, last_name
FROM
    actor
ORDER BY last_name ASC;

-- ------------------------------------------------------------------------
-- Practice 21
-- Tüm aktörleri soyadlarına göre AZALAN sırada döndürünüz.

SELECT 
    actor_id, first_name, last_name
FROM
    actor
ORDER BY last_name DESC;


-- ------------------------------------------------------------------------
-- Practice 22
-- Tüm aktörleri,soyadları öncelikli olmak üzere soyadlarına ve adlarına göre artan sırada döndürünüz.

SELECT 
    actor_id, first_name, last_name
FROM
    actor
ORDER BY last_name , first_name;

-- ------------------------------------------------------------------------
-- Practice 23
-- Film tablosundan derecelendirmesi 'G' olan EN UZUN 10 filmi döndürünüz.

SELECT 
    film_id, title, length
FROM
    film
WHERE
    rating = 'G'
ORDER BY length DESC
LIMIT 10;

-- ------------------------------------------------------------------------
-- Practice 24
-- Film tablosundan derecelendirmesi 'G' olan EN KISA 10 filmi döndürünüz.

SELECT 
    film_id, title, length
FROM
    film
WHERE
    rating = 'G'
ORDER BY length
LIMIT 10;


-- ------------------------------------------------------------------------
-- Practice 25
-- Film tablosunun satır sayısını döndürünüz. 

SELECT 
    COUNT(*)
FROM
    film;

-- ------------------------------------------------------------------------
-- Practice 26
-- Film tablosundaki son 10 filmi döndürünüz.alter

SELECT 
    film_id, title
FROM
    film
LIMIT 991 , 10;

-- ------------------------------------------------------------------------
-- Practice 27
-- Aktör tablosundaki yinelenmeyen soyisimleri yazdırınız.alter

SELECT DISTINCT
    last_name
FROM
    actor;


-- ------------------------------------------------------------------------
-- Practice 28
-- Tüm aktörleri ad, doyad ve tam adlarıyla birlikte döndürünüz. Örnek:| First Name | Last Name | Full Name|

SELECT 
    first_name `First Name`,
    last_name `Last Name`,
    CONCAT(first_name, ', ', last_name) `Full Name`
FROM
    actor;
