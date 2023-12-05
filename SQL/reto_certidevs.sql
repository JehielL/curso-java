CREATE DATABASE restaurant;

USE restaurant;

CREATE TABLE IF NOT EXISTS dishes(
	dish_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dish_name VARCHAR(50),
    description TEXT, 
    price INT 
);

CREATE TABLE IF NOT EXISTS employees (
	employee_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50), 
    last_name VARCHAR (50),
    position TEXT, 
    salary int
); 

CREATE TABLE IF NOT EXISTS customers(
	 customer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
     first_name VARCHAR(50),
     last_name VARCHAR (50),
     contact_info TEXT
);

CREATE TABLE IF NOT EXISTS orders(
	order_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    total_amount INT,
    customer_id INT,
    employees_id INT,
	CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    CONSTRAINT fk_orders_employees FOREIGN KEY (employees_id) REFERENCES employees (employee_id)
);

CREATE TABLE IF NOT EXISTS order_details(
    order_id INT NOT NULL,
    dish_id INT NOT NULL,
    quantity INT,
    price INT,
    PRIMARY KEY (order_id, dish_id),
    CONSTRAINT fk_order_details_orders FOREIGN KEY (order_id) REFERENCES orders (order_id),
    CONSTRAINT fk_order_details_dishes FOREIGN KEY (dish_id) REFERENCES dishes (dish_id)
);

-- INSERTAR PLATOS EN TABLA DISHES 

SELECT * FROM dishes;
INSERT INTO dishes (dish_name, description, price )
VALUES 
('TAKOYAKI', 'bolas de masa rellenas de pulpo' , 2 ),
('YAKITORI', 'brochetas de pollo' , 5 ),
('WAKAME SALAD', 'ensalada de algas y pepino' , 10 ),
('WAGYU TARTARE', 'Carne de wagyu cortada a cuchillo con salsa ponzu y trufa' , 300 ),
('KING CRAB TARABA', 'Pata de cangrejo real con mantequilla holandesa de ponzu citrico' , 1000 );


-- INSERTAR EMPLEADOS 
SELECT * FROM employees;

INSERT INTO employees(first_name, last_name, position, salary)
VALUES 
('JEHIEL', 'LINAREZ', 'DIRECTOR EJECUTIVO', 150000),
('ALAN', 'SASTRE', 'DIRECTOR TECNOLOGICO', 150000),
('CARLOS', 'PEREZ', 'GERENTE CYBERSEGURIDAD', 100000),
('MARIA', 'ASUAJE', 'CHEF EJECUTIVO', 100000),
('AITOR', 'NUÑEZ', 'JEFE DE RECEPCION', 90000),
('MOISES', 'GARCES', 'DIRECTOR EJECUTIVO', 150000);

-- INSERTAR CLIENTES

SELECT * FROM customers;

INSERT INTO customers (first_name, last_name, contact_info)
VALUES
('BASTIAN', 'SWANSTIGER', 'FUTBOLISTA PROFESIONAL VIP'),
('CRISTIANO', 'RONALDO', 'FUTBOLISTA PROFESIONAL VIP'),
('ALBERT', 'EINSTEIN', 'CIENTIFICO VIP'),
('CARLOS', 'PEREZ', 'DESARROLLADOR WEB REGULAR '),
('PEREZ', 'PIRELA', 'COMUNICADOR SOCIAL, CONSULTAR ALERGIAS');

-- INSERTAR ORDENES

SELECT * FROM orders;

INSERT INTO orders(order_date, total_amount, customer_id, employees_id)
VALUES 
('2021-01-01', 1000, 1, 1 ),
('2021-02-02', 2000, 2, 2 ),
('2021-03-03', 3000, 3, 3 ),
('2021-04-04', 4000, 4, 4 ),
('2021-05-05', 5000, 5, 5 );

SELECT * FROM dishes;
SELECT * FROM order_details;

INSERT INTO order_details(order_id, dish_id, quantity, price)
VALUES
(1,2, 3, 100),
(2,3, 5, 1000),
(3,4, 6, 2000),
(4,5, 4, 3000),
(5,1, 8, 4000);

-- CALCULAR PEDIDOS POR FECHA 
SELECT order_date, SUM(total_amount) AS total_pedidos
FROM orders
GROUP BY order_date;

-- SELECCIONAR CLIENTE ESPECIFICO 
SELECT *
FROM orders
WHERE customer_id = 1;

-- OBTENER LISTA DETALLADA DE UN PLATO ESPECIFICO
SELECT od.order_id, od.dish_id, d.dish_name, od.quantity, od.price
FROM order_details od, dishes d
WHERE od.dish_id = d.dish_id AND od.order_id = 1;

-- PROMEDIO DE SALARIOS AGRUPADOS POR POSITION 
SELECT position, round(AVG(salary),2) AS salario_promedio
FROM employees
GROUP BY position;

-- LISTA DE PLATOS MAS VENDIDOS
SELECT order_details.dish_id, dishes.dish_name, COUNT(order_details.order_id) AS cantidad_pedidos
FROM order_details, dishes
WHERE order_details.dish_id = dishes.dish_id
GROUP BY order_details.dish_id
ORDER BY cantidad_pedidos DESC;


-- CANTIDAD DE PEDIDOS POR EMPLEADOS 
SELECT employee_id, first_name, last_name, COUNT(order_id) AS cantidad_pedidos
FROM employees, orders
WHERE employee_id = employees_id
GROUP BY employee_id
ORDER BY cantidad_pedidos DESC;

-- CLIENTES con mas pedidos 
SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS cantidad_pedidos
FROM customers c, orders o
WHERE c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY cantidad_pedidos DESC;