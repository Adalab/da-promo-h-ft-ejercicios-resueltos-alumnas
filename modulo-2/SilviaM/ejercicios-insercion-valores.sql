CREATE SCHEMA insercion_valores;

-- Creo copia de otra tabla
CREATE TABLE IF NOT EXISTS customers_mod 
SELECT * 
FROM customers;

USE `tienda`;


-- Da error porque hay una foreing key y no coinciden los valores con los que ya hay en la tabla madre-- YA FUNCIONA
INSERT INTO customers (customer_number,customer_name,contact_last_name,contact_first_name,phone,address_line1,address_line2,city,state,postal_code,country,sales_rep_employee_number,credit_limit)
VALUES (343, 'Adalab', 'Rodriguez', 'Julia', '672986373', 'Calle Falsa 123', 'puerta 42','Madrid','España', 28000, 'España',15,20000000);

-- para solucionarlo, creo un nuevo employee en la tabla de employees:
INSERT INTO employees(employee_number,last_name,first_name,extension,email,office_code,reports_to,job_title)
VALUES (15, "Perez", "Pepito","x105", "pepitoperez@classicmodelcars.com","3",1102, "Sales Rep");




-- da error porque 344 customernumber ya está en la tabla.NO HACE FALTA PONER LOS NOMBRES DE LAS COLUMNAS CUANDO LAS VOY A EDITAR TODAS,BASTE CON EL NOMBRE DE LA TABLA--
INSERT INTO customers (customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (344, 'La pegatina After', 'Santiago', 'Maricarmen', '00000000', 'Travesía del rave', NULL, 'Palma de Mallorca', NULL, '07005', 'España', 10, 45673453); 


INSERT INTO customers 
VALUES (val1,val2,val3),
       (val1,NULL,val3),
       (val1,NULL,val3),
       (val1,NULL,val3),
       (val1,NULL,val3);
       
 -- Para añadir los valores que previamente teniamos como NULL para "lapegatina after"--      
INSERT INTO nombre_tabla(address_line1,address_line2,state,postal_code,sales_rep_employee_number,credit_limit)
VALUES (val1,val2,val3);