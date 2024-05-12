

CREATE SCHEMA ejercicios_2;
USE ejercicios_2;
-- ==============================================================
-- CREAR TABLA EMPLEADAS. SIN DEFINIR RESTRICCIONES NI PK O FK 

CREATE TABLE Empleadas (
id_empleada INT,
salario INT,
nombre TINYTEXT, -- Tinytext no permite caracteres especiales.
apellido TINYTEXT, -- CHAR te permite un uso fijo de caracteres. CUIDADO, uso de memoria para caracteres vacios
pais CHAR(3) 
);

-- ===============================================================
-- MODIFICAMOS LA TABLA  personas: 
-- CREAMOS tabla personas_2 Y ALÑADIMOS RESTRICCION (PERSONA > 16 AÑOS )

CREATE TABLE personas (
id INT NOT NULL,
apellido VARCHAR(20) NOT NULL,
nombre VARCHAR(25),
edad INT,
ciudad VARCHAR(25) DEFAULT 'Madrid'
);

CREATE TABLE Personas2 (
id INT NOT NULL,
apellido VARCHAR(25) NOT NULL,
nombre VARCHAR(25),
edad INT
-- CONSTRAINT edad  -- el constraint solo sirve para nombrar o asignarle un nombre a la restriccion
    CHECK (edad > 16) ,
ciudad VARCHAR(25) DEFAULT 'Madrid' -- En el caso de no tener un dato especifico por defecto pone Madrid.
);

-- ========================================================
-- creamos otra tabla empleadas y empleadas_en_proyectos, definimos fk, pk, etc.. 
-- cuando se elimine una empleada se deben eliminar los proyectos asociados 

CREATE TABLE Empleadas2 (
id_empleada INT NOT NULL AUTO_INCREMENT, -- el auto-increment, incrementa el valor en 1  automaticamente
salario INT DEFAULT NULL,
nombre VARCHAR(10) DEFAULT NULL,
apellido VARCHAR(10) DEFAULT NULL,
pais VARCHAR(10) DEFAULT NULL,
PRIMARY KEY (id_empleada)
);
CREATE TABLE empleadas_en_proyectos (
id_proyecto INT NOT NULL,
id_empleada INT NOT NULL,
CONSTRAINT fk_empleadas_en_proyectos_Empleadas2
   FOREIGN KEY(id_empleada) 
   REFERENCES Empleadas2 (id_empleada) ON DELETE CASCADE ON UPDATE CASCADE
);

-- ====================================================
-- creamos una tabla customers 

CREATE SCHEMA creacion_tienda;
USE creacion_tienda;

CREATE TABLE customers(
id_customer INT NOT NULL AUTO_INCREMENT, 
nombre VARCHAR(100) DEFAULT NULL,
apellido VARCHAR(100) DEFAULT NULL,
edad INT CHECK (edad>18),
ciudad VARCHAR(100),
pais VARCHAR(100),
PRIMARY KEY (id_customer)
);

-- ====================================================
-- creamos tabla employees

CREATE TABLE employees(
id_employees INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(100) DEFAULT NULL,
apellido VARCHAR(100) DEFAULT NULL,
fecha_ingreso DATE,
cargo VARCHAR(100),
PRIMARY KEY (id_employees)
);

-- =====================================================
-- Crea de nuevo  dos tablas ( con un nombre diferente con restricciones etc..)
CREATE TABLE customers_1 (
id_customer INT NOT NULL AUTO_INCREMENT, 
nombre VARCHAR(20) DEFAULT NULL,
apellido VARCHAR(20) DEFAULT NULL,
edad INT CHECK (edad>18) NOT NULL,
ciudad VARCHAR(20) DEFAULT 'SIN ESPECIFICAR',
pais VARCHAR(20) NOT NULL,
PRIMARY KEY (id_customer)
);
CREATE TABLE employees_1(
id_employees INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(100) DEFAULT NULL,
apellido VARCHAR(100) DEFAULT NULL,
fecha_ingreso DATE,
cargo VARCHAR(100),
id_customer INT NOT NULL,
PRIMARY KEY (id_employees),
CONSTRAINT customers_empleados_1
    FOREIGN KEY ( id_customer)
    REFERENCES customers_1 (id_customer)
);

-- ==========================

-- BONUS: crear una tabla basada en otra:

CREATE TABLE  customers_basics AS -- creeamos una tabal abasada en la de customer de arriba 
        SELECT id_customer, 
               nombre,
               apellido
        FROM customers; 
			
