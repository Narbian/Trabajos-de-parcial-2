-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-10-2022 a las 02:39:16
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
-- Base de datos: `escuela_buap`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `clave` varchar(4) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `horas_semana` tinyint(4) NOT NULL,
  `horas_totales` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`clave`, `nombre`, `horas_semana`, `horas_totales`) VALUES
('142', 'Construye BD', 6, 90),
('143', 'Desarrolla AplicWeb', 6, 90);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `nombre` varchar(20) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `lider_academia` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`nombre`, `turno`, `lider_academia`) VALUES
('Contabilidad', 'Mixto', NULL),
('Electricidad', 'Matutino', NULL),
('Logistica', 'Mixto', NULL),
('Mecanica', 'Matutino', NULL),
('Programacion', 'Mixto', NULL),
('Recursos Humanos', 'Mixto', NULL),
('Soporte', 'Mixto', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `num_control` varchar(14) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `edad` tinyint(4) NOT NULL,
  `domicilio` varchar(80) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `grupo` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`num_control`, `nombre`, `apellidos`, `edad`, `domicilio`, `telefono`, `grupo`) VALUES
('19311022937543', 'Juan Angel ', 'Almanza Arevalo', 18, 'Guanajuato 10', '4183927493', '5PV'),
('19311028194628', 'Victor Manuel', 'Landeros Morales', 18, 'Lazaro Cardenas 1', '4183629452', '5PV'),
('19311028406872', 'Tristan', 'Martinez Gonzalez', 19, 'Benito Juarez 12', '4182950361', '5PV'),
('19311050750470', 'Brian Ulises', 'Almaguer Perez', 18, 'Emiliano Zapata 5', '4182379867', '5PV'),
('20311028012748', 'Ximena', 'Licea Martinez', 18, 'Tamaulipas 33', '4180239853', '5PM'),
('20311028281946', 'Alberto Fabian', 'Lopez Mendez', 16, 'Guerrero 6', '4182943693', '5PM'),
('20311028402921', 'Maria Alejandra', 'Alvarado Luna', 16, 'Jalisco 74', '4186481982', '5PM'),
('20311028429173', 'Diego Roman', 'Cortez Aguillon', 17, 'Sonora 26', '4182397236', '5PM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_asignatura`
--

CREATE TABLE `estudiante_asignatura` (
  `num_control` varchar(14) NOT NULL,
  `asignatura` varchar(40) NOT NULL,
  `fecha` date NOT NULL,
  `semestre` tinyint(3) NOT NULL,
  `calificacion` float NOT NULL,
  `parcial` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante_asignatura`
--

INSERT INTO `estudiante_asignatura` (`num_control`, `asignatura`, `fecha`, `semestre`, `calificacion`, `parcial`) VALUES
('19311050750470', '142', '2022-09-27', 5, 10, 1),
('19311050750470', '143', '2022-09-27', 5, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `nombre` varchar(4) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `representante` varchar(80) DEFAULT NULL,
  `tutor` varchar(80) DEFAULT NULL,
  `carrera` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`nombre`, `turno`, `representante`, `tutor`, `carrera`) VALUES
('5AM', 'Matutino', NULL, NULL, 'Recursos Humanos'),
('5AV1', 'Vespertino', NULL, NULL, 'Recursos Humanos'),
('5AV2', 'Vespertino', NULL, NULL, 'Recursos Humanos'),
('5CM', 'Matutino', NULL, NULL, 'Contabilidad'),
('5CV', 'Vespertino', NULL, NULL, 'Contabilidad'),
('5E', 'Matutino', NULL, NULL, 'Electricidad'),
('5LV', 'Vespertino', NULL, NULL, 'Logistica'),
('5M', 'Matutino', NULL, NULL, 'Mecanica'),
('5PM', 'Matutino', NULL, NULL, 'Programacion'),
('5PV', 'Vespertino', NULL, NULL, 'Programacion'),
('5SM', 'Matutino', NULL, NULL, 'Soporte'),
('5SV', 'Vespertino', NULL, NULL, 'Soporte');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`num_control`),
  ADD KEY `grupo` (`grupo`);

--
-- Indices de la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD PRIMARY KEY (`num_control`,`asignatura`),
  ADD KEY `asignatura` (`asignatura`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `carrera` (`carrera`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `grupo` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`nombre`);

--
-- Filtros para la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD CONSTRAINT `asignatura` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`clave`),
  ADD CONSTRAINT `num_control` FOREIGN KEY (`num_control`) REFERENCES `estudiante` (`num_control`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `carrera` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
