CREATE TABLE IF NOT EXISTS customers_mod 
SELECT * FROM customers;

/*Realiza una inserción de datos sobre la tabla customers introduciendo la siguiente información.*/
INSERT INTO customers 
VALUES (343,'Adalab', 'Rodriguez','Julia','672986373','Calle Falsa 123','Puerta 42','Madrid','España',28000,'España',15,20000000);

/*Realiza una inserción de datos sobre la tabla customers introduciendo la siguiente información.
 Fíjate que ahora no tenemos toda la información.*/
INSERT INTO customers 
VALUES (497,'La pegatina After','Santiago','Maricarmen','00000000','Travesía del rave',NULL,'Palma de Mallorca',NULL,'07005','España',10, 45673453);
  
 -- modifico valores para poder ingresar valores nulos en el contact_first_name
 ALTER TABLE customers
MODIFY COLUMN contact_first_name VARCHAR (50) NULL; 
 
-- modifico el autoincremento de la columna customer number
ALTER TABLE customers
MODIFY COLUMN customer_number INT  AUTO_INCREMENT;

/* introduce ahora 5 filas nuevas con la información que consideres relevante para los campos disponibles en una misma instrucción. Se recuerda que el Indice(=la clave primaria), 
 no es necesaria especificarla. En 3 de las nuevas filas debes dejar vacio el campo 'contactFirstName'*/
 
INSERT INTO customers (customer_name,contact_last_name,contact_first_name,phone,address_line1,address_line2,city,state,postal_code,country,sales_rep_employee_number,credit_limit)
VALUES ('Los Amigos del Sol', 'Rodríguez',NULL,'145637895','Calle del Sol','bloque2','Madrid', 'España','28001','España',11,3000000), 
('La Casa Verde','García','Ana','22822522','Avenida del Parque','piso 50', 'Barcelona', 'España','08002','España',17,500000),
('El Rincón del Arte','Pérez',NULL,'33533433','Plaza del Arte', 'local 3', 'Valencia', 'España', '46001','España',13,2500000),
('La Tienda Mágica','Martínez',NULL,'40445464','Calle Encantada','casa 2', 'Sevilla', 'España','41001','España',19,400007),
('El Jardín Secreto','Fernández','Diego','52558599','Camino Escondido', 'interior 1','Bilbao', 'España', '48001','España',20,3500089);

/*Actualiza ahora los datos faltantes correspondientes al CustomerName 'La pegatina After' con la siguiente información.
addressline1: Polígono Industrial de Son Castelló
addressline2: Nave 92
city: Palma de Mallorca
state: España
postalcode:28123
country: España
salesrepemployeenumber: 25
creditlimit: 5000000*/

UPDATE customers
SET address_line1 = 'Polígono Industrial de Son Castelló',address_line2 = 'Nave 92', city= 'Palma de Mallorca',state = 'España',postal_code= '28123',country= 'España',sales_rep_employee_number = 25,credit_limit = 5000000
WHERE customer_number = 497;

-- ELIMINE EL CONSTRAIT PARA PODER MODIFICAR LA TABLA
ALTER TABLE customers
DROP CONSTRAINT customers_ibfk_1;

/*Vamos ahora a romper a propósito la tabla con la que estamos trabajando,
 para ello primero vamos a realizar una copia de la misma antes de ejecutar lo siguiente. Con el nombre customers_destroy.*/

/*Una vez creada la copia y guardada a buen recaudo, vamos a actualizar algunos de los cambios sin especificar la condición del WHERE.
 Para ello modifica el campo los siguientes campos de addressline1: Vamos,addressline2: a,postalcode: fastidiar,country: la tabla :)*/

UPDATE customers
SET address_line1= 'Vamos',address_line2 = 'a', postal_code = 'fastidiar',country = 'la tabla :)';

/* Actualiza ahora los datos de la tabla customers_mod.
 para que las 10 primeras empresas sean gestionadas por la representante de ventas numero 2*/

UPDATE customers_mod
SET sales_rep_employee_number = 2
WHERE customer_number < 141;

-- Queremos ahora eliminar de los datos de la tabla aquellos registros que contengan un 'null' en el campo 'ContactFirstName'.
DELETE FROM customers_mod
WHERE contact_first_name = NULL;

-- Ejecuta la instrucción de DELETE para la tabla customers_mod olvidando el WHERE como condición. Y observa lo que ha ocurrido.
DELETE FROM customers_mod;


 









