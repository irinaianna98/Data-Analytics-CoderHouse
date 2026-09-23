--Por convencion las palabras clave se deben escribir todas con mayuscula

--Comando para la creacion de una base de datos nueva
CREATE DATABASE  Ventas_Tech_DB;

--Comando para poder trabajar sobre la base de datos recien creada
USE Ventas_Tech_DB;

--Comando para eliminar las tablas junto a su estrucutra siempre y cuando estas existan
--Se debe respetar el orde por las depencias de las tablas
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS territorios;
DROP TABLE IF EXISTS categoria;

--Comandos para la creacion de las tablas
CREATE TABLE categoria (
id_categoria INT PRIMARY KEY,
nombre_categoria VARCHAR(50) NOT NULL,
descripcion VARCHAR(200),
subcategoria VARCHAR (50));

CREATE TABLE clientes(
id_cliente INT PRIMARY KEY,
nombre VARCHAR (100) NOT NULL,
edad INT,
email VARCHAR (100) UNIQUE NOT NULL,
segmento VARCHAR (50) NOT NULL,
ciudad VARCHAR (50),
fecha_registro DATE NOT NULL);

CREATE TABLE productos(
id_producto INT PRIMARY KEY,
nombre_producto VARCHAR(100) NOT NULL,
id_categoria INT,
subcategoria VARCHAR (50),
precio DECIMAL,
costo DECIMAL,
FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria));

CREATE TABLE territorios (
id_territorio INT PRIMARY KEY,
region VARCHAR(50) NOT NULL,
pais VARCHAR(50) NOT NULL,
provincia VARCHAR (50) NOT NULL,
zona VARCHAR(50) NOT NULL);

CREATE TABLE ventas(
id_ventas INT PRIMARY KEY,
fecha_venta DATE NOT NULL,
id_cliente INT,
id_producto INT,
id_territorio INT,
cantidad INT NOT NULL,
precio_unitario DECIMAL(10,2) NOT NULL,
descuento DECIMAL(5,2),
canal VARCHAR(50),
total_venta DECIMAL(12,2) NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
FOREIGN KEY (id_territorio) REFERENCES territorios (id_territorio));


--Comando utilizado para insertar datos en una tabla
--Se debe tener en cuenta SI O SI el orden en que se escriben los datos, ya que, al cambiar el orden se puede cargar un dato en un campo incorrecto

--Categorias

INSERT INTO categoria (id_categoria, nombre_categoria, descripcion, subcategoria)
VALUES (1, 'Computadoras', 'Equipos destinados al procesamiento y uso de aplicaciones informáticas', 'PC de escritorio');

INSERT INTO categoria (id_categoria, nombre_categoria, descripcion, subcategoria)
VALUES (2, 'Notebooks', 'Computadoras portátiles para uso personal, laboral y académico', 'Notebook');

INSERT INTO categoria (id_categoria, nombre_categoria, descripcion, subcategoria)
VALUES (3, 'Componentes', 'Partes internas utilizadas para armar o actualizar una computadora', 'Procesadores');

INSERT INTO categoria (id_categoria, nombre_categoria, descripcion, subcategoria)
VALUES (4, 'Periféricos', 'Dispositivos externos que permiten interactuar con una computadora', 'Teclados');

INSERT INTO categoria (id_categoria, nombre_categoria, descripcion, subcategoria)
VALUES (5, 'Almacenamiento', 'Dispositivos utilizados para guardar información y archivos digitales', 'Discos SSD');

--Clientes 

INSERT INTO clientes
(id_cliente, nombre, edad, email, segmento, ciudad, fecha_registro)
VALUES
(1, 'Juan Perez', 28, 'juan.perez@gmail.com', 'Particular', 'Cordoba', '2025-01-15'),
(2, 'Maria Gonzalez', 34, 'maria.gonzalez@gmail.com', 'Particular', 'Rosario', '2025-01-20'),
(3, 'Lucas Fernandez', 25, 'lucas.fernandez@gmail.com', 'Profesional', 'Cordoba', '2025-02-10'),
(4, 'Sofia Martinez', 31, 'sofia.martinez@gmail.com', 'Particular', 'Buenos Aires', '2025-02-18'),
(5, 'Diego Rodriguez', 42, 'diego.rodriguez@gmail.com', 'Empresa', 'Mendoza', '2025-03-05'),
(6, 'Camila Lopez', 27, 'camila.lopez@gmail.com', 'Profesional', 'La Plata', '2025-03-12'),
(7, 'Martin Sanchez', 38, 'martin.sanchez@gmail.com', 'Empresa', 'Cordoba', '2025-03-25'),
(8, 'Valentina Romero', 23, 'valentina.romero@gmail.com', 'Particular', 'Rosario', '2025-04-02'),
(9, 'Nicolas Torres', 45, 'nicolas.torres@gmail.com', 'Empresa', 'Buenos Aires', '2025-04-15'),
(10, 'Agustina Diaz', 29, 'agustina.diaz@gmail.com', 'Profesional', 'Mendoza', '2025-04-22');

