-- El id más bajo de la bbdd:
SELECT MIN(customer_number) AS idmenor
FROM customers;

-- limite medio para los clientes en España:alter
SELECT AVG(credit_limit) AS  limete_medio
FROM customers
WHERE country = 'Spain';

SELECT customer_name, country,credit_limit
FROM customers
WHERE country = 'Spain';

-- seleccionamos numero de clientes de francia.
SELECT COUNT(country)
FROM customers
WHERE country='France';

-- limite maximo de los clientes del empleado 1323
SELECT MAX(credit_limit)
FROM customers
WHERE sales_rep_employee_number = 1323

-- nº max de empleado de la tabla customers 

SELECT max(sales_rep_employee_number)
FROM customers;

-- numero de empleados y clientes distintos:
SELECT sales_rep_employee_number, count(customer_number)
FROM customers
GROUP BY sales_rep_employee_number;

-- empleados que tengan mas de 7 clientes:
SELECT sales_rep_employee_number, count(customer_number)
FROM customers
GROUP BY sales_rep_employee_number
HAVING COUNT(*)> 7; 

/* Selecciona el número de cada empleado de ventas, 
así como el numero de clientes distintos que tiene cada uno. 
Asigna una etiqueta de "AltoRendimiento" a aquellos empleados 
con mas de 7 clientes distintos.*/

SELECT sales_rep_employee_number, count(customer_number) AS AltoRendimiento
FROM customers
GROUP BY sales_rep_employee_number
HAVING COUNT(*)> 7; 

-- numero clientes cada pais:
SELECT country, count(customer_number)
FROM customers
GROUP BY country;

-- paises que tienen clientes de mas de 3 ciudades diferentes:
SELECT country, count(city)
FROM customers
GROUP BY country
HAVING  count(*) >3;
    

