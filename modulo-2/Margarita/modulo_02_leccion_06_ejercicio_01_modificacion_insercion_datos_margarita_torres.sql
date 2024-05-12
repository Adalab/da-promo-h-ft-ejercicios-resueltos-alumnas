CREATE SCHEMA ejercicio_mod_e_insert;
USE ejercicio_mod_e_insert;

-- Creamos la tabla de el ejercicio:
CREATE TABLE t1 (a INTEGER, b CHAR(10));

-- 1. Cambiamos el nombre de la tabla a t2. Se crea una tabla nueva.

-- Usamos RENAME TO nombre_nuevo_tabla. RENAME nombre antiguo TO nuevo nombre. 
-- Para varios RENAME TABLE nombre antiguo TO nuevo nombre, tabla antigua1 TO tabla nuea.

ALTER TABLE t1
    RENAME TO t2;
    
-- 2.Cambiamos el tipo de valor de la columna a

ALTER TABLE t2
    MODIFY COLUMN a TINYINT NOT NULL;
    
-- 3. cambniamos la el tipo de la columna b y la renombramos como c:

ALTER TABLE t2 
    MODIFY COLUMN b CHAR(20); -- otra forma es el CHANGE nombre nombre_nuevo y tipo elemente(diferenecia con el modify)

ALTER TABLE t2
    RENAME COLUMN b to c; 

-- 4. añandimos una tabla nueva

ALTER TABLE t2
    ADD COLUMN d TIMESTAMP; 

-- 5. Eliminamos la coliumna c:

ALTER TABLE t2
    DROP COLUMN c;
    -- Eliminar tabla DROP TABLE IF EXIST nombre_tabla,...todas las que se quieran eliminar.

-- 6. creamos una tabla a idéntica a t2

CREATE TABLE t3 LIKE t2; -- Tambien podemos usar CREATE TABLE x SELECT * FROM b

-- 7. Eliminamos t2 y renombramos t3 como t1:
DROP TABLE t2;
ALTER TABLE t3 
     RENAME TO t1;

-- 8. Añadimos datos a la tabla customers:

-- Para modificar la tabla customers: Creamos una nueva tabla con todos los valores :
CREATE TABLE IF NOT EXISTS customer_mod1
       SELECT *
       FROM tienda.customers; -- añadimos un tienda. para hacer referencia al schema del que queremos copiar la tabla.
drop table customer_mod1; -- borramos la tabla, creada por error en la bbdd tienda.

-- Introducimos datos

INSERT INTO customer_mod1 ( customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)  
VALUES (343, 'Adalab', 'Rodriguez', 'Julia', '672986373', 'Calle Falsa 123' , 'Puerta 42' , 'Madrid' , 'España', '28000','España' , 15, 20000000 );
INSERT INTO customer_mod1 ( customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (344, 'La pegatina After', 'Santiago', 'Maricarmen', '00000000', 'Travesía del rave', NULL, 'Palma de Mallorca', NULL, 07005, 'España', 10, 45673453);

-- introducimos 5 lineas mas, dejar vacio el contactfristname en tres de las cinco lineas
INSERT INTO customer_mod1 ( customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (345, 'La pegatina', 'go', NULL , '00000010', 'Travesía del rave', NULL, 'Palma de Mallorca', NULL, 07005, 'España', 10, 45673453);
INSERT INTO customer_mod1 ( customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (346, 'L After', 'Saago', NULL , '00004000', 'Travesía del rave', NULL, 'Palma de Mallorca', NULL, 07005, 'España', 10, 45673453);
INSERT INTO customer_mod1 ( customer_number, customer_name, contact_last_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (347, 'After', 'Santi', '00000600', 'Travesía del rave', NULL, 'Palma de Mallorca', NULL, 07005, 'España', 10, 45673453);
-- No podemos dejar contact_first_name vacio debido a las restricciones que pusimos al crear la tabla.
-- los modificamos:

ALTER TABLE customer_mod1
MODIFY COLUMN contact_first_name VARCHAR (20);
-- continuamos el ejercicio. Ejecutamos la query anterior.

INSERT INTO customer_mod1 ( customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (348, 'L', 'tiago', 'Maricarmen', '00008000', 'Travesía del rave', NULL, 'Palma de Mallorca', NULL, 07005, 'España', 10, 45673453);
INSERT INTO customer_mod1 ( customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (349, 'pegatina', 'Sant', 'Maricarmen', '00020000', 'Travesía del rave', NULL, 'Palma de Mallorca', NULL, 07005, 'España', 10, 45673453);

-- actualñlizamod los datos:

UPDATE customer_mod1
SET address_line1 = 'pOLIGONO INDUSTRIAL DCE SON CASTELLO' , address_line2 = 'nAVE 92', city = 'Palma de mayorca', state= 'España' 
WHERE customer_name = 'La pegatina After';

-- ROMPEMOS LA TABLA

UPDATE customer_mod1
SET address_line1 = 'vAMOS', address_line2= 'A', postal_code='FASTIDIAR', country='LA TABLA';

-- Restauramos la tabla y modificamos las 10 primeras empresas que sean gestionadas por la representante de ventas numero 2:

UPDATE customer_mod1
SET address_line1 = 'QUIERO', address_line2= 'ACABAR', postal_code='YA ', country='EL EJERCICIO'
WHERE sales_rep_employee_number =2;

DELETE FROM customer_mod1
WHERE contact_first_name = NULL;

DELETE FROM customer_mod1;




-- UPDATE nombre tabl  SET linea= nuevo valor WHERE id linea a SET columna a actualizar= algo, columna 2 =algo 2 WHERE fila con condicion.
    
    -- DELETE FROM tabla que quiero eliminar WHERE condicion 
    
    

