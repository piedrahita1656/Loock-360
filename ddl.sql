create database loock360
character set utf8mb4 collate utf8mb4_spanish_ci;

USE loock360;


-- roles por usuario --

CREATE TABLE roles_por_usuario (
	id_rol int not null auto_increment primary key,
    nombre_rol varchar (50) not null unique
)engine=InnoDB

default charset=utf8mb4 collate=utf8mb4_spanish_ci;


-- TABAL USUARIOS --
CREATE TABLE usuarios (
	id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    apellido VARCHAR (50) NOT NULL,
    numero_celular INT NOT NULL UNIQUE,
    correo VARCHAR (50) NOT NULL UNIQUE,
    clave VARCHAR (255) NOT NULL,
    id_rol INT NOT NULL,
    
    FOREIGN KEY (id_rol)
		REFERENCES roles_por_usuario(id_rol)
			ON DELETE RESTRICT
			ON UPDATE CASCADE
)engine=InnoDB

default charset=utf8mb4 collate=utf8mb4_spanish_ci;

-- TABLA  REGISTRAR PROVEEDORES --
CREATE TABLE proveedor (
	id_proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR (50) NOT NULL UNIQUE,
    numero INT NOT NULL UNIQUE,
    correo VARCHAR (50) NOT NULL UNIQUE,
    cantidad INT NOT NULL
)engine=InnoDB

default charset=utf8mb4 collate=utf8mb4_spanish_ci;

-- TABLA CATEGORIAS --
CREATE TABLE categoria (
	id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_prenda VARCHAR (50) NOT NULL UNIQUE
)engine=InnoDB

default charset=utf8mb4 collate=utf8mb4_spanish_ci;

-- TABLA PRODUCTOS --
CREATE TABLE productos (
	id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR (50) NOT NULL UNIQUE,
    imagen BLOB (150) NOT NULL UNIQUE,
    descripcion VARCHAR(150) NOT NULL,
    talla_prenda VARCHAR(45) NOT NULL,
    precio FLOAT NOT NULL,
    disponibildad VARCHAR (50),
    id_proveedor INT NOT NULL,
    id_categoria INT NOT NULL,
    
    FOREIGN KEY (id_proveedor)
		REFERENCES proveedor(id_proveedor)
			ON DELETE RESTRICT
			ON UPDATE CASCADE,
            
	FOREIGN KEY (id_categoria)
		REFERENCES categoria(id_categoria)
			ON DELETE RESTRICT
			ON UPDATE CASCADE
)engine=InnoDB

default charset=utf8mb4 collate=utf8mb4_spanish_ci;

-- TABLA PRODUCTOS FAVORITOS --
CREATE TABLE favoritos (
	id_favoritos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_producto INT NOT NULL,
    
    FOREIGN KEY (id_usuario)
		REFERENCES usuarios(id_usuario)
			ON DELETE RESTRICT
			ON UPDATE CASCADE,
            
	FOREIGN KEY (id_producto)
		REFERENCES productos(id_producto)
			ON DELETE RESTRICT
			ON UPDATE CASCADE
)engine=InnoDB

default charset=utf8mb4 collate=utf8mb4_spanish_ci;

-- TABLA SALIDAS DE PRODUCTOS --
CREATE TABLE salidas (
	id_favoritos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha_salida DATE NOT NULL,
    cantidad INT NOT NULL,
    id_usuario INT NOT NULL,
    id_producto INT NOT NULL,
    
    FOREIGN KEY (id_usuario)
		REFERENCES usuarios(id_usuario)
			ON DELETE RESTRICT
			ON UPDATE CASCADE,
            
	FOREIGN KEY (id_producto)
		REFERENCES productos(id_producto)
			ON DELETE RESTRICT
			ON UPDATE CASCADE
)engine=InnoDB

default charset=utf8mb4 collate=utf8mb4_spanish_ci;

ALTER TABLE usuarios
ADD estado TINYINT NOT NULL;

