CREATE DATABASE concesionario;

CREATE TABLE model(
	id SERIAL,
	name VARCHAR(50) NOT NULL,
	id_manufacturer INT,
	CONSTRAINT pk_model PRIMARY KEY(id),
	CONSTRAINT fk_model_manufacturer  FOREIGN KEY(id_manufacturer) REFERENCES manufacturer(id)
	
);

SELECT * FROM model;

INSERT INTO model(name, id_manufacturer)
VALUES ('Fiesta',1);

INSERT INTO model(name, id_manufacturer)
VALUES ('Prius',2);


CREATE TABLE IF NOT EXISTS version(
	id SERIAL,
	name VARCHAR(50) NOT NULL,
	engine VARCHAR(50),
	price NUMERIC,
	cc NUMERIC(2,1),
	id_model INT, 
	CONSTRAINT pk_version PRIMARY KEY(id),
	CONSTRAINT fk_version FOREIGN KEY(id_model) REFERENCES model(id) ON UPDATE set NULL ON DELETE set NULL
);

SELECT * FROM version;

INSERT INTO version(name, engine, price, cc,id_model)VALUES('Basic', 'Diesel 4C',30000, 1.6, 1 );
INSERT INTO version(name, engine, price, cc,id_model)VALUES('Medium', 'Diesel 5C',32000, 1.9, 1 );
INSERT INTO version(name, engine, price, cc,id_model)VALUES('Advance', 'Diesel 6C',80000, 2.2, 1 );

-- MODEL OF FIESTA

INSERT INTO version(name, engine, price, cc,id_model)VALUES('Sport', 'Gasolina 4C',50000, 1.6, 2 );
INSERT INTO version(name, engine, price, cc,id_model)VALUES('Sport Advance', 'Gasolina 8C',90000, 2.9, 2 );

-- EXTRAS

CREATE TABLE IF NOT EXISTS extra(
	id SERIAL,
	name VARCHAR(50) NOT NULL,
	description VARCHAR (300),
	CONSTRAINT pk_extra PRIMARY KEY(id)	
);

CREATE TABLE IF NOT EXISTS extra_version(
	id_version INT,
	id_extra INT,
	price NUMERIC NOT NULL CHECK(price >= 0),
	CONSTRAINT pk_extra_version PRIMARY KEY(id_version, id_extra),
	CONSTRAINT fk_version_extra FOREIGN KEY (id_version) REFERENCES version(id) ON UPDATE cascade ON DELETE cascade,
	CONSTRAINT fk_extra_version FOREIGN KEY (id_extra) REFERENCES version(id) ON UPDATE cascade ON DELETE cascade
);


-- INSERTAR EN EXTRAS

INSERT INTO extra (name, description)
VALUES('Techo Solar', 'Techo flamante para cubrir el exceso de sol');

INSERT INTO extra (name, description)
VALUES('Climatizador', 'Regulador de temperatura, especial para los dias de invierno');

INSERT INTO extra (name, description)
VALUES('Wifi', 'Wifi incorporado con sistema IA');

INSERT INTO extra (name, description)
VALUES('levas', 'Cambios Automaticos');

SELECT * FROM extra;

SELECT * FROM extra_version;

-- VERSION BASIC

-- FORD MONDEO TECHO SOLAR 
INSERT INTO extra_version VALUES (1, 1, 3000);


-- FORD MONDEO CLIMATIZADOR 
INSERT INTO extra_version VALUES (1, 2, 3000);


-- FORD MONDEO  WIFI
INSERT INTO extra_version VALUES (1, 3, 3000);

-- VERSION ADVANCE

-- FORD MONDEO TECHO SOLAR 
INSERT INTO extra_version VALUES (3, 1, 3500);


-- FORD MONDEO CLIMATIZADOR 
INSERT INTO extra_version VALUES (3, 2, 3500);


-- FORD MONDEO WIFI
INSERT INTO extra_version VALUES (3, 3, 3000);


-- CREAR VENDEDOR

CREATE TABLE sales_man(
	id SERIAL,
	name VARCHAR(50),
	nif VARCHAR(9) NOT NULL UNIQUE,
	phone VARCHAR(9),
	CONSTRAINT pk_sales_man PRIMARY KEY (id)
);

INSERT INTO sales_man(name, nif, phone) VALUES('Bob', '123456781', '111222332');
INSERT INTO sales_man(name, nif, phone) VALUES('Peter', '123456782', '111222331');
INSERT INTO sales_man(name, nif, phone) VALUES('Jehiel', '123456783', '111222333');

SELECT * FROM sales_man;

-- CREAR CLIENTE

CREATE TABLE customer(
    id SERIAL,
    name VARCHAR(30),
    email VARCHAR(50) NOT NULL UNIQUE,
    CONSTRAINT pk_customer_id PRIMARY KEY(id)
);

INSERT INTO customer(name, email) VALUES('maria', '1@gma.com');
INSERT INTO customer(name, email) VALUES('maria2', '2@gma.com');

-- VEHICULOS

CREATE TABLE IF NOT EXISTS vehicle(
	id SERIAL,
	license_num VARCHAR(9) NOT NULL UNIQUE,
	creation_date DATE,
	price_gross NUMERIC,
	price_net NUMERIC,
	type VARCHAR(30),
	
	id_manufacturer INT,
	id_model INT, 
	id_version INT,
	id_extra INT,
	
	CONSTRAINT pk_vehicle PRIMARY KEY (id),
	CONSTRAINT fk_vehicle_manufacturer FOREIGN KEY(id_manufacturer) REFERENCES manufacturer(id),
	CONSTRAINT fk_vehicle_model FOREIGN KEY(id_model) REFERENCES model(id),
	CONSTRAINT fk_vehicle_extra_version FOREIGN KEY(id_version, id_extra) REFERENCES extra_version(id_version, id_extra)
);

SELECT * FROM vehicle;
SELECT * FROM manufacture;
SELECT * FROM model;
SELECT * FROM version;
SELECT * FROM vehicle;
SELECT * FROM extra_version;

INSERT INTO vehicle(license_num, price_gross, id_manufacturer, id_model, id_version, id_extra)
VALUES('12345678L', 40000,1, 2, 1, 2);
INSERT INTO vehicle(license_num, price_gross, id_manufacturer, id_model, id_version, id_extra)
VALUES('12345678J', 60000,1, 3, 3, 3);

-- VENTAS

CREATE TABLE sale(
	id SERIAL,
	sale_date DATE,
	channel VARCHAR(300),
	
	id_vehicle INT,
	id_sales_man INT,
	id_customer INT,
	
	CONSTRAINT pk_sale PRIMARY KEY (id),
	CONSTRAINT fk_sale_vehicle FOREIGN KEY(id_vehicle) REFERENCES vehicle(id),
	CONSTRAINT fk_sale_sales_man FOREIGN KEY(id_sales_man) REFERENCES sales_man(id),
	CONSTRAINT fk_sale_customer FOREIGN KEY(id_customer) REFERENCES customer(id)
);
SELECT * FROM sales_man;
SELECT * FROM sale;

INSERT INTO sale(sale_date, channel, id_vehicle, id_sales_man, id_customer)
VALUES('2022-01-01', 'store', 1, 1,1);

INSERT INTO sale(sale_date, channel, id_vehicle, id_sales_man, id_customer)
VALUES('2021-01-01', 'store', 1, 2, 1);



