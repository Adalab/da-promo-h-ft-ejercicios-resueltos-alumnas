USE tienda;
-- 1 Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando CROSS JOIN.--

SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees
CROSS JOIN customers;

-- 2 Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando CROSS JOIN.--

SELECT employees.employee_number, employees.first_name, employees.last_name
FROM employees
CROSS JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number 
GROUP BY employees.employee_number
HAVING COUNT(DISTINCT customers.customer_number) > 8;

-- 3 Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando CROSS JOIN. --
SELECT  employees.first_name, employees.last_name, COUNT(DISTINCT customers.country)
FROM employees
CROSS JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number 
GROUP BY employees.employee_number
HAVING COUNT(DISTINCT customers.country)> 1;



-- 4 Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando INNER JOIN.--

SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees
INNER JOIN customers
WHERE employees.employee_number =customers.sales_rep_employee_number;

-- 5 Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando INNER JOIN.
SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees
INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number 
GROUP BY employees.employee_number
HAVING COUNT(DISTINCT customers.customer_number) > 8;

-- 6 Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando INNER JOIN
SELECT  employees.first_name, employees.last_name, COUNT(DISTINCT customers.country)
FROM employees
INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number 
GROUP BY employees.employee_number
HAVING COUNT(DISTINCT customers.country)> 1;

-- 7 Selecciona el ID, nombre, apellidos de todas las empleadas y el ID de cada cliente asociado a ellas (si es que lo tienen).

SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees
CROSS JOIN customers
WHERE employees.employee_number =customers.sales_rep_employee_number;

-- LEFT JOIN ( CON VALORES NULOS)

SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees
LEFT JOIN customers
ON employees.employee_number =customers.sales_rep_employee_number;

-- 8 Selecciona el ID de todos los clientes, y el nombre, apellidos de las empleadas que llevan sus pedidos (si es que las hay).
SELECT customers.customer_number, employees.first_name, employees.last_name
FROM employees
LEFT JOIN customers
ON employees.employee_number =customers.sales_rep_employee_number;

-- CON RIGHT JOIN TAMBIEN ........ PORQUE CON UNA ME DAN 128 Y CON LA OTRA 108????????????

SELECT customers.customer_number, employees.first_name, employees.last_name
FROM employees
RIGHT JOIN customers
ON employees.employee_number =customers.sales_rep_employee_number;

-- 9 Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando LEFT JOIN.
SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees
LEFT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number 
GROUP BY employees.employee_number
HAVING COUNT(DISTINCT customers.customer_number) > 8;

-- 10 Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando RIGHT JOIN.
SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees
RIGHT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number 
GROUP BY employees.employee_number
HAVING COUNT(DISTINCT customers.customer_number) > 8;

-- 11 Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando LEFT JOIN.

SELECT  employees.first_name, employees.last_name, COUNT(DISTINCT customers.country)
FROM employees
LEFT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number 
GROUP BY employees.employee_number
HAVING COUNT(DISTINCT customers.country)> 1;