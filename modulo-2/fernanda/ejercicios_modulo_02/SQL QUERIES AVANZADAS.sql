USE tienda;

-- 1. Realiza una consulta SELECT que obtenga el número identificativo de cliente más bajo de la base de datos.

SELECT MIN(customer_number) as Id_menor
FROM customers; 

-- Selecciona el limite de crédito medio para los clientes de España.

SELECT country, AVG(credit_limit) AS credit_limit_spain
FROM customers
WHERE country = 'Spain'
GROUP BY country;

-- 2. Selecciona el numero de clientes en Francia.

SELECT COUNT(*) AS france_customers_number
FROM customers
WHERE country = 'France';


-- 3. Selecciona el máximo de crédito que tiene cualquiera de los clientes del empleado con número 1323.

SELECT MAX(CREDIT_LIMIT) AS Max_credit_limit1323
FROM customers
WHERE sales_rep_employee_number = 1323;     

-- 4. ¿Cuál es el número máximo de empleado de la tabla customers?

SELECT MAX(sales_rep_employee_number) AS max_sales_rep_employees_number     
FROM customers;     

/* 5. Realiza una consulta SELECT que seleccione el número de cada empleado de ventas, 
así como el numero de clientes distintos que tiene cada uno.*/

SELECT sales_rep_employee_number AS quantity_sales_rep_employee_number, COUNT(DISTINCT customer_number)
FROM customers
GROUP BY sales_rep_employee_number;

-- 6. Selecciona el número de cada empleado de ventas que tenga más de 7 clientes distintos.

SELECT sales_rep_employee_number AS quantity_sales_rep_employee_number, COUNT(DISTINCT customer_number)
FROM customers
GROUP BY sales_rep_employee_number
HAVING COUNT(*) > 7;

-- 7. Selecciona el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno. 
SELECT sales_rep_employee_number AS quantity_sales_rep_employee_number, COUNT(DISTINCT customer_number)
FROM customers
GROUP BY sales_rep_employee_number;

-- 8. Asigna una etiqueta de "AltoRendimiento" a aquellos empleados con mas de 7 clientes distintos.

SELECT sales_rep_employee_number AS AltoRendimiento, COUNT(DISTINCT customer_number)
FROM customers
GROUP BY sales_rep_employee_number;

-- 9. Selecciona el número de clientes en cada pais.

SELECT country AS country_customers, COUNT(*)customer_name     
FROM customers     
GROUP BY  country;

-- 10. Selecciona aquellos países que tienen clientes de más de 3 ciudades diferentes.

SELECT country
FROM customers
GROUP BY country
HAVING COUNT(DISTINCT city) > 3;

