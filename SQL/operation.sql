USE SAKILA; 

SELECT * FROM payment;

-- SOLICITAR DATOS EN ORDEN ASCENDENTE

SELECT * FROM payment ORDER BY amount;
SELECT * FROM payment ORDER BY amount ASC;

-- SOLICITAR DATOS EN ORDEN DESCENDIENTE

SELECT * FROM payment ORDER BY amount DESC; 

SELECT * FROM payment ORDER BY amount DESC; 

-- SOLICITAR DATOS DE 2 COLUMNAS ORDENADOS

SELECT * FROM payment ORDER BY amount DESC, staff_id DESC; 
SELECT * FROM payment WHERE amount < 3 ORDER BY amount ASC;

-- SOLICITAR DATOS EN ORDEN POR FECHA
SELECT * FROM payment ORDER BY payment_date;
SELECT * FROM payment ORDER BY payment_date DESC;

SELECT * FROM customer;

SELECT * FROM customer  ORDER BY last_name ASC;

-- USE LIMITS

USE world;
SELECT * FROM country;
SELECT * FROM country ORDER BY population DESC limit 10;

-- PAGINACION 20 PRIMEROS, 20 SEGUNDOS Y 20 ULTIMOS

SELECT * FROM country ORDER BY population DESC LIMIT 40;
SELECT * FROM country ORDER BY population DESC LIMIT 20, 20;
SELECT * FROM country ORDER BY population DESC LIMIT 20 OFFSET 20;
SELECT * FROM country ORDER BY population DESC LIMIT 20 OFFSET 30;
SELECT * FROM country ORDER BY population DESC LIMIT 20 OFFSET 40;


-- 	COUNT()

SELECT * FROM customer;

SELECT count(*) as num_customers FROM customer;

-- UTILIZANDO UNA COLUMNA CON UN VALOR ÚNICO

SELECT count(customer_id) AS  num_customer FROM customer;
SELECT count(email) AS num_customer FROM customer;

-- SUM 
SELECT * FROM customer;
SELECT sum(`active`) FROM customer ;
SELECT sum(`active`) FROM customer WHERE `active` = 1 ;

-- CALCULAR CLIENTES INACTIVOS

SELECT 
count(*) AS total, 
sum(`active`) AS total_active, 
count(*) - sum(`active`) AS total_inactive 
FROM customer;

-- SUMAR TODOS LOS AMOUNT PAYMENTS

SELECT * FROM payment;
SELECT count(*) AS num_payments FROM payment;
SELECT sum(amount) FROM payment;

-- Avg 

SELECT 
  COUNT(*) AS num_payments,
  SUM(amount) AS total_amount,
  SUM(amount) / COUNT(*)  AS avg
FROM payment;

SELECT 
ROUND (AVG(amount), 2) AS average 
FROM payment;

SELECT * FROM film;

SELECT 
ROUND(AVG(`length`))
AS duracion_pelis_media
FROM film;

-- MIN 
SELECT * FROM FILM;
SELECT  MIN(`length`) AS most_short_movie FROM FILM;

-- MAX 

SELECT  MAX(`length`) AS most_short_movie FROM FILM;

SELECT * FROM payment;

SELECT DATE(create_date) FROM customer;

SELECT 
YEAR(create_date)  AS create_year, 
month(create_date) AS create_month,
monthname(create_date) AS month_name,
week(create_date) AS create_week,
dayofyear(create_date) AS release_day,
dayofmonth(create_date) AS month_day,
dayofweek(create_date) AS day_of_week

FROM customer;

-- FROM DATE

SELECT 
YEAR(create_date)  AS create_year, 
month(create_date) AS create_month,
monthname(create_date) AS month_name,
week(create_date) AS create_week,
dayofyear(create_date) AS release_day,
dayofmonth(create_date) AS month_day,
dayofweek(create_date) AS day_of_week

FROM customer;

SELECT
payment_date AS original_date,
year(payment_date)  AS payment_year, 
month(payment_date) AS payment_month,
monthname(payment_date) AS payment_name,
week(payment_date) AS payment_week,
dayofyear(payment_date) AS payment_day,
dayofmonth(payment_date) AS month_day,
dayofweek(payment_date) AS day_of_week_payment

FROM payment;

-- CONCAT

SELECT * FROM customer;

SELECT CONCAT(first_name, ' ' ,last_name) AS full_name FROM customer;

SELECT first_name, length(first_name) AS `longitud` FROM customer;

SELECT 
first_name, 
length(first_name) AS `longitud` 
FROM customer
;


-- DISTINCT 

SELECT * FROM actor;

SELECT first_name FROM actor;

SELECT distinct(first_name) FROM actor;

SELECT last_name FROM actor;

SELECT distinct(last_name) FROM actor;

-- GROUP BY

use WORLD;

SELECT * FROM country;

SELECT continent, 
count(*) AS num_of_country 
FROM country 
group by continent;
	
SELECT continent,
SUM(population) AS num_of_person
FROM  country
GROUP BY continent;