--PRODUCTOS

INSERT INTO productos
(id_producto, nombre_producto, id_categoria, subcategoria, precio, costo)
VALUES
(1, 'PC Gamer Ryzen 5', 1, 'PC de escritorio', 850000, 650000),
(2, 'PC Oficina Intel i5', 1, 'PC de escritorio', 620000, 470000),
(3, 'Notebook Lenovo IdeaPad', 2, 'Notebook', 780000, 600000),
(4, 'Notebook HP 15', 2, 'Notebook', 850000, 660000),
(5, 'Procesador AMD Ryzen 7', 3, 'Procesadores', 320000, 240000),
(6, 'Procesador Intel Core i5', 3, 'Procesadores', 280000, 210000),
(7, 'Teclado Mecanico Redragon', 4, 'Teclados', 85000, 60000),
(8, 'Mouse Logitech G502', 4, 'Mouse', 95000, 70000),
(9, 'SSD Kingston 1TB', 5, 'Discos SSD', 110000, 80000),
(10, 'SSD Samsung 2TB', 5, 'Discos SSD', 210000, 155000);

--Territorio

INSERT INTO territorios
(id_territorio, region, pais, provincia, zona)
VALUES
(1, 'Centro', 'Argentina', 'Cordoba', 'Centro'),
(2, 'Litoral', 'Argentina', 'Santa Fe', 'Norte'),
(3, 'Cuyo', 'Argentina', 'Mendoza', 'Oeste'),
(4, 'Buenos Aires', 'Argentina', 'Buenos Aires', 'Este'),
(5, 'Centro', 'Argentina', 'Buenos Aires', 'Sur');

--Ventas

INSERT INTO ventas
(id_ventas, fecha_venta, id_cliente, id_producto, id_territorio,
cantidad, precio_unitario, descuento, canal, total_venta)
VALUES
(1, '2025-05-02', 1, 1, 1, 1, 850000, 0.05, 'Online', 807500),

(2, '2025-05-04', 2, 3, 2, 1, 780000, 0.00, 'Tienda', 780000),

(3, '2025-05-06', 3, 5, 1, 2, 320000, 0.10, 'Online', 576000),

(4, '2025-05-10', 4, 7, 4, 1, 85000, 0.00, 'Online', 85000),

(5, '2025-05-12', 5, 2, 3, 3, 620000, 0.05, 'Tienda', 1767000),

(6, '2025-05-15', 6, 9, 5, 2, 110000, 0.00, 'Online', 220000),

(7, '2025-05-18', 7, 4, 1, 1, 850000, 0.10, 'Tienda', 765000),

(8, '2025-05-20', 8, 8, 2, 2, 95000, 0.05, 'Online', 180500),

(9, '2025-05-23', 9, 10, 4, 1, 210000, 0.00, 'Tienda', 210000),

(10, '2025-05-25', 10, 6, 3, 2, 280000, 0.05, 'Online', 532000),

(11, '2025-05-28', 1, 9, 1, 1, 110000, 0.00, 'Tienda', 110000),

(12, '2025-06-01', 2, 7, 2, 2, 85000, 0.10, 'Online', 153000),

(13, '2025-06-05', 5, 1, 3, 1, 850000, 0.05, 'Tienda', 807500),

(14, '2025-06-08', 7, 5, 1, 1, 320000, 0.00, 'Online', 320000),

(15, '2025-06-12', 9, 3, 4, 2, 780000, 0.10, 'Tienda', 1404000);


--Comando para poder verificar que las tablas contengan datos. Se utiliza SELECT para seleccionar los datos que necesito visualizar
SELECT * FROM categoria;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM territorios;
SELECT * FROM ventas;


