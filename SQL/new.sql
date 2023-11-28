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