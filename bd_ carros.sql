-- Create tables.

CREATE TABLE IF NOT EXISTS marcas (
  id_marca INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre_marca VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS modelos_carros (
  id_modelo INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre_modelo TEXT,
  marca INTEGER NOT NULL REFERENCES marcas(id_marca)
);

CREATE TABLE IF NOT EXISTS tipos_identificaciones (
  id_identificacion INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  tipo_identificacion VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS vendedores (
  id_vendedor INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre_vendedor VARCHAR(50),
  apellidos_vendedor VARCHAR(50),
  tipo_identificacion INTEGER NOT NULL REFERENCES tipos_identificaciones(id_identificacion),
  num_identificacion VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS clientes (
  id_cliente INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre_cliente VARCHAR(50),
  apellidos_cliente VARCHAR(50),
  tipo_identificacion_cliente INTEGER NOT NULL REFERENCES tipos_identificaciones(id_identificacion),
  num_identificacion_cliente VARCHAR(20)
  );

CREATE TABLE IF NOT EXISTS ventas (
  id_venta INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  marca_vendida INTEGER NOT NULL REFERENCES marcas(id_marca),
  modelo_vendido INTEGER NOT NULL REFERENCES modelos_carros(id_modelo),
  fecha_venta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  vendedor INTEGER NOT NULL REFERENCES vendedores(id_vendedor)
);


ALTER TABLE ventas ADD COLUMN cliente INTEGER NOT NULL REFERENCES
clientes(id_cliente);

SELECT
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_name = 'ventas';



-- =========================
-- MARCAS
-- =========================
INSERT INTO marcas (nombre_marca) VALUES
('Toyota'),
('Chevrolet'),
('Mazda'),
('Renault'),
('Kia');

-- =========================
-- TIPOS DE IDENTIFICACIÓN
-- =========================
INSERT INTO tipos_identificaciones (tipo_identificacion) VALUES
('CC'),
('CE'),
('TI'),
('Pasaporte');

-- =========================
-- MODELOS DE CARROS
-- =========================
INSERT INTO modelos_carros (nombre_modelo, marca) VALUES
('Corolla', 1),
('Hilux', 1),
('Spark GT', 2),
('Onix', 2),
('Mazda 3', 3),
('CX-5', 3),
('Logan', 4),
('Duster', 4),
('Picanto', 5),
('Sportage', 5);

-- =========================
-- VENDEDORES
-- =========================
INSERT INTO vendedores (
    nombre_vendedor,
    apellidos_vendedor,
    tipo_identificacion,
    num_identificacion
) VALUES
('Juan', 'Pérez', 1, '123456789'),
('María', 'Gómez', 1, '987654321'),
('Carlos', 'Rodríguez', 2, 'CE456123'),
('Laura', 'Martínez', 1, '1020304050');

-- =========================
-- CLIENTES
-- =========================
INSERT INTO clientes (
    nombre_cliente,
    apellidos_cliente,
    tipo_identificacion_cliente,
    num_identificacion_cliente
) VALUES
('Andrés', 'López', 1, '111111111'),
('Sofía', 'Ramírez', 1, '222222222'),
('Miguel', 'Torres', 2, 'CE789456'),
('Valentina', 'Castro', 1, '333333333'),
('Daniel', 'Morales', 4, 'PA123456');

-- =========================
-- VENTAS
-- =========================
INSERT INTO ventas (
    marca_vendida,
    modelo_vendido,
    fecha_venta,
    vendedor,
    cliente
) VALUES
(1, 1, '2026-07-01 09:15:00', 1, 1),
(2, 4, '2026-07-02 14:30:00', 2, 2),
(3, 5, '2026-07-03 11:45:00', 3, 3),
(4, 7, '2026-07-04 16:20:00', 4, 4),
(5, 10, '2026-07-05 10:05:00', 2, 5);

SELECT * FROM marcas;
SELECT * FROM clientes;
SELECT * FROM tipos_identificaciones;
SELECT * FROM vendedores;
SELECT * FROM modelos_carros;

