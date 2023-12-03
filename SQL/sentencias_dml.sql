-- SENTENCIA SELECT DISTINCT

SELECT * FROM address;

SELECT district FROM address;

SELECT distinct district FROM address;

SELECT * FROM customer;

SELECT last_name FROM customer;

SELECT distinct first_name FROM customer;

-- SENTENCIA AND, OR , NOT

SELECT * FROM address;
SELECT * FROM address WHERE district = 'California';
SELECT * FROM address WHERE district != 'California';
SELECT * FROM address WHERE NOT district = 'California';
SELECT * FROM address WHERE NOT district = 'California' ORDER BY district;
SELECT * FROM address WHERE district = 'Abu Dhabi' or district = 'California' order by district;
SELECT * FROM address WHERE district IS NOT NULL ORDER BY district;
SELECT * FROM address WHERE NOT district = '' ORDER BY district;
SELECT * FROM address WHERE address2 IS NOT NULL AND address_id=1 ORDER BY district; 
SELECT * FROM address WHERE address2 IS NOT NULL OR address_id=1 ORDER BY district; 

-- SENTENCIA GROUP BY

SELECT district, count(district) FROM address GROUP BY district;
SELECT address_id, district FROM address;
SELECT district, count(district) FROM address GROUP BY district ORDER BY district;

SELECT last_name, count(last_name) FROM actor GROUP BY last_name;
SELECT last_name, count(last_name) FROM actor GROUP BY last_name HAVING count(last_name) > 1 ;

-- OBTENER EN CUANTAS PELICULAS A TRABAJADO CADA ACTOR

SELECT * FROM film_actor;
SELECT * FROM film;

SELECT f.title, count(fa.actor_id) FROM film f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.title ;

-- STOCK DE UNA PELICULA

SELECT * FROM inventory;

SELECT f.title, count(i.inventory_id) AS unidades FROM film f 
INNER JOIN inventory i ON i.film_id = f.film_id
WHERE title = 'ACADEMY DINOSAUR'
GROUP BY title;

SELECT f.title, count(i.inventory_id) AS unidades FROM film f 
INNER JOIN inventory i ON i.film_id = f.film_id
GROUP BY title ORDER BY unidades;

SELECT f.title, count(i.inventory_id) AS unidades FROM film f 
INNER JOIN inventory i ON i.film_id = f.film_id
WHERE title = 'FICTION CHRISTMAS'
GROUP BY title;

SELECT f.title, count(i.inventory_id) AS unidades FROM film f 
INNER JOIN inventory i ON i.film_id = f.film_id
GROUP BY title ORDER BY unidades DESC;



-- SENTENCIAS JOIN

SELECT * FROM customer;
SELECT * FROM address;
SELECT * FROM city;
SELECT * FROM country;

SELECT first_name, last_name, customer.address_id FROM customer 
INNER JOIN address ON customer.address_id = address.address_id;

SELECT first_name, last_name, customer.address_id FROM customer 
INNER JOIN address ON customer.address_id = address.address_id;

SELECT first_name, last_name, c.address_id FROM customer C
INNER JOIN address A ON c.address_id = a.address_id;

SELECT * FROM customer C
INNER JOIN address a on c.address_id = a.address_id;

SELECT c.email, a.address from customer c 
INNER JOIN address A ON c.address_id = a.address_id;


-- CONSULTAR 3 TABLAS

SELECT * FROM city ;


SELECT * FROM customer cu
INNER JOIN address A ON cu.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id;

SELECT cu.email, a.address, ci.city FROM customer cu
INNER JOIN address A ON cu.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id;

-- CONSULTAR 4 TABLAS

SELECT cu.email, a.address, ci.city, co.country FROM customer cu
INNER JOIN address A ON cu.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id ;

-- SENTENCIA CONCAT 

SELECT * FROM actor;

SELECT concat(first_name,' ', last_name) FROM actor;
SELECT concat(first_name,' ', last_name) AS full_name FROM actor;

-- SENTENCIA LIKE 

SELECT * FROM film;

SELECT * FROM film WHERE description = 'Documentary';
SELECT * FROM film WHERE description LIKE  '%Documentary%';
SELECT * FROM film WHERE description LIKE  '%Drama%';
SELECT * FROM actor WHERE last_name LIKE '%LI%' ORDER BY last_name DESC;
SELECT * FROM actor WHERE last_name LIKE '%LI%' ORDER BY last_name;

-- OPERADOR IN 

SELECT * FROM country;

SELECT * FROM country WHERE country = 'Spain' or country = 'Germany';
SELECT * FROM actor WHERE last_name LIKE '%LI%' ORDER BY last_name DESC;
SELECT * FROM country WHERE country IN('Spain' , 'Germany', 'Venezuela');
SELECT * FROM country WHERE country IN('Spain' , 'Germany', 'Venezuela', 'Mexico');

SELECT * FROM customer;
SELECT (first_name,  last_name) as full_name FROM customer WHERE customer_id IN(15,16,17,18);


-- OPERADOR SUM 

SELECT * FROM customer;
SELECT * FROM payment;

SELECT c.email, count(p.payment_id) AS num_pagos FROM payment p 
INNER JOIN customer c on p.customer_id = c.customer_id 
GROUP BY c.email;

SELECT c.customer_id, count(p.payment_id) AS num_pagos FROM payment p
INNER JOIN customer c ON p.customer_id = c.customer_id
GROUP BY c.customer_id;

SELECT c.email, sum(p.amount) AS num_pagos FROM payment p 
INNER JOIN customer c on p.customer_id = c.customer_id 
GROUP BY c.email;

SELECT * FROM staff;

SELECT s.first_name, count(p.payment_id)AS num_ventas, sum(p.amount) AS cantidad_ventas FROM payment p 
INNER JOIN staff s ON p.staff_id = s.staff_id
GROUP BY s.first_name;

-- SUB QUERIES 

SELECT * FROM film;
SELECT * FROM language;
SELECT language_id FROM film;

SELECT * FROM film f 
INNER JOIN language l on f.language_id = l.language_id;

SELECT l.name, count(f.film_id) FROM film f
INNER JOIN language l on f.language_id = l.language_id 
GROUP BY l.name ;

-- CAMBIAR IDIOMA ALGUNAS PELICULAS

UPDATE film SET language_id = 2 WHERE film_id > 100 and film_id < 200;

SELECT title FROM film
WHERE language_id IN (SELECT language_id FROM language WHERE name ='English' or name ='Japanese');

SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM film_actor;

-- PELICULAS MAS ALQUILADAS 

SELECT * FROM rental;
SELECT * FROM inventory;
SELECT * FROM film;

SELECT * FROM film f
INNER JOIN (SELECT * FROM inventory i
INNER JOIN rental r on r.inventory_id = i.inventory_id) res ON res.film_id = f.film_id;

SELECT f.title, count(f.film_id) as veces_alquilado FROM film f
INNER JOIN (SELECT * FROM inventory i
INNER JOIN rental r on r.inventory_id = i.inventory_id) res ON res.film_id = f.film_id
GROUP BY f.title 
ORDER BY veces_alquilado DESC;
