CREATE DATABASE Inventario 

USE Inventario

CREATE TABLE categoria
(
    idCategoria INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre      VARCHAR(50),
    estatus	 	INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE producto
(
    idProducto  INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre      VARCHAR(50),
    idCategoria     INTEGER,
    precio      FLOAT,
    estatus	 	INTEGER NOT NULL DEFAULT 1,
    CONSTRAINT fk_producto_categoria
    FOREIGN KEY (idCategoria) REFERENCES categoria(idCategoria)
);

CREATE TABLE vendedor
(
    idVendedor      INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre          VARCHAR(50),
    fechaAlta       DATE,
    fechaNac        DATE,
    direccion       VARCHAR(50),
    poblacion       VARCHAR(50),
    codPostal       VARCHAR(5),
    telefono        VARCHAR(20),
    estatus	 		INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE venta
(
    idVenta     INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idVendedor  INTEGER REFERENCES vendedor(idVendedor),
    fechaVenta  DATETIME,    
    CONSTRAINT  fk_venta_vendedor 
    FOREIGN KEY (idVendedor) REFERENCES vendedor(idVendedor)
);

CREATE TABLE detalle_venta
(
    idVenta     INTEGER NOT NULL,
    idProducto  INTEGER NOT NULL,
    kilos       INTEGER NOT NULL DEFAULT 0,
    precioVenta INTEGER NOT NULL DEFAULT 0,
    descuento   INTEGER NOT NULL DEFAULT 0,
    CONSTRAINT  fk_dv_venta
    FOREIGN KEY (idVenta) REFERENCES venta(idVenta),
    CONSTRAINT  fk_dv_producto
    FOREIGN KEY (idProducto) REFERENCES producto(idProducto)
);
