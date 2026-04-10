-- INSERT ROL
INSERT INTO roles_por_usuario (nombre_rol)
VALUES ('Admin');

INSERT INTO usuarios (nombre, apellido, numero_celular, correo, clave, id_rol, estado)
VALUES ('Juan', 'Perez', 3001234567, 'juan@gmail.com', SHA2('1234',256), 1, 1);

-- ROLES
INSERT INTO roles_por_usuario (nombre_rol) VALUES
('Cliente'),
('Administrador'),
('Proveedor');

-- USUARIOS
INSERT INTO usuarios (nombre, apellido, numero_celular, correo, clave, id_rol, estado) VALUES
('Ana', 'Gomez', 3009876543, 'ana@gmail.com', SHA2('abcd',256), 2, 1),
('Luis', 'Martinez', 3015555555, 'luis@gmail.com', SHA2('pass',256), 3, 1),
('Sofia', 'Ramirez', 3026666666, 'sofia@gmail.com', SHA2('clave',256), 1, 1);

-- PROVEEDOR
INSERT INTO proveedor (nombre_proveedor, numero, correo, cantidad) VALUES
('North Face', 3150001122, 'ventas@northface.co', 50),
('Levi’s', 3102223344, 'contact@levis.com', 150),
('Converse', 3114445566, 'distribucion@converse.com', 200),
('Timberland', 3156667788, 'ventas@timberland.com', 45),
('Vans', 3108889900, 'comercial@vans.co', 130),
('Champion', 3217774411, 'bodega@champion.com', 90),
('Hugo Boss', 3159990022, 'ventas.boss@luxury.com', 30),
('Zara', 3104445577, 'distribucion@zara.co', 500),
('Gucci', 3201112288, 'vip@gucci.it', 15),
('Lacoste', 3182223344, 'info@lacoste.fr', 75),
('Tommy Hilfiger', 3145556677, 'ventas@tommy.com', 110),
('Oakley', 3198887766, 'sales@oakley.com', 60),
('New Era', 3123334455, 'caps@newera.com', 300),
('H&M', 3134445566, 'stock@hm.com', 400),
('Diesel', 3167778899, 'denim@diesel.com', 85);

-- CATEGORIA
INSERT INTO categoria (nombre_prenda) VALUES
('Accesorios'), ('Ropa Interior'), ('Sudaderas'), ('Morrales'), ('Jeans'), 
('Gorros'), ('Trajes'), ('Vestidos'), ('Cinturones'), ('Relojes'), 
('Medias'), ('Gafas'), ('Gorras'), ('Bermudas'), ('Esqueletos');

-- PRODUCTOS
INSERT INTO productos (nombre_producto, imagen, descripcion, talla_prenda, precio, disponibilidad, id_proveedor, id_categoria) VALUES
('Morral Técnico NF', 'm1.jpg', 'Impermeable 30L', 'Única', 450000, 'Si', 1, 4),
('Jeans Levi 501', 'j1.jpg', 'Clásico Azul', '32', 280000, 'Si', 2, 5),
('Gorro Lana Converse', 'g1.jpg', 'Tejido invierno', 'M', 45000, 'Si', 3, 6),
('Botas Timberland', 'b1.jpg', 'Cuero Waterproof', '41', 580000, 'Si', 4, 4),
('Tenis Vans Old Skool', 'v1.jpg', 'Lona clásicos', '38', 240000, 'Si', 5, 4),
('Hoodie Champion', 'h1.jpg', 'Algodón pesado', 'L', 210000, 'Si', 6, 3),
('Traje Slim Boss', 't1.jpg', 'Lana virgen', '48', 2500000, 'Si', 7, 7),
('Cinturón Zara', 'c1.jpg', 'Cuero reversible', '95', 120000, 'Si', 8, 9),
('Gafas Gucci', 'ga1.jpg', 'Lente polarizado', 'Única', 1200000, 'Si', 9, 12),
('Polo Lacoste', 'p1.jpg', 'Classic Fit', 'M', 320000, 'Si', 10, 1),
('Reloj Tommy', 'r1.jpg', 'Acero inoxidable', 'Única', 650000, 'Si', 11, 10),
('Gafas Oakley Holbrook', 'ga2.jpg', 'Deportivas Prizm', 'Única', 520000, 'Si', 12, 12),
('Gorra NY Era', 'go1.jpg', '59Fifty Original', '7 1/4', 180000, 'Si', 13, 13),
('Bermuda H&M Cargo', 'be1.jpg', 'Algodón verde', '30', 95000, 'Si', 14, 14),
('Jean Diesel Sleenker', 'j2.jpg', 'Skinny fit', '31', 750000, 'Si', 15, 5);

