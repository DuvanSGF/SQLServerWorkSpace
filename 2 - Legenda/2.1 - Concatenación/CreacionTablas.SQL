USE [inventario]
GO
-- Script para inster datos en la tabla ProductosCategorias
INSERT INTO ProductosCategorias VALUES (1,2);
INSERT INTO ProductosCategorias VALUES (1,3);
INSERT INTO ProductosCategorias VALUES (2,4);
INSERT INTO ProductosCategorias VALUES (3,2);
INSERT INTO ProductosCategorias VALUES (3,3);
INSERT INTO ProductosCategorias VALUES (4,1);
INSERT INTO ProductosCategorias VALUES (4,2);
INSERT INTO ProductosCategorias VALUES (4,4);
GO
-- Consultamos la Tabla
SELECT * FROM ProductosCategorias;
GO

-- Ahora Insertamos Datos en la tabla Categorias
INSERT INTO Categorias VALUES (1,'Bebidas');
INSERT INTO Categorias VALUES (1,'Lacteos');
INSERT INTO Categorias VALUES (2,'Postres');
INSERT INTO Categorias VALUES (3,'Alimentos Básicos');
