USE tienda;
-- EJERCICIO 1
--  Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando CROSS JOIN.

SELECT employees.employee_number, employees.last_name, employees.first_name, customers.customer_number
FROM employees
CROSS JOIN customers
LIMIT 0, 50;


-- EJERCICIO 2
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando CROSS JOIN.

SELECT DISTINCT employees.employee_number, employees.last_name, employees.first_name
FROM employees
CROSS JOIN customers
WHERE (
    SELECT COUNT(*) 
    FROM customers 
    WHERE employees.employee_number = employee_number) > 8;


-- EJERCICIO 3
-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando CROSS JOIN.

SELECT DISTINCT employees.employee_number, employees.last_name, employees.first_name
FROM employees
CROSS JOIN customers
WHERE (
    SELECT COUNT(*) 
    FROM customers 
    WHERE employees.employee_number = employee_number
) > 1;


-- EJERCICIO 4
-- Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando INNER JOIN.

-- EJERCICIO 5
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando INNER JOIN.

-- EJERCICIO 6
-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando INNER JOIN.

-- EJERCICIO 7
-- Selecciona el ID, nombre, apellidos de todas las empleadas y el ID de cada cliente asociado a ellas (si es que lo tienen).

-- EJERCICIO 8
-- Selecciona el ID de todos los clientes, y el nombre, apellidos de las empleadas que llevan sus pedidos (si es que las hay).

-- EJERCICIO 9
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando LEFT JOIN.

-- EJERCICIO 10
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando RIGHT JOIN.

-- EJERCICIO 11
-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando LEFT JOIN.