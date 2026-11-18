
CREATE DATABASE IF NOT EXISTS PolizasDB;
USE PolizasDB;

CREATE TABLE estado (
    id_estado INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estado VARCHAR(50) NOT NULL
);

CREATE TABLE municipio (
    id_municipio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_municipio VARCHAR(50) NOT NULL,
    id_estado INT NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES estado(id_estado)
);

CREATE TABLE colonia (
    id_colonia INT AUTO_INCREMENT PRIMARY KEY,
    nombre_colonia VARCHAR(100) NOT NULL,
    codigo_postal VARCHAR(10),
    id_municipio INT NOT NULL,
    FOREIGN KEY (id_municipio) REFERENCES municipio(id_municipio)
);

CREATE TABLE domicilio (
    id_domicilio INT AUTO_INCREMENT PRIMARY KEY,
    calle VARCHAR(100) NOT NULL,
    num_exterior VARCHAR(20),
    num_interior VARCHAR(20),
    id_colonia INT NOT NULL,
    FOREIGN KEY (id_colonia) REFERENCES colonia(id_colonia)
);


CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(100),
    RFC VARCHAR(20),
    id_domicilio INT NOT NULL,
    FOREIGN KEY (id_domicilio) REFERENCES domicilio(id_domicilio)
);

CREATE TABLE marca_vehiculo (
    id_marca_v INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL
);

CREATE TABLE modelo_vehiculo (
    id_mode_v INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
    id_marca_v INT NOT NULL,
    FOREIGN KEY (id_marca_v) REFERENCES marca_vehiculo(id_marca_v)
);

CREATE TABLE tipo_vehiculo (
    id_tpo_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL
);


CREATE TABLE vehiculo (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    placas VARCHAR(20) NOT NULL UNIQUE,
    anio INT,
    id_marca_v INT NOT NULL,
    id_mode_v INT NOT NULL,
    id_tpo_vehiculo INT NOT NULL,
    FOREIGN KEY (id_marca_v) REFERENCES marca_vehiculo(id_marca_v),
    FOREIGN KEY (id_mode_v) REFERENCES modelo_vehiculo(id_mode_v),
    FOREIGN KEY (id_tpo_vehiculo) REFERENCES tipo_vehiculo(id_tpo_vehiculo)
);


CREATE TABLE cobertura (
    id_cobertura INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    monto DECIMAL(10,2),
    vigencia VARCHAR(50)
);

CREATE TABLE agencia (
    id_agencia INT AUTO_INCREMENT PRIMARY KEY,
    nombre_agencia VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(150),
    telefono VARCHAR(20)
);


CREATE TABLE poliza (
    folio_poliza INT AUTO_INCREMENT PRIMARY KEY,
    NumPoliza VARCHAR(50) NOT NULL UNIQUE,
    precio DECIMAL(10,2) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado VARCHAR(20) NOT NULL, -- Ej. 'Activa', 'Cancelada'
    id_cliente INT NOT NULL,
    id_vehiculo INT NOT NULL,
    id_agencia INT NOT NULL,
    id_cobertura INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id_vehiculo),
    FOREIGN KEY (id_agencia) REFERENCES agencia(id_agencia),
    FOREIGN KEY (id_cobertura) REFERENCES cobertura(id_cobertura)
);

CREATE TABLE pago (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    monto DECIMAL(10,2) NOT NULL,
    fecha_pago DATE NOT NULL,
    metodo_pago VARCHAR(50),
    folio_poliza INT NOT NULL,
    FOREIGN KEY (folio_poliza) REFERENCES poliza(folio_poliza)
);

CREATE TABLE reporte (
    id_reporte INT AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT NOT NULL,
    fecha_reporte DATE NOT NULL,
    estado_reporte VARCHAR(30),
    folio_poliza INT NOT NULL,
    FOREIGN KEY (folio_poliza) REFERENCES poliza(folio_poliza)
);
