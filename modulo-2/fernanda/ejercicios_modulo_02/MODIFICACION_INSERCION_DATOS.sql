CREATE SCHEMA t1;
USE t1;
-- La tabla t1 tiene las columnas a, que consiste en un número entero, y la columna b, que consiste en una cadena de caracteres de 10 elementos.
CREATE TABLE t1 (
a INT,
b CHAR (10)

);

-- Renombra la tabla t1 a t2.
ALTER TABLE t1 RENAME T2;

-- Cambiar el tipo de columna b de CHAR(10) a CHAR(20) y renombrarla como c
ALTER TABLE t2 CHANGE COLUMN b c CHAR(20);

-- Añade una nueva columna llamada d de tipo TIMESTAMP.
ALTER TABLE t2 ADD COLUMN d TIMESTAMP;

-- Eliminar la columna c
ALTER TABLE t3 DROP COLUMN c;

-- Crear una tabla t3 idéntica a t2
CREATE TABLE t3 LIKE t2;

-- Elimina la tabla original t2 y en otra sentencia renombra la tabla t3 como t1.
DROP TABLE t2;

-- Renombrar la tabla t3 como t1
ALTER TABLE t3 RENAME TO t1;

-- cambio nombre del esquema
-- RENAME SCHEMA t1 TO Modificación_inserción;




