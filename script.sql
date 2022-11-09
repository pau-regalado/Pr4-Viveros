
create table vivero (
  id INT GENERATED ALWAYS AS IDENTITY,
  localizacion varchar(30),
  PRIMARY KEY(id)
);

insert into vivero (localizacion) values ('El sauzal');
insert into vivero (localizacion) values ('Tacoronte');
insert into vivero (localizacion) values ('Vilaflor');
insert into vivero (localizacion) values ('La Laguna');
insert into vivero (localizacion) values ('Santa Cruz');

create table zona (
  id INT GENERATED ALWAYS AS IDENTITY,
  id_vivero INT,
	PRIMARY KEY(id),
	CONSTRAINT fk_vivero
		FOREIGN KEY(id_vivero)
			REFERENCES vivero(id)
				ON DELETE CASCADE
);

insert into zona (id_vivero) values (1);
insert into zona (id_vivero) values (1);
insert into zona (id_vivero) values (2);
insert into zona (id_vivero) values (4);
insert into zona (id_vivero) values (3);

create table exterior (
  nombre_exterior varchar(30),
  id_zona INT,
	PRIMARY KEY(id_zona),
	CONSTRAINT fk_zona
		FOREIGN KEY(id_zona)
			REFERENCES zona(id)
				ON DELETE CASCADE
);

insert into exterior (nombre_exterior, id_zona) values (1, 3);
insert into exterior (nombre_exterior, id_zona) values (2, 3);
insert into exterior (nombre_exterior, id_zona) values (3, 5);
insert into exterior (nombre_exterior, id_zona) values (4, 3);
insert into exterior (nombre_exterior, id_zona) values (5, 5);

create table cajas (
  nombre_cajas varchar(30),
  id_zona INT,
	PRIMARY KEY(id_zona),
	CONSTRAINT fk_zona
		FOREIGN KEY(id_zona)
			REFERENCES zona(id)
				ON DELETE CASCADE
);

insert into cajas (nombre_cajas, id_zona) values (5, 4);
insert into cajas (nombre_cajas, id_zona) values (6, 3);
insert into cajas (nombre_cajas, id_zona) values (7, 3);
insert into cajas (nombre_cajas, id_zona) values (8, 3);
insert into cajas (nombre_cajas, id_zona) values (9, 4);

create table almacen (
  nombre_almacen varchar(30),
  id_zona INT,
	PRIMARY KEY(id_zona),
	CONSTRAINT fk_zona
		FOREIGN KEY(id_zona)
			REFERENCES zona(id)
				ON DELETE CASCADE
);

insert into almacen (nombre_almacen, id_zona) values (10, 2);
insert into almacen (nombre_almacen, id_zona) values (11, 2);
insert into almacen (nombre_almacen, id_zona) values (12, 2);
insert into almacen (nombre_almacen, id_zona) values (13, 2);
insert into almacen (nombre_almacen, id_zona) values (14, 2);

create table producto (
  nombre varchar(30),
  precio FLOAT,
  -- tipo INT, -- 1 Planta, 2 Jardineria, 3 Decoracion
  id_zona INT,
  stock_en_zona INT,
	PRIMARY KEY(nombre),
	CONSTRAINT fk_zona
		FOREIGN KEY(id_zona)
			REFERENCES zona(id)
				ON DELETE CASCADE
);

insert into producto (nombre, precio, id_zona, stock_en_zona) values (302, 5, 3, 10);
insert into producto (nombre, precio, id_zona, stock_en_zona) values (303, 10, 3, 20);
insert into producto (nombre, precio, id_zona, stock_en_zona) values (304, 7, 3, 15);
insert into producto (nombre, precio, id_zona, stock_en_zona) values (305, 5, 3, 10);
insert into producto (nombre, precio, id_zona, stock_en_zona) values (306, 100, 3, 10);

insert into producto (nombre, precio, id_zona, stock_en_zona) values (28, 9, 2, 2);
insert into producto (nombre, precio, id_zona, stock_en_zona) values (29, 5, 2, 5);
insert into producto (nombre, precio, id_zona, stock_en_zona) values (30, 5, 2, 10);
insert into producto (nombre, precio, id_zona, stock_en_zona) values (31, 30, 2, 20);
insert into producto (nombre, precio, id_zona, stock_en_zona) values (32, 25, 2, 15);

insert into producto (nombre, precio, id_zona, stock_en_zona) values (678, 12, 4, 70);
insert into producto (nombre, precio, id_zona, stock_en_zona) values (679, 1, 4, 10);
insert into producto (nombre, precio, id_zona, stock_en_zona) values (680, 1, 4, 10);
insert into producto (nombre, precio, id_zona, stock_en_zona) values (681, 2, 4, 10);
insert into producto (nombre, precio, id_zona, stock_en_zona) values (682, 10, 4, 10);

create table plantas (
  n_planta varchar(30),
  nombre varchar(30),
	PRIMARY KEY(n_planta),
	CONSTRAINT fk_producto
		FOREIGN KEY(nombre)
			REFERENCES producto(nombre)
				ON DELETE CASCADE
);

insert into plantas (n_planta, nombre) values ('arbol', 678);
insert into plantas (n_planta, nombre) values ('tulipan', 679);
insert into plantas (n_planta, nombre) values ('rosa', 680);
insert into plantas (n_planta, nombre) values ('margarita', 681);
insert into plantas (n_planta, nombre) values ('limonero', 682);