-- FAVORITOS
INSERT INTO favoritos (id_usuario, id_producto) VALUES
(5,1),
(6,2), 
(7,3), 
(8,4), 
(9,5), 
(10,6), 
(11,7), 
(12,8), 
(13,9), 
(14,10), 
(15,11), 
(5,12), 
(6,13),
(7,14), 
(8,15);
-- SALIDAS
INSERT INTO salidas (fecha_salida, cantidad, id_usuario, id_producto) VALUES
('2026-04-01', 1, 5, 1), ('2026-04-02', 2, 6, 2), ('2026-04-03', 1, 7, 3),
('2026-04-04', 1, 8, 4), ('2026-04-05', 3, 9, 5), ('2026-04-06', 1, 10, 6),
('2026-04-07', 1, 11, 7), ('2026-04-08', 2, 12, 8), ('2026-04-09', 1, 13, 9),
('2026-04-09', 1, 14, 10), ('2026-04-10', 2, 15, 11), ('2026-04-10', 1, 5, 12),
('2026-04-11', 1, 6, 13), ('2026-04-11', 1, 7, 14), ('2026-04-11', 2, 8, 15);


-- UPDATE
UPDATE usuarios
SET clave = SHA2('nueva_clave_segura',256)
WHERE correo = 'juan@gmail.com';

UPDATE productos SET precio = precio * 1.05 WHERE id_categoria = 1;

UPDATE productos p JOIN proveedor pr ON p.id_proveedor = pr.id_proveedor 
SET p.precio = p.precio * 0.80 WHERE pr.nombre_proveedor = 'Adidas';

UPDATE usuarios
SET correo = 'juan_actualizado@gmail.com'
WHERE id_usuario = 1;

UPDATE usuarios
SET clave = SHA2('nueva_clave_segura',256)
WHERE id_usuario = 1;


-- DELETE
DELETE FROM usuarios
WHERE id_usuario = 1;


-- SELECT
SELECT nombre, apellido, clave FROM usuarios;

SELECT p.nombre_producto, p.precio, c.nombre_prenda, pr.nombre_proveedor
FROM productos p
JOIN categoria c ON p.id_categoria = c.id_categoria
JOIN proveedor pr ON p.id_proveedor = pr.id_proveedor;

SELECT s.fecha_salida, s.cantidad, u.nombre, p.nombre_producto
FROM salidas s
JOIN usuarios u ON s.id_usuario = u.id_usuario
JOIN productos p ON s.id_producto = p.id_producto;

SELECT c.nombre_prenda, COUNT(p.id_producto) AS total_productos
FROM productos p
JOIN categoria c ON p.id_categoria = c.id_categoria
GROUP BY c.nombre_prenda;

SELECT u.nombre, p.nombre_producto
FROM favoritos f
JOIN usuarios u ON f.id_usuario = u.id_usuario
JOIN productos p ON f.id_producto = p.id_producto;

SELECT * FROM salidas WHERE fecha_salida = '2026-04-07';

SELECT * FROM salidas WHERE fecha_salida BETWEEN '2026-04-01' AND '2026-04-07';

SELECT fecha_salida, SUM(cantidad) AS total_dia FROM salidas GROUP BY fecha_salida;

SELECT * FROM salidas WHERE MONTH(fecha_salida) = 4 AND YEAR(fecha_salida) = 2026;

SELECT nombre, apellido, correo FROM usuarios WHERE numero_celular = 3009876543;

