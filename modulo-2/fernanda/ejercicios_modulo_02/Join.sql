USE tienda;
-- EJERCICIO 1
--  Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando CROSS JOIN.

SELECT employees.employee_number, employees.last_name, employees.first_name, customers.customer_number
FROM employees
CROSS JOIN customers;


-- EJERCICIO 2
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando CROSS JOIN.

SELECT employees.employee_number, employees.first_name, employees.last_name
			FROM employees
CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(DISTINCT customers.customer_number) > 8;

-- EJERCICIO 3
-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando CROSS JOIN.

SELECT employees.first_name, employees.last_name, COUNT(DISTINCT customers.country) AS PaisesClientes
FROM employees
CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number, employees.first_name, employees.last_name
HAVING COUNT(DISTINCT customers.country) > 1;


-- EJERCICIO 4
-- Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando INNER JOIN.

SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees
INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number;

-- EJERCICIO 5
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando INNER JOIN.
SELECT DISTINCT employees.employee_number, employees.first_name, employees.last_name
FROM employees
INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(DISTINCT customers.customer_number) > 8;


-- EJERCICIO 6
-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando INNER JOIN.

SELECT employees.first_name, employees.last_name, COUNT(DISTINCT customers.country) AS PaisesClientes
FROM employees
INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number, employees.first_name, employees.last_name
HAVING COUNT(DISTINCT customers.country) > 1;

-- EJERCICIO 7
-- Selecciona el ID, nombre, apellidos de todas las empleadas y el ID de cada cliente asociado a ellas (si es que lo tienen).

SELECT employees.employee_number, employees.first_name, employees.last_name, customers.sales_rep_employee_number
FROM employees
LEFT JOIN customers
ON  employees.employee_number = customers.sales_rep_employee_number;

-- EJERCICIO 8
-- Selecciona el ID de todos los clientes, y el nombre, apellidos de las empleadas que llevan sus pedidos (si es que las hay).

SELECT employees.employee_number, CONCAT(employees.first_name, ' ' , employees.last_name) AS nombre_apellido, customers.customer_number
FROM employees
RIGHT JOIN customers
ON customers.sales_rep_employee_number;

-- EJERCICIO 9
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando LEFT JOIN.

SELECT employees.employee_number, employees.first_name, employees.last_name, COUNT(customers.customer_number)
FROM employees
LEFT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(DISTINCT customers.customer_number) > 8;

-- EJERCICIO 10
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando RIGHT JOIN.

SELECT employees.employee_number, employees.first_name, employees.last_name, COUNT(customers.customer_number)
FROM customers
RIGHT JOIN employees
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(DISTINCT customers.customer_number) > 8;

-- EJERCICIO 11
-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando LEFT JOIN.

SELECT employees.first_name, employees.last_name, COUNT(DISTINCT customers.country) AS PaisesClientes
FROM employees
LEFT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(DISTINCT customers.country) > 1;