-- Pair programming Modificación e Inserción de Datos
-- Ejercicios
USE tienda_zapatillas;

/* En este ejercicio vamos a corregir los errores que hemos encontrado en nuestras tablas.
	Tabla Zapatillas:
		Se nos ha olvidado introducir la marca y la talla de las zapatillas que tenemos en nuestra BBDD. Por lo tanto, debemos incluir:
			marca: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
			talla: es un entero, no nulo.
            */
            ALTER TABLE zapatillas
            ADD COLUMN marca varchar(45) NOT NULL, 
			ADD COLUMN talla INT NOT NULL;
	/* Empleados
		salario: es un entero, no nulo.
        Pero puede que el salario de nuestros empleados tenga decimales, por lo que le cambiaremos el tipo a decimal.
        */
        ALTER TABLE empleados
        MODIFY COLUMN salario DECIMAL (10,2);
        
	/*Tabla Clientes
		pais: la hemos incluido en la tabla pero nuestro negocio solo distribuye a España, por lo que es una columna que no hará falta. 
        La eliminaremos.*/
        ALTER TABLE clientes
        DROP COLUMN pais;
        
	/*Tabla Facturas:
		total: madre mía!!! Se nos ha olvidado incluir el total de la cada factura generada😨!
        Creemos esa columna con un tipo de datos decimal. */
        ALTER TABLE facturas 
        ADD COLUMN total_factura DECIMAL;
        
              
/*  Lo primero que vamos a hacer es insertar datos en nuestra BBDD con los siguientes datos:

Tabla zapatillas

id_zapatilla	modelo	color	marca	talla
1 				XQYUN   Negro   Nike      42
2				UOPMN   Rosas   Nike      39
3               OPNYT   Verdes  Adidas    35

*/

INSERT INTO zapatillas(modelo, color, marca,talla)
VALUES ("XQYUN", "Negro", "Nike", 42), 
	   ("UOPMN", "Rosas", "Nike", 39),
       ("OPNYT", "Verdes", "Adidas", 35);
/* Tabla empleados

id_empleado	nombre	tienda	    salario	  fecha_incorporacion
1			Laura	Alcobendas	25.987		03/09/2010
2			Maria	Sevilla					11/04/2001
3			Ester	Oviedo		30.165,98	29/11/2000
*/
INSERT INTO empleados (nombre, tienda, salario, fecha_incorporacion)
VALUES ("Laura", "Alcobendas", 25987.00 , "2010-09-03"), 
	   ("María", "Sevilla", 0.00, "2001-04-11"),
       ("Ester", "Oviedo", 30165.98 , "2000-11-29");


/* Tabla clientes

id_cliente	nombre	numero_telefono	   email	       direccion	      ciudad	provincia	codigo_postal
1			Monica	1234567289		monica@email.com	Calle Felicidad   Móstoles   Madrid		28176
2			Lorena  289345678		lorena@email.com	Calle Alegria	  Barcelona  Barcelona  12346
3			Carmen  298463759		carmen@email.com	Calle del Color   Vigo		Pontevedra  23456

*/
INSERT INTO empleados (nombre, tienda, salario, fecha_incorporacion)
VALUES ("Laura", "Alcobendas", 25987.00 , "2010-09-03"), 
	   ("María", "Sevilla", 0.00, "2001-04-11"),
       ("Ester", "Oviedo", 30165.98 , "2000-11-29");
/* Tabla facturas

id_factura	numero_factura	fecha	    id_zapatilla	id_empleado	id_cliente	total
1				123			11/12/2001		1				2			1		54,98	
2				1234		23/05/2005		1				1			3		89,91
3				12345		18/09/2015		2				3			3		76,23
*/


/* De nuevo nos hemos dado cuenta que hay algunos errores en la inserción de datos. 
En este ejercicios los actualizaremos para que nuestra BBDD este perfectita.

- Tabla zapatillas

	En nuestra tienda no vendemos zapatillas Rosas... ¿Cómo es posible que tengamos zapatillas de color rosa? 
    🤔 En realidad esas zapatillas son amarillas. */





/*Tabla empleados

	Laura se ha cambiado de ciudad y ya no vive en Alcobendas, se fue cerquita del mar, ahora vive en A Coruña.*/
    
    
    
    
    

/* Tabla clientes

	El Numero de telefono de Monica esta mal!!! Metimos un digito de más. En realidad su número es: 123456728*/
    
    
    
    
    

/* Tabla facturas

	El total de la factura de la zapatilla cuyo id es 2 es incorrecto. En realidad es: 89,91.*/

