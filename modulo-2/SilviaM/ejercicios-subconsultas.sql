USE tienda; 

-- Calcula el numero de clientes por cada ciudad.
SELECT city, COUNT(customer_number)  AS numero_clientes
FROM customers
GROUP BY city; 

-- Usando la consulta anterior como subconsulta, selecciona la ciudad con el mayor numero de clientes. 
SELECT city, COUNT(customer_number)  AS numero_clientes
FROM customers 
GROUP BY city
HAVING COUNT(customer_number) >= ALL (
								SELECT COUNT(customer_number) AS numero_clientes
								FROM customers
                                GROUP BY city
);


-- Por último, usa todas las consultas anteriores para seleccionar el customerNumber, nombre y apellido de las clientas 
-- asignadas a la ciudad con mayor numero de clientas.







-- Queremos ver ahora que empleados tienen algún contrato asignado con alguno de los clientes existentes. 
-- Para ello selecciona employeeNumber como 'Número empleado', firstName como 'nombre Empleado' y lastName como 'Apellido Empleado' 

SELECT employee_number AS Número_empleado, first_name AS nombre_empleado, last_name AS Apellido_Empleado
FROM employees
WHERE employee_number IN (
SELECT sales_rep_employee_number
FROM customers
WHERE sales_rep_employee_number = employee_number
);

-- compruebo lo anterior con otra forma de sacar esta info
SELECT sales_rep_employee_number, COUNT(sales_rep_employee_number) AS clientes_por_empleado
FROM customers
GROUP BY sales_rep_employee_number; 


-- Queremos ver ahora en cuantas ciudades en las cuales tenemos clientes, no tenemos una oficina de nuestra empresa para ello: 
-- Selecciona aquellas ciudades como 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' de la tabla customers, 
-- sin repeticiones, que no tengan una oficina en dicha ciudad de la tabla offices.

SELECT city AS Ciudad, customer_name AS nombre_empresa
FROM customers
WHERE city NOT IN( 
SELECT city AS ciudad_oficina
FROM offices
);
