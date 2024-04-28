CREATE TABLE t1 (a INTEGER, b CHAR(10));
/*cambiar de nombre una tabla*/
RENAME TABLE t1 TO t2;

/*Cambia la columna a de tipo INTEGER a tipo TINYINT NOT NULL (manteniendo el mismo nombre para la columna)*/
ALTER TABLE t2
MODIFY COLUMN a TINYINT NOT NULL;

/*Cambia la columna b de tipo CHAR de 10 caracteres a CHAR de 20 caracteres. Además, renombra la columna como c.*/
ALTER TABLE t2
CHANGE COLUMN b  c CHAR(20);

/*Añade una nueva columna llamada d de tipo TIMESTAMP*/
ALTER TABLE t2
ADD COLUMN d TIMESTAMP;

/*Elimina la columna c que definiste en el ejercicio 3.*/
ALTER TABLE t2
DROP COLUMN c;

/*Crea una tabla llamada t3 idéntica a la tabla t2 (de manera automática, no definiéndola columna a columna).*/
CREATE TABLE IF NOT EXISTS t3 
SELECT * FROM t2;

/*Elimina la tabla original t2 y en otra sentencia renombra la tabla t3 como t1.*/
DROP TABLE IF EXISTS t2;
RENAME TABLE t3 TO t1;


