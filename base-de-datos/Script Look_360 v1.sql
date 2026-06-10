-- Limpieza inicial para resetear las tablas corruptas en caché
DROP DATABASE IF EXISTS look_360;

-- 1. Creación de la base de datos
CREATE DATABASE IF NOT EXISTS look_360 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE look_360;

-- 2. Tabla: roles
CREATE TABLE IF NOT EXISTS roles (
    idRol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. Tabla: usuario
CREATE TABLE IF NOT EXISTS usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    numeroCelular INT NOT NULL,
    correo VARCHAR(45) NOT NULL,
    constrasena VARCHAR(45) NOT NULL,
    idRol INT NOT NULL,
    FOREIGN KEY (idRol) REFERENCES roles (idRol)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. Tabla: proveedor
CREATE TABLE IF NOT EXISTS proveedor (
    idProveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(45) NOT NULL,
    numero VARCHAR(45) NOT NULL,
    correo VARCHAR(45) NOT NULL,
    cantidad int not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5. Tabla: categoria
CREATE TABLE IF NOT EXISTS categoria (
    idCategoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_prenda VARCHAR(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 6. Tabla: productos
CREATE TABLE IF NOT EXISTS productos (
    idProducto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(45) NOT NULL,
    imagen varchar(150) not null,
    descripcion VARCHAR(150),
    talla_prenda VARCHAR(45),
    precio VARCHAR(45) NOT NULL,
    disponibilidad VARCHAR(45),
    idProveedor INT NOT NULL,
    idCategoria INT NOT NULL,
    FOREIGN KEY (idProveedor) REFERENCES proveedor (idProveedor)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (idCategoria) REFERENCES categoria (idCategoria)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 7. Tabla: favoritos
CREATE TABLE IF NOT EXISTS favoritos (
    idfavoritos INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    idProducto INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (idProducto) REFERENCES productos (idProducto)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 8. Tabla: venta
CREATE TABLE IF NOT EXISTS venta (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 9. Tabla: detalle_venta
CREATE TABLE IF NOT EXISTS detalle_venta (
    id_detalle_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    producto_id INT NOT NULL,
    subtotal VARCHAR(45) NOT NULL,
    venta_id_venta INT NOT NULL,
    idProducto INT NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES venta (id_venta)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (idProducto) REFERENCES productos (idProducto)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 10. Tabla: envio
CREATE TABLE IF NOT EXISTS envio (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(45) NOT NULL,
    estado VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45) NOT NULL,
    guia VARCHAR(100) NOT NULL,
    transportadora VARCHAR(100) NOT NULL,
    fecha_creacion DATETIME NOT NULL,
    fecha_entrega DATETIME NOT NULL,
    id_venta INT NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES venta (id_venta)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 11. Tabla: soporte
CREATE TABLE IF NOT EXISTS soporte (
    id_Soporte INT AUTO_INCREMENT PRIMARY KEY,
    telefono VARCHAR(45) NOT NULL,
    mensaje VARCHAR(45) NOT NULL,
    fecha_envio DATETIME NOT NULL,
    estado VARCHAR(45) NOT NULL,
    mensaje_api_id VARCHAR(45) NOT NULL,
    envio_id_Envio INT NOT NULL,
    FOREIGN KEY (envio_id_Envio) REFERENCES envio (id_envio)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;