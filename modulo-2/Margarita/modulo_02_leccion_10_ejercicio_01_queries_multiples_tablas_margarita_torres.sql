/* Los ejercicios planteados para hoy son:








Encuentra los campos nombre del cliente y ciudad, de aquellas ciudades de la tabla de customers que terminen en 'on'.

Encuentra los campos nombre del cliente, ciudad de aquellas ciudades de la tabla de customers que terminen en 'on' y que unicamente sean de longitud 4.



Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3 en su dirección postal y la ciudad no empiece por T.

Selecciona, haciendo uso de expresiones regulares, los campos nombre del cliente, primera dirección y ciudad. Unicamente en el caso que la dirección postal, posea algún número en dicho campo.*/

-- Selecciona los apellidos que se encuentren en ambas tablas para employees y customers, con alias 'Apellidos'.
SELECT contact_last_name as apellidos
FROM customers
UNION 
SELECT last_name
FROM employees; -- Unimos ambas tablas, sin  duplicados

-- Selecciona los apellidos que se encuentren en ambas tablas para employees y customers, con alias 'Apellidos'.

SELECT contact_last_name AS APELLIDOS
FROM customers
UNION ALL
SELECT last_name
FROM employees; -- Seleccionamos todos los apelliddos, incluido los duplicados.

-- Selecciona todos los nombres con alias 'nombre' y apellidos, con alias 'Apellidos' tanto de los clientes como de los empleados de las tablas employees y customers.
SELECT customer_name AS NOMBRE, contact_last_name AS APELLIDOS
FROM customers
UNION ALL -- Seleccionamos todo incluido los duplicados
SELECT first_name, last_name
FROM employees;

-- Queremos ver ahora el employee_number como 'Número empleado', first_n_ame como 'nombre Empleado' 
-- y last_name como 'Apellido Empleado' para los empleados con employee_number: 1002,1076,1088 y 1612.

SELECT employee_number AS NUMERO_EMPLEADO, first_name AS NOMBRE_EMPLEADO, last_name AS APELLIDO_EMPLEADO
FROM employees
WHERE employee_number IN (1002,1076,1088,1612);

-- Queremos ver ahora la 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' de la tabla customers, que no estén en: Ireland, France, Germany.
SELECT city AS CIUDAD, customer_name AS NOMBRE_EMPRESA
FROM customers
WHERE country NOT IN ('Ireland', 'France', 'Germany');

-- Encuentra los campos nombre del cliente y ciudad, de aquellas ciudades de la tabla de customers que terminen en 'on'.
SELECT customer_name, city
FROM customers
WHERE city LIKE '%ON';

-- Encuentra los campos nombre del cliente, ciudad de aquellas ciudades de la tabla de customers que terminen en 'on' y que unicamente sean de longitud 4.
SELECT customer_name, city
FROM customers
WHERE city LIKE '____' 
and city LIKE '%on';

-- Encuentra el nombre del cliente, primera dirección y 
-- ciudad de aquellas ciudades que contengan el número 3 en su dirección postal (o lo que es lo mismo, su primera dirección).
SELECT customer_name, address_line1, city
FROM customers
WHERE address_line1 like '%3%';

-- Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3 en su dirección postal y la ciudad no empiece por T.
SELECT customer_name, address_line1, city
FROM customers
WHERE address_line1 like '%3%' AND
city NOT LIKE 'T%';

-- Selecciona, haciendo uso de expresiones regulares, los campos nombre del cliente, 
-- primera dirección y ciudad. Unicamente en el caso que la dirección postal, posea algún número en dicho campo.

SELECT customer_name, address_line1, city
FROM customers
WHERE address_line1 REGEXP '[0-9]';