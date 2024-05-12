USE tienda;

/* 1. Calcula el numero de clientes por cada ciudad.*/ # 2 Aucland -> " dentro de alguna de las dos debe haber un espacio"
SELECT city, COUNT(customer_number)
FROM customers
group by city;  

/* 2. Usando la consulta anterior como subconsulta, selecciona la ciudad con el mayor numero de clientes. ( recordar que siempre que hay un group by la subconsulta se debera hacer en el having) */

SELECT city, COUNT(customer_number)
FROM customers
group by city
Having COUNT(customer_number) >= All ( SELECT COUNT(customer_number) -- DEBE TENER EL IGUAL O NO FUNCIONA >= ??????
								FROM customers
								GROUP BY city);   

/*3 usa todas las consultas anteriores para seleccionar el customerNumber, nombre y apellido de las clientas
 asignadas a la ciudad con mayor numero de clientas.*/
                                 
SELECT customer_number, contact_first_name, contact_last_name, city
FROM customers
WHERE city IN
(SELECT  city
FROM customers
GROUP BY city
HAVING COUNT(customer_number) >= ALL
(SELECT COUNT(customer_number) AS numero_clientes
FROM customers
GROUP BY city));							
 
 
 /* 4. Queremos ver ahora que empleados tienen algún contrato asignado con alguno de los clientes existentes.
 Para ello selecciona employeeNumber como 'Número empleado', firstName como 'nombre Empleado'
 y lastName como 'Apellido Empleado'*/
 
 SELECT employee_number AS 'Nçumero de empleado', first_name as 'Nombre Empleado', last_name ' Apellidos'
 FROM employees 
 WHERE employee_number IN (SELECT sales_rep_employee_number
							FROM  customers);
 
 /* 5. Queremos ver ahora en cuantas ciudades en las cuales tenemos clientes, no también una oficina de nuestra empresa
 para ello: Selecciona aquellas ciudades como 'ciudad' y los nombres de las empresas como 'nombre de la empresa '
 de la tabla customers, sin repeticiones, que no tengan una oficina en dicha ciudad de la tabla offices.*/
 
 
 SELECT city AS 'ciudad', customer_name AS 'nombre de la empresa'
 FROM customers
 WHERE city NOT IN ( SELECT ciTy
					FROM offices);
 
