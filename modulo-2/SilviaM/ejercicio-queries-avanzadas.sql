CREATE SCHEMA queries_avanzadas;

Use tienda; 

-- apartado1
SELECT MIN(customer_number)
FROM customers;

-- apartado 2
SELECT AVG(credit_limit)
FROM customers; 

-- apartado3 
SELECT COUNT(customer_name)
FROM customers
WHERE "country" = "France"; 

-- apartado 4
SELECT (credit_limit)
FROM customers
WHERE sales_rep_employee_number = 1323;

-- APARTADO 5
SELECT MAX(sales_rep_employee_number)
FROM customers; 

-- apartado 6:Realiza una consulta SELECT que seleccione el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno.
SELECT sales_rep_employee_number, COUNT(customer_name)
FROM customers
GROUP BY sales_rep_employee_number;

-- ap.7 Selecciona el número de cada empleado de ventas que tenga más de 7 clientes distintos.

SELECT sales_rep_employee_number, COUNT( DISTINCT customer_name) AS numero_de_clientes
FROM customers
GROUP BY sales_rep_employee_number
HAVING numero_de_clientes > 7;

-- apartado 8

SELECT sales_rep_employee_number, 
CASE 
   WHEN COUNT(DISTINCT customer_name) > 7  THEN "Alto rendimiento"
   ELSE "Rendimiento medio"
END AS "Rendimiento"
FROM customers
GROUP BY sales_rep_employee_number;

-- apartado 9
SELECT Count(customer_name), country
FROM customers
GROUP BY country; 

-- apartado 10
SELECT country
FROM customers
GROUP BY country
HAVING COUNT( DISTINCT city)> 3;