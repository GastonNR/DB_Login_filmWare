CREATE DATABASE IF NOT EXISTS `filmWare_login` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `filmWare_login`;

CREATE TABLE IF NOT EXISTS `administradores` (
  `id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `nombre_completo` VARCHAR(100) NOT NULL,
  `nombre_usuario` VARCHAR(50) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `tipo` VARCHAR(20) DEFAULT 'admin'
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `clientes` (
  `id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `nombre_completo` VARCHAR(100) NOT NULL,
  `nombre_usuario` VARCHAR(50) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `tipo` VARCHAR(20) DEFAULT 'cliente'
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `direccion` (
  `id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `calle` VARCHAR(50) NOT NULL,
  `numero` INT NOT NULL,
  `localidad` VARCHAR(50) NOT NULL,
  `ciudad` VARCHAR(50) NOT NULL,
  `provincia` VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `sucursales` (
  `id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` INT NOT NULL,
  `numero_de_salas` INT,
  `capacidad` INT,
  `admin_id` INT,
  FOREIGN KEY (`direccion`) REFERENCES direccion(`id`),
  FOREIGN KEY (`admin_id`) REFERENCES administradores(`id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `pagos` (
  `id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `monto` DECIMAL(10,2) NOT NULL,
  `cliente` INT,
  `sucursal` INT,
  `fecha` DATE NOT NULL,
  FOREIGN KEY (`cliente`) REFERENCES clientes(`id`),
  FOREIGN KEY (`sucursal`) REFERENCES sucursales(`id`)
) ENGINE=InnoDB;