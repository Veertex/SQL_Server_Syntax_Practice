CREATE TABLE categoria_productos(
    id_categoria_producto INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    nombre_categoria VARCHAR NOT NULL,
);

CREATE TABLE producto(
    id_producto INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    nombre_producto VARCHAR NOT NULL,
    id_categoria_producto INT NOT NULL FOREIGN KEY(id_categoria_producto) REFERENCES categoria_productos
);


