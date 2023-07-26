CREATE TABLE categoria_productos(
	id_categoria_producto INT IDENTITY(1,1) NOT NULL,
	nombre_categoria VARCHAR(256) NOT NULL,
	CONSTRAINT pk_id_categoria_producto PRIMARY KEY(id_categoria_producto)
);

CREATE TABLE producto(
	id_producto INT IDENTITY(1,1) NOT NULL,
	nombre_producto VARCHAR(256) NOT NULL,
	id_categoria_producto INT NOT NULL,
	CONSTRAINT pk_id_producto PRIMARY KEY(id_producto),
	CONSTRAINT id_categoria_producto FOREIGN KEY (id_categoria_producto)
	REFERENCES categoria_productos(id_categoria_producto)
);