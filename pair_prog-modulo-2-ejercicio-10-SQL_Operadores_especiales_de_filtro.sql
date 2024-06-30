USE tienda;


/*1Ciudades que empiezan con "A" o "B".

Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquelas compañias que están afincadas 
en ciudades que empiezan por "A" o "B". 
Necesita que le devolvamos la ciudad, el nombre de la compañia y el nombre de contacto.*/


SELECT city,customer_name,contact_first_name
FROM customers
WHERE city LIKE "A%" or city LIKE "B%";


/*2Número de pedidos que han hecho en las ciudades que empiezan con L.

En este caso, nuestro objetivo es devolver los mismos campos que en la query anterior el número de 
total de pedidos que han hecho todas las ciudades que empiezan por "L".*/

SELECT customers.city,customers.customer_name,customers.contact_first_name, COUNT(orders.order_number) 
FROM customers 
INNER JOIN orders
ON customers.customer_number=orders.customer_number
WHERE customers.city LIKE "L%" 
GROUP BY  customers.contact_first_name, customers.city, customers.customer_name;

/*3
Todos los clientes cuyo "country" no incluya "USA".

Nuestro objetivo es extraer los clientes que no sean de USA. Extraer el nombre de contacto, su pais 
y el nombre de la compañia.*/

SELECT contact_first_name, country, customer_name
FROM customers
WHERE country NOT LIKE "USA";


/*4Todos los clientes que no tengan una "A" en segunda posición en su nombre.

Devolved unicamente el nombre de contacto.*/

SELECT contact_first_name
FROM customers
WHERE contact_first_name NOT LIKE "_A%";

/*5Extraer toda la información sobre las compañias que tengamos en la BBDD

Nuestros jefes nos han pedido que creemos una query que nos devuelva todos los clientes y proveedores que tenemos en la BBDD. 
Mostrad la ciudad a la que pertenecen, el nombre de la empresa y el nombre del contacto, además de la relación 
(Proveedor o Cliente). Pero importante! No debe haber duplicados en nuestra respuesta. 
La columna Relationship no existe y debe ser creada como columna temporal.
 Para ello añade el valor que le quieras dar al campo y utilizada como alias Relationship.

Nota: Deberás crear esta columna temporal en cada instrucción SELECT. 
NO SE PUEDE TERMINAR*/

SELECT customers.city, customers.customer_name, customers.contact_first_name, customers.contact_last_name, "cliente" AS Relationship
FROM customers
UNION 
SELECT product_vendor
FROM 



/*6Extraer todas las categorías de la tabla categories que contengan en la descripción "sweet" o "Sweet".
NO SE PUEDE*/

/*7Extraed todos los nombres y apellidos de los clientes y empleados que tenemos en la BBDD:
💡 Pista 💡 ¿Ambas tablas tienen las mismas columnas para nombre y apellido? Tendremos que combinar dos columnas 
usando concat para unir dos columnas.*/

SELECT CONCAT(customers.contact_first_name," ", customers.contact_last_name) AS FullName
FROM customers
UNION
SELECT CONCAT(employees.last_name, " ", employees.first_name) 
FROM employees;





