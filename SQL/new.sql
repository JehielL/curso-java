USE SAKILA;

show databases;

show tables;

SELECT * FROM customer;
SELECT email FROM customer;
SELECT first_name, last_name FROM customer;

SELECT * FROM payment;

SELECT * FROM payment WHERE staff_id = 1;

SELECT * FROM sakila.actor;

SELECT * FROM actor WHERE actor_id = 1;

SELECT * FROM actor WHERE actor_id >5;

SELECT * FROM payment WHERE amount >=5 AND amount <= 10;

SELECT * FROM payment WHERE amount BETWEEN 5 AND 10 ; -- ESTO ES UN COMENTARIO DE SQL 

SELECT * FROM payment WHERE payment_date BETWEEN '2005-01-01' AND '2005-07-01';

-- OPERADOR OR customer

SELECT * FROM address WHERE district = 'California' OR district = 'Nagasaki';

-- FILTRAR ADRESSS  QUE CONTENGA LA PALABRA AVENUE 

SELECT * FROM address WHERE address LIKE  '%Avenue%';
SELECT * FROM customer  WHERE email NOT LIKE '%@SAKILACUSTOMER.ORG';

SELECT * FROM CITY;

SELECT * FROM country WHERE country = 'SPAIN';

INSERT INTO city (city, country_id) VALUES ('leon',87);

SELECT * FROM CITY;
show columns from film; 

INSERT INTO film
 (title, language_id, rental_duration, rental_rate, replacement_cost)
VALUES
('LA CASA REDONDA', 1, 5, 2.99, 30.20);

-- SEGUNDA CLASE INSERTAR DATOS

    USE sakila;

SELECT * FROM staff;

SHOW COLUMNS FROM STAFF;

SELECT * FROM address;

SELECT * FROM store;

INSERT INTO staff (first_name, last_name, address_id, store_id, username) 
VALUES 
('JEHIEL', 'LINAREZ', 100, 1, 'JhLoner');

INSERT INTO staff (first_name, last_name, address_id, store_id, username) 
VALUES 
('carlos', 'ramirez', 100, 1, 'Carloner'),
('pedro', 'perez', 100, 1, 'Pedroner'),
('ramon', 'asuaje', 100, 1, 'Ramoner')
;

SELECT * FROM `LANGUAGE`;

SELECT * FROM `PRODUCTS`;

insert into language (name) values ('Azeri');
insert into language (name) values ('Tajik');
insert into language (name) values ('Swedish');
insert into language (name) values ('Azeri');
insert into language (name) values ('Tok Pisin');
insert into language (name) values ('Ndebele');
insert into language (name) values ('Malay');
insert into language (name) values ('Luxembourgish');
insert into language (name) values ('Zulu');
insert into language (name) values ('Greek');
insert into language (name) values ('English');
insert into language (name) values ('Dutch');
insert into language (name) values ('Luxembourgish');
insert into language (name) values ('Somali');
insert into language (name) values ('Icelandic');
insert into language (name) values ('English');
insert into language (name) values ('Dutch');
insert into language (name) values ('Māori');
insert into language (name) values ('Gujarati');
insert into language (name) values ('Quechua');
insert into language (name) values ('Spanish');
insert into language (name) values ('German');
insert into language (name) values ('Azeri');
insert into language (name) values ('Bosnian');
insert into language (name) values ('Guaraní');
insert into language (name) values ('Punjabi');
insert into language (name) values ('Kurdish');
insert into language (name) values ('Thai');
insert into language (name) values ('Kyrgyz');
insert into language (name) values ('Nepali');
insert into language (name) values ('Bosnian');
insert into language (name) values ('Pashto');
insert into language (name) values ('Persian');
insert into language (name) values ('Swati');
insert into language (name) values ('Dutch');
insert into language (name) values ('Bengali');
insert into language (name) values ('Greek');
insert into language (name) values ('Ndebele');
insert into language (name) values ('Guaraní');
insert into language (name) values ('Albanian');
insert into language (name) values ('Malayalam');
insert into language (name) values ('Quechua');
insert into language (name) values ('Azeri');
insert into language (name) values ('Papiamento');
insert into language (name) values ('West Frisian');
insert into language (name) values ('Burmese');
insert into language (name) values ('Persian');
insert into language (name) values ('Moldovan');
insert into language (name) values ('Bengali');
insert into language (name) values ('Georgian');
insert into language (name) values ('Indonesian');
insert into language (name) values ('Northern Sotho');
insert into language (name) values ('Dzongkha');
insert into language (name) values ('Hebrew');
insert into language (name) values ('Bosnian');
insert into language (name) values ('Guaraní');
insert into language (name) values ('Nepali');
insert into language (name) values ('Greek');
insert into language (name) values ('Dzongkha');
insert into language (name) values ('Sotho');
insert into language (name) values ('Belarusian');
insert into language (name) values ('Romanian');
insert into language (name) values ('Filipino');
insert into language (name) values ('Telugu');
insert into language (name) values ('Maltese');
insert into language (name) values ('Kyrgyz');
insert into language (name) values ('Malayalam');
insert into language (name) values ('Gagauz');
insert into language (name) values ('Kashmiri');
insert into language (name) values ('Croatian');
insert into language (name) values ('Northern Sotho');
insert into language (name) values ('Amharic');
insert into language (name) values ('Tetum');
insert into language (name) values ('Spanish');
insert into language (name) values ('Yiddish');
insert into language (name) values ('Hebrew');
insert into language (name) values ('Haitian Creole');
insert into language (name) values ('Haitian Creole');
insert into language (name) values ('Swahili');
insert into language (name) values ('Māori');
insert into language (name) values ('Dhivehi');
insert into language (name) values ('Hindi');
insert into language (name) values ('Nepali');
insert into language (name) values ('Tsonga');
insert into language (name) values ('Lithuanian');
insert into language (name) values ('Latvian');
insert into language (name) values ('Hiri Motu');
insert into language (name) values ('Northern Sotho');
insert into language (name) values ('Lao');
insert into language (name) values ('Assamese');
insert into language (name) values ('Portuguese');
insert into language (name) values ('Persian');
insert into language (name) values ('Lithuanian');
insert into language (name) values ('Afrikaans');
insert into language (name) values ('Kannada');
insert into language (name) values ('Icelandic');
insert into language (name) values ('Nepali');
insert into language (name) values ('Croatian');
insert into language (name) values ('Mongolian');
insert into language (name) values ('Croatian');