create table jardineria (
  n_maceta varchar(30),
  nombre varchar(30),
	PRIMARY KEY(nombre),
	CONSTRAINT fk_producto
		FOREIGN KEY(nombre)
			REFERENCES producto(nombre)
				ON DELETE CASCADE
);

insert into jardineria (n_maceta, nombre) values ('regadera', 302);
insert into jardineria (n_maceta, nombre) values ('manguera', 303);
insert into jardineria (n_maceta, nombre) values ('maceta', 304);
insert into jardineria (n_maceta, nombre) values ('alicates', 305);
insert into jardineria (n_maceta, nombre) values ('cortacesped', 306);


create table decoracion (
  n_decoracion varchar(30),
  nombre varchar(30),
	PRIMARY KEY(nombre),
	CONSTRAINT fk_producto
		FOREIGN KEY(nombre)
			REFERENCES producto(nombre)
				ON DELETE CASCADE
);

insert into decoracion (n_decoracion, nombre) values ('pinzas', 28);
insert into decoracion (n_decoracion, nombre) values ('papel', 29);
insert into decoracion (n_decoracion, nombre) values ('pintura', 30);
insert into decoracion (n_decoracion, nombre) values ('lampara', 31);
insert into decoracion (n_decoracion, nombre) values ('mesa', 32);

create table clientePlus (
  nombre_cliente varchar(30),
  fecha_ingreso date,
  PRIMARY KEY(nombre_cliente)
);

insert into clientePlus (nombre_cliente, fecha_ingreso) values ('Paula', '20220410');
insert into clientePlus (nombre_cliente, fecha_ingreso) values ('Alvaro', '20210529');
insert into clientePlus (nombre_cliente, fecha_ingreso) values ('Carlos', '20200911');
insert into clientePlus (nombre_cliente, fecha_ingreso) values ('Sofia', '20200911');
insert into clientePlus (nombre_cliente, fecha_ingreso) values ('Jorge', '20100228');

create table compra (
  nombre_producto varchar(30),
  nombre_cliente varchar(30),
  PRIMARY KEY(nombre_producto),
	CONSTRAINT fk_producto
		FOREIGN KEY(nombre_producto)
			REFERENCES producto(nombre)
				ON DELETE CASCADE
);

insert into compra (nombre_producto, nombre_cliente) values (678, 'Paco');
insert into compra (nombre_producto, nombre_cliente) values (681, 'Amanda');
insert into compra (nombre_producto, nombre_cliente) values (29, 'Paola');
insert into compra (nombre_producto, nombre_cliente) values (30, 'Carla');
insert into compra (nombre_producto, nombre_cliente) values (303, 'Marcos');

create table empleado (
  nombre varchar(30),
  id_vivero INT,
  id_zona INT,
  productividad_en_zona float,
  epoca_del_ano varchar(30),
  PRIMARY KEY(nombre), --  , id_vivero, epoca_del_ano),
  CONSTRAINT fk_vivero
		FOREIGN KEY(id_vivero)
			REFERENCES vivero(id)
				ON DELETE CASCADE,
  CONSTRAINT fk_zona
		FOREIGN KEY(id_zona)
			REFERENCES zona(id)
				ON DELETE CASCADE
);

insert into empleado (nombre, id_vivero, id_zona, productividad_en_zona, epoca_del_ano) values ('Pepe', 1, 2, 5.6, 'Otoño');
insert into empleado (nombre, id_vivero, id_zona, productividad_en_zona, epoca_del_ano) values ('Maria', 2, 3, 2.6, 'Verano');
insert into empleado (nombre, id_vivero, id_zona, productividad_en_zona, epoca_del_ano) values ('Pepa', 3, 6, 1.3, 'Otoño');
insert into empleado (nombre, id_vivero, id_zona, productividad_en_zona, epoca_del_ano) values ('Mario', 3, 5, 8.2, 'Invierno');
insert into empleado (nombre, id_vivero, id_zona, productividad_en_zona, epoca_del_ano) values ('Raul', 4, 4, 4.9, 'Primavera');

create table pedido (
  id_pedido INT GENERATED ALWAYS AS IDENTITY,
  nombre_cliente varchar(30),
  nombre_empleado varchar(30),
  producto varchar(30),
  productividad_pedido float,
  PRIMARY KEY(id_pedido),
  CONSTRAINT fk_cliente
		FOREIGN KEY(nombre_cliente)
			REFERENCES clientePlus(nombre_cliente)
				ON DELETE CASCADE,
  CONSTRAINT fk_empleado
		FOREIGN KEY(nombre_empleado)
			REFERENCES empleado(nombre)
				ON DELETE CASCADE,
  CONSTRAINT fk_producto
		FOREIGN KEY(producto)
			REFERENCES producto(nombre)
				ON DELETE CASCADE
);

insert into pedido (nombre_cliente, nombre_empleado, producto, productividad_pedido) values ('Carlos', 'Mario', 306, 9.4);
insert into pedido (nombre_cliente, nombre_empleado, producto, productividad_pedido) values ('Sofia', 'Pepa', 31, 3.1);
insert into pedido (nombre_cliente, nombre_empleado, producto, productividad_pedido) values ('Jorge', 'Raul', 303, 5.0);
insert into pedido (nombre_cliente, nombre_empleado, producto, productividad_pedido) values ('Paula', 'Maria', 380, 1.2);
insert into pedido (nombre_cliente, nombre_empleado, producto, productividad_pedido) values ('Alvaro', 'Pepe', 678, 4.8);

