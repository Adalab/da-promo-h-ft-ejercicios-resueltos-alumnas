ALTER TABLE t1
RENAME t2; 

/*Cambio el nombre y modifico las columnas*/
ALTER TABLE t2
MODIFY COLUMN a TINYINT NOT NULL,
MODIFY COLUMN b CHAR(20);

/* Primero he tenido que crear antes la columna b para ahora renombrarla, no puedo hacerlo a la vez*/
ALTER TABLE t2
RENAME COLUMN b TO c;

/* Previamente hemos creado "c" para ahora poder borrarla*/
ALTER TABLE t2
ADD COLUMN d TIMESTAMP,
DROP COLUMN c;


CREATE TABLE t3 AS
SELECT a,
       d
FROM t2;

DROP TABLE IF EXISTS t2

