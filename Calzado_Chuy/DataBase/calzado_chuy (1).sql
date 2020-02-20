-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-02-2020 a las 00:57:53
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `calzado_chuy`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `cliente` (IN `_id_cliente` VARCHAR(10), IN `_Nombre` VARCHAR(15), IN `_Ap_p` VARCHAR(15), IN `_id_calzado` VARCHAR(10), IN `_compra` INT(11))  NO SQL
BEGIN
START TRANSACTION;

INSERT INTO cliente(id_cliente, Nombre, Ap_p, id_calzado, compra)
VALUES(_id_cliente, _Nombre, _Ap_p, _id_calzado, 1);

COMMIT;
ROLLBACK;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `compras` (IN `_id_calzado` VARCHAR(10), IN `_genero` VARCHAR(15), IN `_estilo` VARCHAR(15), IN `_color` VARCHAR(15), IN `_precio` DECIMAL(8,2), IN `_existencia` INT(8))  BEGIN
	
INSERT INTO almacen(id_calzado,genero,estilo,color,precio,existencia) VALUES(_id_calzado,_genero,_estilo,_color,_precio,_existencia);
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ventas` (IN `venta` INT(4), IN `_id_calzado` VARCHAR(10))  BEGIN
START TRANSACTION;
UPDATE almacen SET existencia=existencia-venta
WHERE id_calzado=_id_calzado;
COMMIT;
ROLLBACK;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `id_calzado` varchar(10) NOT NULL,
  `genero` varchar(10) NOT NULL,
  `estilo` varchar(15) NOT NULL,
  `color` varchar(15) NOT NULL,
  `precio` decimal(8,2) NOT NULL,
  `existencia` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`id_calzado`, `genero`, `estilo`, `color`, `precio`, `existencia`) VALUES
('HCN01', 'Hombre', 'Casual', 'Negro', '1000.50', 600),
('HDV01', 'Hombre', 'Deportivo', 'Verde', '1650.35', 800),
('HFN01', 'Hombre', 'Formal', 'Negro', '1230.56', 540),
('HTA01', 'Hombre', 'Tenis', 'Azul', '2550.52', 350),
('HVC01', 'Hombre', 'Vintage', 'Café', '949.26', 1500),
('MCB01', 'Mujer', 'Campirano', 'Beige', '700.25', 4850),
('MCR01', 'Mujer', 'Casual', 'Rojo', '3550.25', 480),
('MCR02', 'Mujer', 'Casual', 'Rojo', '2554.23', 530),
('MDB01', 'Mujer', 'Deportivo', 'Blanco', '2800.59', 90),
('MDR01', 'Mujer', 'Deportivo', 'Rosa', '800.50', 3000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` varchar(10) NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  `Ap_p` varchar(15) NOT NULL,
  `id_calzado` varchar(10) NOT NULL,
  `compra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `Nombre`, `Ap_p`, `id_calzado`, `compra`) VALUES
('CF260993DF', 'César', 'Fonseca', 'HFN01', 1),
('RC260794DF', 'Ricardo', 'Cores', 'HFN01', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`id_calzado`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_calzado` (`id_calzado`),
  ADD KEY `id_calzado_2` (`id_calzado`),
  ADD KEY `id_calzado_3` (`id_calzado`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_calzado`) REFERENCES `almacen` (`id_calzado`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
