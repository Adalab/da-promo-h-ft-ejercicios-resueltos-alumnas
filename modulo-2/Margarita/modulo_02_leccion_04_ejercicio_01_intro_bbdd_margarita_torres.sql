
USE leccion_1_sql;
-- =============================================================
/* EJERCICIO 1- LECCION SQL-
Creamos en my squl las tablas hechas en la lección:
Intro a BBDD y Normalización.
Esta tabla se encuentra en archivo.csv, dentro del repositorio.*/
-- ==============================================================

-- TABLA A NORMALIZAR:
CREATE TABLE tabla_pedidos (
id_pedido INT NOT NULL ,
id_cliente VARCHAR(20) NOT NULL,
nombre_cliente VARCHAR (30) NOT NULL,
id_articuliculo INT DEFAULT NULL,
articulo_marca VARCHAR(50) DEFAULT NULL,
cantidad INT DEFAULT NULL,
precio_unitario FLOAT DEFAULT NULL
)
;

-- TABLAS NORMALIZADAS
-- Para poder normalizar la tabla anterior se crearon varias tablas:

-- Aplicamos la primera forma normal (1FN):
CREATE TABLE tabla_pedidos_1FN (
id_pedido INT NOT NULL ,
id_cliente VARCHAR(20) NOT NULL,
nombre_cliente VARCHAR (20) NOT NULL, -- Dividimos el nombre en nombre y apellido
apellido_cliente VARCHAR (20) NOT NULL,
id_articuliculo INT DEFAULT NULL,
articulo VARCHAR(20) DEFAULT NULL, -- Dividimos el artículo en tipo de articulo, y marca
marca VARCHAR (20) DEFAULT NULL,
cantidad INT DEFAULT NULL,
precio_unitario FLOAT DEFAULT NULL
)
;

-- Aplicamos la segunda forma normal (2FN y 3FN):

CREATE TABLE clientes (
id_cliente VARCHAR(20) NOT NULL,
nombre_cliente VARCHAR (20) NOT NULL,
apellido_cliente VARCHAR (20) NOT NULL,
id_pedido INT NOT NULL,
PRIMARY KEY (id_pedido , id_cliente), -- Definimos dos primary key, ya que estos datos no pueden ir separados.
UNIQUE (id_pedido, id_cliente) -- Se requiere que estas combinaciones sean unicas.
);

CREATE TABLE articulos (
id_articuliculo INT UNIQUE,
articulo VARCHAR(20) DEFAULT NULL,
marca VARCHAR (20) DEFAULT NULL,
precio_unitario FLOAT DEFAULT NULL,
PRIMARY KEY (id_articuliculo),
UNIQUE (id_articuliculo, articulo, marca)-- Estas columnas deben ir combinadas de manera unica
);

CREATE TABLE pedidos (
order_id VARCHAR(10) NOT NULL,
id_pedido INT NOT NULL,
id_articuliculo INT DEFAULT NULL,
articulo VARCHAR(20) DEFAULT NULL,
cantidad INT NOT NULL,
CONSTRAINT fk_clientes_pedido -- Establecemos estas FK, para realcionar la tabla de pedidos con la de clientes y articulos.
    FOREIGN KEY (id_pedido)
    REFERENCES clientes (id_pedido) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_articuliculo)
    REFERENCES articulos (id_articuliculo) ON DELETE CASCADE ON UPDATE CASCADE
);
DROP TABLE pedidos; -- Borramos la tabla creada por error