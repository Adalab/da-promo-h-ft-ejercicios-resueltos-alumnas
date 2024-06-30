CREATE SCHEMA ejercicios_2;
USE ejercicios_2;

CREATE TABLE Empleadas (
    id_empleada INT,
    salario DECIMAL(10, 2),
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    pais VARCHAR(255) );
    
    CREATE TABLE Personas2 (
    id INT NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
    edad INT CHECK (edad > 16),
    ciudad VARCHAR(255) DEFAULT 'Madrid'); 


