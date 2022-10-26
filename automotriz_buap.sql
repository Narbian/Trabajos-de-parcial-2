-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2022 a las 02:03:20
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `automotriz_buap`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agencia_revisiones`
--

CREATE TABLE `agencia_revisiones` (
  `No._de_Sucursal` varchar(10) NOT NULL,
  `Matricula` varchar(7) NOT NULL,
  `No._de_revisiones` varchar(10) NOT NULL,
  `Cambio_de_filtro` varchar(2) NOT NULL,
  `Cambio_de_aceite` varchar(2) NOT NULL,
  `Cambio_de_frenos` varchar(2) NOT NULL,
  `Otros` varchar(200) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID-Cliente` varchar(10) NOT NULL,
  `Nombre` varchar(80) NOT NULL,
  `Direccion` varchar(60) NOT NULL,
  `Ciudad` varchar(60) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `Codigo Interno` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coche`
--

CREATE TABLE `coche` (
  `Matricula` varchar(7) NOT NULL,
  `Marca` varchar(50) NOT NULL,
  `Modelo` varchar(50) NOT NULL,
  `Color` varchar(50) NOT NULL,
  `Precio` int(10) NOT NULL,
  `ID-Cliente` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agencia_revisiones`
--
ALTER TABLE `agencia_revisiones`
  ADD PRIMARY KEY (`No._de_Sucursal`),
  ADD KEY `Matricula` (`Matricula`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID-Cliente`);

--
-- Indices de la tabla `coche`
--
ALTER TABLE `coche`
  ADD PRIMARY KEY (`Matricula`),
  ADD KEY `ID-Cliente` (`ID-Cliente`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agencia_revisiones`
--
ALTER TABLE `agencia_revisiones`
  ADD CONSTRAINT `Matricula` FOREIGN KEY (`Matricula`) REFERENCES `coche` (`Matricula`);

--
-- Filtros para la tabla `coche`
--
ALTER TABLE `coche`
  ADD CONSTRAINT `ID-Cliente` FOREIGN KEY (`ID-Cliente`) REFERENCES `cliente` (`ID-Cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
