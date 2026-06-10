-- CONSULTAS BASCIAS
USE look360;
-- 1
SELECT * FROM roles_por_usuario;

-- 2
SELECT * FROM usuarios;

-- 3
SELECT * FROM proveedor;

-- 4
SELECT * FROM categoria;

-- 5
SELECT * FROM productos;

-- 6
SELECT * FROM favoritos;

-- 7
SELECT * FROM salidas;

-- 8
SELECT nombre, apellido, correo FROM usuarios;

-- 9
SELECT nombre_producto, precio FROM productos;

-- 10
SELECT nombre_proveedor, numero FROM proveedor;


-- CONSULTAS EN GENERAL

-- 1 Verificar si un usuario está activo
SELECT nombre, apellido, estado
FROM usuarios
WHERE estado = 1;

-- 2 Ver usuarios inactivos
SELECT nombre, apellido
FROM usuarios
WHERE estado = 0;

-- 3 Consultar precio de un producto específico
SELECT nombre_producto, precio
FROM productos
WHERE nombre_producto = 'camisa';

-- 4 Listar productos disponibles
SELECT nombre_producto, disponibilidad
FROM productos
WHERE disponibilidad = 'disponible';

-- 5 Ver productos ordenados por precio (más caros primero)
SELECT nombre_producto, precio
FROM productos
ORDER BY precio DESC;

-- 6 Ver cantidad de productos por proveedor
SELECT id_proveedor, COUNT(*) AS total_productos
FROM productos
GROUP BY id_proveedor;

-- 7 Ver total de salidas (ventas/movimientos) por producto
SELECT id_producto, SUM(cantidad) AS total_salidas
FROM salidas
GROUP BY id_producto;

-- tabla roles_por_usuario
SELECT r.nombre_rol, u.nombre
FROM roles_por_usuario r
JOIN usuarios u ON r.id_rol = u.id_rol;


SELECT r.nombre_rol, COUNT(u.id_usuario) AS total_usuarios
FROM roles_por_usuario r
JOIN usuarios u ON r.id_rol = u.id_rol
GROUP BY r.nombre_rol;


SELECT nombre_rol
FROM roles_por_usuario
WHERE id_rol IN (SELECT id_rol FROM usuarios);


SELECT nombre_rol
FROM roles_por_usuario
WHERE id_rol NOT IN (SELECT id_rol FROM usuarios);


-- tabla usuarios


SELECT u.nombre, r.nombre_rol
FROM usuarios u
JOIN roles_por_usuario r ON u.id_rol = r.id_rol;


SELECT u.nombre, p.nombre_producto
FROM usuarios u
JOIN favoritos f ON u.id_usuario = f.id_usuario
JOIN productos p ON f.id_producto = p.id_producto;


SELECT nombre
FROM usuarios
WHERE id_usuario IN (SELECT id_usuario FROM favoritos);


SELECT nombre
FROM usuarios
WHERE id_usuario IN (
    SELECT id_usuario FROM salidas
);


-- tabla proveedor


SELECT pr.nombre_proveedor, p.nombre_producto
FROM proveedor pr
JOIN productos p ON pr.id_proveedor = p.id_proveedor;

 
SELECT pr.nombre_proveedor, COUNT(p.id_producto) AS total_productos
FROM proveedor pr
JOIN productos p ON pr.id_proveedor = p.id_proveedor
GROUP BY pr.nombre_proveedor;


SELECT nombre_proveedor
FROM proveedor
WHERE id_proveedor IN (SELECT id_proveedor FROM productos);


SELECT nombre_proveedor
FROM proveedor
WHERE id_proveedor NOT IN (SELECT id_proveedor FROM productos);


-- tabla categoria


SELECT c.nombre_prenda, p.nombre_producto
FROM categoria c
JOIN productos p ON c.id_categoria = p.id_categoria;


SELECT c.nombre_prenda, COUNT(p.id_producto) AS total
FROM categoria c
JOIN productos p ON c.id_categoria = p.id_categoria
GROUP BY c.nombre_prenda;


SELECT nombre_prenda
FROM categoria
WHERE id_categoria IN (SELECT id_categoria FROM productos);


SELECT nombre_prenda
FROM categoria
WHERE id_categoria NOT IN (SELECT id_categoria FROM productos);


-- tabla productos


SELECT p.nombre_producto, pr.nombre_proveedor
FROM productos p
JOIN proveedor pr ON p.id_proveedor = pr.id_proveedor;


SELECT p.nombre_producto, c.nombre_prenda
FROM productos p
JOIN categoria c ON p.id_categoria = c.id_categoria;


SELECT nombre_producto
FROM productos
WHERE id_producto IN (SELECT id_producto FROM favoritos);


SELECT nombre_producto
FROM productos
WHERE precio > (SELECT AVG(precio) FROM productos);


-- tabla favoritos


SELECT u.nombre, p.nombre_producto
FROM favoritos f
JOIN usuarios u ON f.id_usuario = u.id_usuario
JOIN productos p ON f.id_producto = p.id_producto;


SELECT p.nombre_producto, COUNT(f.id_favoritos) AS total_fav
FROM favoritos f
JOIN productos p ON f.id_producto = p.id_producto
GROUP BY p.nombre_producto;


SELECT id_usuario
FROM favoritos
WHERE id_producto IN (SELECT id_producto FROM productos);


SELECT id_producto
FROM favoritos
WHERE id_usuario IN (SELECT id_usuario FROM usuarios);


-- tabla salidas

SELECT fecha_salida
FROM salidas
WHERE id_salida = 1;

SELECT s.fecha_salida, u.nombre
FROM salidas s
JOIN usuarios u ON s.id_usuario = u.id_usuario;


SELECT s.cantidad, p.nombre_producto
FROM salidas s
JOIN productos p ON s.id_producto = p.id_producto;


SELECT id_usuario
FROM salidas
WHERE id_producto IN (SELECT id_producto FROM productos);


SELECT id_producto
FROM salidas
WHERE cantidad > (SELECT AVG(cantidad) FROM salidas);
