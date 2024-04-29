/* Intento de copiar la tabla customers en el schema
ejercicio 4.
Da error porque no lee el título del schema lección-4-sql 
*/

SELECT * FROM leccion-4-sql . customers_copia;
CREATE TABLE customers_copia(
customer_number INT,
customer_name VARCHAR(50) ,
contact_last_name VARCHAR(50),
contact_first_name VARCHAR(50),
phone VARCHAR (50),
address_line1 VARCHAR(50),
address_line2 VARCHAR(50),
city VARCHAR(50),
state VARCHAR(50),
postal_code VARCHAR(15),
country VARCHAR(50),
sales_rep_employee_numbersales_rep_employee_number INT,
credit_limit DECIMAL(10,2)
);
INSERT INTO leccion-4-squl.customers_copia
SELECT*FROM tienda.customers;

-- Ejer 1: obtenemos nombres, telefono y direcciones de la tabla customers

SELECT customer_name, phone, address_line1, address_line2
FROM customers;

-- Ejer 2: telefonos y direcciones de USA:

SELECT phone, address_line1, address_line2
FROM customers
WHERE country = "USA";

-- Ejer 3: nombres y apellidos perdonas contacto  sin segunda linea de direccion

SELECT contact_last_name, contact_first_name
FROM customers
WHERE address_line2 IS NULL
;

-- Ejer 4:  busca aquellos registros  que tengan un valor guardado  para el campo state

SELECT customer_number, customer_name
FROM customers
WHERE state IS NOT NULL;

-- Ejer 5: registros que tengan clientes USA y que n tengan state

SELECT customer_number, customer_name
FROM customers
WHERE state IS NOT NULL AND country='USA';

-- Ejer 6: selecciona pais correspondiente a los clientes con un límite de crédito  mayor $10000

SELECT country
FROM customers 
WHERE credit_limit > 10000;