create table products (
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	title VARCHAR(50),
	price DECIMAL(5,2),
	`release` DATE
);
insert into products (id, title, price, `release`) values (1, 'Straw - Regular', 8.6, '2023-03-18');
insert into products (id, title, price, `release`) values (2, 'Cookies Oatmeal Raisin', 59.31, '2023-09-29');
insert into products (id, title, price, `release`) values (3, 'Basil - Fresh', 86.12, '2023-07-04');
insert into products (id, title, price, `release`) values (4, 'Cornstarch', 68.05, '2023-07-24');
insert into products (id, title, price, `release`) values (5, 'Glucose', 15.7, '2023-10-13');
insert into products (id, title, price, `release`) values (6, 'Mace Ground', 53.61, '2023-02-12');
insert into products (id, title, price, `release`) values (7, 'Cup - 8oz Coffee Perforated', 82.55, '2022-11-01');
insert into products (id, title, price, `release`) values (8, 'Plasticforkblack', 20.81, '2023-02-16');
insert into products (id, title, price, `release`) values (9, 'Bread - Pumpernickel', 72.32, '2022-11-10');
insert into products (id, title, price, `release`) values (10, 'Oil - Grapeseed Oil', 94.33, '2023-11-26');


-- ACTUALIZAR FILAS EXISTENTES


UPDATE `sakila`.`PRODUCTS` SET `price` = '10' WHERE (`id` = '1');

UPDATE products SET title = 'Cookies from maria',
price = 22.45
WHERE id = 3; 

SELECT * FROM products;
SET sql_safe_updates = 1;
UPDATE products 
SET `price` = 30 
WHERE `title` LIKE '%cookies%';

-- OPERACIONES CON UPDATE
SET sql_safe_updates = 0;

UPDATE products SET price = round(price * 0.90,2);

SELECT * FROM  film;

UPDATE film 
SET release_year = release_year + 1, rating = 'R' 
WHERE LENGTH(`description`) BETWEEN 50 AND 80;

-- DELETE

DELETE FROM `film` WHERE `film_id` = '1001';

SELECT * FROM products;

DELETE FROM `products`WHERE `price` > 5; -- BORRAR ALGUNOS PRODUCTOS

DELETE FROM `products` WHERE id = 1; 

-- VACIA LA TABLA SIN ELIMINARLA

TRUNCATE TABLE `products`; 

-- ELIMINA LA TABLA DEL TODO

DROP TABLE `products`;

-- DELETE DATABASE

DROP DATABASE IF EXISTS demo1; 

CREATE TABLE IF NOT EXISTS students (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(50) NOT NULL UNIQUE, -- NO SE PUEDE DUPLICAR
    country VARCHAR(30) DEFAULT 'Spain',
    age INT CHECK (age >= 18 AND age <= 100), 
    class_date DATE,
    class_attendance TINYINT DEFAULT 1
     
    );
    
    
SELECT * FROM students;


INSERT INTO students 
(first_name, last_name, email, country, age, class_date, class_attendance) 
VALUES 
('JEHIEL', 'LINAREZ', 'jehiellnhs@gmail.com', 'venezuela', 31, '2023-11-29', 1);


