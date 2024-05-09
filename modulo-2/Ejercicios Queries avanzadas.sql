/*Realiza una consulta SELECT que obtenga el número identificativo de cliente más bajo de la base de datos.*/
SELECT MIN(customer_number) FROM customers;

/*Selecciona el limite de crédito medio para los clientes de España.*/
SELECT AVG(credit_limit) FROM customers
WHERE country = 'spain';

/*Selecciona el numero de clientes en Francia*/
SELECT COUNT(customer_number) AS customers_Franceses FROM customers
WHERE country = 'france';

/*Selecciona el máximo de crédito que tiene cualquiera de los clientes del empleado con número 1323*/
SELECT MAX(credit_limit) FROM customers
WHERE sales_rep_employee_number = 1323;

/*
¿Cuál es el número máximo de empleado de la tabla customers?*/
SELECT MAX(sales_rep_employee_number) FROM customers;

/*Realiza una consulta SELECT que seleccione el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno*/
SELECT sales_rep_employee_number, COUNT(customer_number) AS clientes_por_empleado
FROM customers
GROUP BY sales_rep_employee_number;

/*Selecciona el número de cada empleado de ventas que tenga más de 7 clientes distintos*/
SELECT sales_rep_employee_number, COUNT(customer_number) AS clientes_por_empleado
FROM customers
GROUP BY sales_rep_employee_number 
HAVING clientes_por_empleado > 7;

/*Selecciona el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno.
Asigna una etiqueta de "AltoRendimiento" a aquellos empleados con mas de 7 clientes distintos*/
SELECT sales_rep_employee_number, COUNT(customer_number) AS alto_rendimiento
FROM customers
GROUP BY sales_rep_employee_number 
HAVING alto_rendimiento > 7;

/*Selecciona el número de clientes en cada pais*/
SELECT country, COUNT(customer_number)
FROM customers
GROUP BY country;

/*Selecciona aquellos países que tienen clientes de más de 3 ciudades diferentes*/
SELECT country, COUNT(city) AS suma_clientes_pais
FROM customers
GROUP BY country
HAVING suma_clientes_pais > 3;