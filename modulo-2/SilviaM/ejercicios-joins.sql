USE tienda; 

-- 1.Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando CROSS JOIN.alter

SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees CROSS JOIN customers 
WHERE employees.employee_number = customers.sales_rep_employee_number; 

-- 4 Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando INNER JOIN 

SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees INNER JOIN customers 
WHERE employees.employee_number = customers.sales_rep_employee_number; 

-- 5 Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando INNER JOIN

SELECT employees.employee_number, employees.first_name, employees.last_name, COUNT(customers.sales_rep_employee_number)
FROM employees INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY customers.sales_rep_employee_number
HAVING COUNT(customers.customer_number) > 8;  

-- SOLUCION PROFE
SELECT employees.employee_number, employees.first_name, employees.last_name
FROM employees
INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(DISTINCT customers.customer_number) > 8;

-- 6. Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando INNER JOIN

SELECT employees.first_name, employees.last_name 
FROM employees INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number 
GROUP BY customers.sales_rep_employee_number
HAVING COUNT(DISTINCT customers.country) > 1;  

-- SOLUCION PROFE
SELECT employees.employee_number, employees.first_name, employees.last_name, COUNT(DISTINCT customers.country) AS PaisesClientes
FROM employees 
INNER JOIN customers  
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY (employees.employee_number)
HAVING COUNT(DISTINCT customers.country)>1;


-- 7 Selecciona el ID, nombre, apellidos de todas las empleadas y el ID de cada cliente asociado a ellas (si es que lo tienen) 

SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number 
FROM employees LEFT JOIN customers 
ON employees.employee_number = customers.sales_rep_employee_number; 


-- 9 Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando LEFT JOIN. 

SELECT employees.employee_number, employees.first_name, employees.last_name, COUNT(customers.sales_rep_employee_number)
FROM employees LEFT JOIN customers 
ON employees.employee_number = customers.sales_rep_employee_number 
GROUP BY employees.employee_number
HAVING COUNT(customers.sales_rep_employee_number) > 8;   
-- si ya lo tengo agrupado por employee tendria que contar los deferentes clientes dentro de cada grupo p empleada, no se por que me sale lo mismo

-- SOLUCION PROFE
SELECT employees.employee_number, employees.first_name,  employees.last_name, COUNT( DISTINCT customers.customer_number) AS cant_clientes
FROM employees
LEFT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT( DISTINCT customers.customer_number)> 8;


-- 11 Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando LEFT JOIN.

SELECT employees.employee_number, employees.first_name,  employees.last_name
FROM employees LEFT JOIN customers 
ON employees.employee_number = customers.sales_rep_employee_number 
GROUP BY employees.employee_number 
HAVING COUNT(DISTINCT customers.country)>1;

-- SOLUC PROFE 
SELECT employees.employee_number, employees.first_name, employees.last_name, COUNT(DISTINCT customers.country) AS PaisesClientes
FROM employees
LEFT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY (employees.employee_number)
HAVING COUNT(DISTINCT customers.country)>1;
