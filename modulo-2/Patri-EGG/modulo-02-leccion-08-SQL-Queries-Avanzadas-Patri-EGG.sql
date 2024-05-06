USE tienda;

-- Realiza una consulta SELECT que obtenga el número identificativo de cliente más bajo de la base de datos.
SELECT MIN(customer_number) AS IDmin
FROM customers;

-- Selecciona el limite de crédito medio para los clientes de España.
SELECT AVG(credit_limit) as AVGcredit
FROM customers
WHERE country = 'Spain';

-- Selecciona el numero de clientes en Francia --
SELECT COUNT(*) AS FRcustomers
FROM customers
WHERE country = 'France';

-- Selecciona el máximo de crédito que tiene cualquiera de los clientes del empleado con número 1323 --
SELECT MAX(credit_limit) AS CUSTcredit
FROM customers
WHERE sales_rep_employee_number = 1323;

-- ¿Cuál es el número máximo de empleado de la tabla customers? --
SELECT MAX(sales_rep_employee_number) AS MAXemployee_num
FROM customers

-- Realiza una consulta SELECT que seleccione el número de cada empleado de ventas,
-- así como el numero de clientes distintos que tiene cada uno --

SELECT sales_rep_employee_number, COUNT(DISTINCT customer_number) AS NUMcustomers
FROM customers
GROUP BY sales_rep_employee_number;

-- Selecciona el número de cada empleado de ventas que tenga más de 7 clientes distintos--
SELECT sales_rep_employee_number
FROM customers
GROUP BY sales_rep_employee_number
HAVING COUNT(DISTINCT customer_number) > 7;

-- Selecciona el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno. 
-- Asigna una etiqueta de "AltoRendimiento" a aquellos empleados con mas de 7 clientes distintos.--
SELECT sales_rep_employee_number,
COUNT(DISTINCT customer_number) AS NUMcustomers,
    CASE 
        WHEN COUNT(DISTINCT customer_number) > 7 THEN 'AltoRendimiento'
        ELSE 'Medio'
		END AS RangoRendimiento
FROM customers
GROUP BY sales_rep_employee_number;

-- Selecciona el número de clientes en cada pais.
SELECT country, COUNT(DISTINCT customer_number) AS NUMcustomers
FROM customers
GROUP BY country;

-- Selecciona aquellos países que tienen clientes de más de 3 ciudades diferentes. --
SELECT country, COUNT(DISTINCT city) AS NUMcities
FROM customers
GROUP BY country
HAVING COUNT(DISTINCT city) > 3;











