USE tienda;

show tables;

-- Selecciona los apellidos que se encuentren en ambas tablas para employees y customers, con alias 'Apellidos'.

SELECT last_name AS Apellidos
FROM employees
UNION ALL
SELECT contact_last_name AS Apellidos
FROM customers;

-- Selecciona los nombres con alias 'nombre' y apellidos, con alias 'Apellidos' tanto de los clientes 
-- como de los empleados de las tablas employees y customers. Selecciona nombres y apellidos de empleados y clientes con alias adecuados
SELECT first_name AS nombre, last_name AS Apellidos
FROM employees
UNION ALL
SELECT contact_first_name AS nombre, contact_last_name AS Apellidos
FROM customers;

-- 4. Queremos ver ahora el employee_number como 'Número empleado', first_n_ame como 'nombre Empleado' y last_name como 
-- 'Apellido Empleado' para los empleados con employee_number: 1002,1076,1088 y 1612.

SELECT employee_number AS Numero_empleado, first_name AS Nombre_empleado, last_name AS Apellido_empleado
FROM employees
WHERE employee_number IN (1002,1076,1088,1612);

-- 5. Queremos ver ahora la 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' 
-- de la tabla customers, que no estén en: Ireland, France, Germany.

SELECT customer_name AS nombre_de_la_empresa, city  
FROM customers
WHERE country NOT IN ('Ireland', 'France', 'Germany');

-- 6. Encuentra los campos nombre del cliente y ciudad, de aquellas ciudades de la tabla de 
-- customers que terminen en 'on'.

SELECT customer_name, city 
FROM customers
WHERE city LIKE ('%on');

-- 7. Encuentra los campos nombre del cliente, ciudad de aquellas ciudades de la tabla de customers que 
-- terminen en 'on' y que unicamente sean de longitud 4.

SELECT customer_name, city 
FROM customers
WHERE city LIKE ('__on');

-- 8. Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3 
-- en su dirección postal (o lo que es lo mismo, su primera dirección).

SELECT customer_name, address_line1, city
FROM customers
WHERE address_line1 LIKE ('%3%');

-- 9. Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan 
-- el número 3 en su dirección postal y la ciudad no empiece por T. 

SELECT customer_name, address_line1, city
FROM customers
WHERE address_line1 LIKE '%3%' AND city NOT LIKE 'T%';

-- 10. Selecciona, haciendo uso de expresiones regulares, los campos nombre del cliente, primera dirección y ciudad. 
-- Unicamente en el caso que la dirección postal, posea algún número en dicho campo.

SELECT customer_name, address_line1, city
FROM customers
WHERE address_line1 REGEXP '[0-9]';


















