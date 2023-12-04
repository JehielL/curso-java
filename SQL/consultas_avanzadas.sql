-- consultar una base de datos con nombre especifico

SELECT pg_size_pretty (pg_database_size('northwind'));

-- consultar todas las bases de datos instaladas

SELECT pg_database.datname, pg_size_pretty (pg_database_size (pg_database.datname)) AS SIZE FROM pg_database;

-- consultar tamaño de tablas

SELECT pg_size_pretty(pg_relation_size('orders'));

--consultar tamaño de las 10 tablas mas pesadas

SELECT 
	relname AS "relation",
	pg_size_pretty (
		pg_total_relation_size(C .oid)
	) AS "total_size"
FROM 
	pg_class C
LEFT JOIN pg_namespace N ON (N.oid  = C .relnamespace)
WHERE  
	nspname NOT IN (
	'pg_catalog',
	'information_schema'
	)
AND C .relkind <> 'i'
AND nspname !~ 'pg_toast'
ORDER BY 
	pg_total_relation_size(C .oid) DESC
LIMIT 10;

-- consultas joints

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM shippers;


-- INNER JOIN 

SELECT o.order_id, c.contact_name FROM orders o 
INNER JOIN customers c ON o.customer_id = c.customer_id;


SELECT o.order_id, c.contact_name, s.company_name FROM orders o 
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN shippers s ON o.ship_via = s.shipper_id;

SELECT c.contact_name, o.order_id FROM customers c 
LEFT JOIN orders o on c.customer_id = o.customer_id;

SELECT o.order_id, e.first_name, e.last_name FROM orders o 
INNER JOIN employees e on o.employee_id = e.employee_id;

-- LEFT JOIN

SELECT o.order_id, e.first_name, e.last_name FROM orders o 
LEFT JOIN employees e ON o.employee_id = e.employee_id;

-- RIGHT JOIN

SELECT o.order_id, e.first_name, e.last_name FROM orders o 
RIGHT JOIN employees e ON o.employee_id = e.employee_id;


INSERT INTO employees (employee_id, last_name, first_name, title)
VALUES (10, 'Emp10', 'Emp10', 'Director');

-- GROUP BY

SELECT * FROM customers;

SELECT city, count(customer_id) AS num_customers FROM customers GROUP BY city;
SELECT city, count(customer_id) AS num_customers FROM customers GROUP BY city ORDER BY city;

SELECT country, count(customer_id) AS num_customers FROM customers 
GROUP BY country ORDER BY num_customers DESC;

SELECT e.title, count(o.order_id) FROM orders o 
INNER JOIN employees e ON o.employee_id = e.employee_id
GROUP BY e.title
ORDER BY num_orders DESC;

SELECT e.first_name, e.last_name, count(o.order_id) AS num_orders FROM orders o 
INNER JOIN employees e ON o.employee_id = e.employee_id
GROUP BY e.first_name, e.last_name
ORDER BY num_orders DESC;

-- VISTAS

CREATE VIEW num_orders_by_employee AS 
SELECT e.first_name, e.last_name, count(o.order_id) AS num_orders FROM orders o 
INNER JOIN employees e ON o.employee_id = e.employee_id
GROUP BY e.first_name, e.last_name
ORDER BY num_orders DESC;

SELECT * FROM num_orders_by_employee;

-- VISTAS MATERIALIZADAS
CREATE MATERIALIZED VIEW mv_num_orders_by_employee AS 
SELECT e.first_name, e.last_name, count(o.order_id) AS num_orders FROM orders o 
INNER JOIN employees e ON o.employee_id = e.employee_id
GROUP BY e.first_name, e.last_name
ORDER BY num_orders DESC
WITH DATA;

SELECT * FROM mv_num_orders_by_employee;

SELECT * FROM order_details;

CREATE TABLE example (
	id INT,
	NAME VARCHAR);
	
SELECT * FROM example ;

INSERT INTO example(id) 
SELECT * FROM generate_series(1, 500000);

CREATE MATERIALIZED VIEW mv_example AS 
SELECT * FROM example
WITH DATA;

SELECT * FROM mv_example;


SELECT * FROM generate_series(
	'2022-01-01 00:00'::timestamp,
	'2023-12-01 00:00',
	'6 hours'
);

-- EXPLAIN ANALYZE PARA OPTIMIZAR BASES DE DATOS

EXPLAIN ANALYZE SELECT * FROM order_details;

EXPLAIN ANALYZE SELECT * FROM mv_num_orders_by_employee;

EXPLAIN ANALYZE SELECT * FROM num_orders_by_employee;

-- INDICES

CREATE INDEX idx_orders_pk ON orders(order_id);
EXPLAIN ANALYZE SELECT * FROM orders;

EXPLAIN ANALYZE SELECT * FROM example;
CREATE INDEX idx_example_pk ON example(id);

EXPLAIN ANALYZE SELECT * FROM example WHERE id = 456777;

-- PARTICIONAMIENTO

--base
CREATE TABLE users(
	id BIGSERIAL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (id, birth_date)
) PARTITION BY RANGE (birth_date);

-- particiones
CREATE TABLE users_2020 PARTITION OF users 
FOR VALUES FROM ('2020-01-01') TO ('2021-01-01');

CREATE TABLE users_2021 PARTITION OF users 
FOR VALUES FROM  ('2021-01-01') TO ('2022-01-01');

CREATE TABLE users_2022 PARTITION OF users 
FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');


INSERT INTO users (birth_date, first_name)
VALUES 
('2020-01-15', 'usuario1'),
('2020-06-15', 'usuario2'),
('2021-02-15', 'usuario3'),
('2021-11-15', 'usuario4'),
('2022-04-15', 'usuario5'),
('2022-12-15', 'usuario6');

SELECT * FROM users_2020;

EXPLAIN ANALYZE SELECT * FROM users;
EXPLAIN ANALYZE SELECT * FROM users WHERE birth_date = '2020-06-15';