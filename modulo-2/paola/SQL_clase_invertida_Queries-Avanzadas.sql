use tienda;
-- consulta SELECT que obtenga el número identificativo de cliente más bajo de la base de datos.
SELECT MIN( customer_number)
FROM customers;

-- Selecciona el limite de crédito medio para los clientes de España.
SELECT AVG (credit_limit)  AS credito_medio, country
FROM customers
GROUP BY country
HAVING country = 'Spain';

-- Selecciona el numero de clientes en Francia.
SELECT COUNT(customer_number) AS numero_clientes_francia
FROM customers
WHERE country ='France';

-- Selecciona el máximo de crédito que tiene cualquiera de los clientes del empleado con número 1323

SELECT max(credit_limit) AS max_credit
FROM customers
WHERE sales_rep_employee_number = 1323;

-- ¿Cuál es el número máximo de empleado de la tabla customers?
SELECT max(sales_rep_employee_number) AS max_num_emp
FROM customers;

-- Realiza una consulta SELECT que seleccione el número de cada empleado de ventas,
-- así como el numero de clientes distintos que tiene cada uno.

SELECT sales_rep_employee_number, COUNT( DISTINCT customer_number) AS num_clientes_distintos
FROM customers
GROUP BY sales_rep_employee_number;

-- Selecciona el número de cada empleado de ventas que tenga más de 7 clientes distintos.

SELECT sales_rep_employee_number, COUNT( DISTINCT customer_number) AS num_clientes_distintos
FROM customers
GROUP BY sales_rep_employee_number
HAVING  num_clientes_distintos > 7;

-- Selecciona el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno.
-- Asigna una etiqueta de "AltoRendimiento" a aquellos empleados con mas de 7 clientes distintos.

SELECT sales_rep_employee_number, num_clientes_distintos,
    CASE
        WHEN num_clientes_distintos > 7 THEN 'AltoRendimiento'
        ELSE 'Puedes_mejorar'
		END AS AltoRendimiento
FROM (
    SELECT
        sales_rep_employee_number, COUNT(DISTINCT customer_number) AS num_clientes_distintos
    FROM customers
    GROUP BY sales_rep_employee_number)
    AS subconsulta;
    
-- Selecciona el número de clientes en cada pais.

SELECT country, count(customer_number)  AS clientes_x_pais
FROM customers
GROUP BY country;

-- Selecciona aquellos países que tienen clientes de más de 3 ciudades diferentes.
SELECT country
FROM customers
GROUP BY country
HAVING COUNT(DISTINCT city)  > 3
;

