-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-03-2024 a las 02:12:44
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campaña`
--

CREATE TABLE `campaña` (
  `Id_Campana` int(11) NOT NULL,
  `Piso` int(11) NOT NULL,
  `Nombre_Camapana` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `campaña`
--

INSERT INTO `campaña` (`Id_Campana`, `Piso`, `Nombre_Camapana`) VALUES
(1, 1, 'Qualitas Motos'),
(2, 1, 'Qualitas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejecutivo`
--

CREATE TABLE `ejecutivo` (
  `id_Ejecutivo` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Campaña` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ejecutivo`
--

INSERT INTO `ejecutivo` (`id_Ejecutivo`, `Nombre`, `Apellido`, `Campaña`) VALUES
(1, 'Luis', 'Garcia', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `Id_Equipo` int(11) NOT NULL,
  `Hostname` varchar(100) NOT NULL,
  `Serial` varchar(50) NOT NULL,
  `CPU` varchar(30) NOT NULL,
  `Monitor` varchar(30) NOT NULL,
  `Diadema` varchar(30) NOT NULL,
  `Campana` int(11) NOT NULL,
  `Mesa` int(11) NOT NULL,
  `Posicion` int(11) NOT NULL,
  `IP` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`Id_Equipo`, `Hostname`, `Serial`, `CPU`, `Monitor`, `Diadema`, `Campana`, `Mesa`, `Posicion`, `IP`) VALUES
(1, 'Prueba', 'Prueba', 'Prueba', 'Prueba', 'Prueba', 1, 1, 2, 'Prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `mesa` (
  `Id_Mesa` int(11) NOT NULL,
  `Letra_Mesa` varchar(10) NOT NULL,
  `Campaña` int(11) NOT NULL,
  `Num_Posiciones` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mesa`
--

INSERT INTO `mesa` (`Id_Mesa`, `Letra_Mesa`, `Campaña`, `Num_Posiciones`) VALUES
(1, 'A', 1, 23),
(5, 'B', 2, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `piso`
--

CREATE TABLE `piso` (
  `Id_Piso` int(11) NOT NULL,
  `Piso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `piso`
--

INSERT INTO `piso` (`Id_Piso`, `Piso`) VALUES
(1, 0),
(2, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `campaña`
--
ALTER TABLE `campaña`
  ADD PRIMARY KEY (`Id_Campana`),
  ADD KEY `Piso` (`Piso`);

--
-- Indices de la tabla `ejecutivo`
--
ALTER TABLE `ejecutivo`
  ADD PRIMARY KEY (`id_Ejecutivo`),
  ADD KEY `Campaña` (`Campaña`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`Id_Equipo`),
  ADD KEY `Campana` (`Campana`),
  ADD KEY `Mesa` (`Mesa`);

--
-- Indices de la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`Id_Mesa`),
  ADD KEY `Campaña` (`Campaña`);

--
-- Indices de la tabla `piso`
--
ALTER TABLE `piso`
  ADD PRIMARY KEY (`Id_Piso`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `campaña`
--
ALTER TABLE `campaña`
  MODIFY `Id_Campana` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ejecutivo`
--
ALTER TABLE `ejecutivo`
  MODIFY `id_Ejecutivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `Id_Equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mesa`
--
ALTER TABLE `mesa`
  MODIFY `Id_Mesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `piso`
--
ALTER TABLE `piso`
  MODIFY `Id_Piso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `campaña`
--
ALTER TABLE `campaña`
  ADD CONSTRAINT `campaña_ibfk_1` FOREIGN KEY (`Piso`) REFERENCES `piso` (`Id_Piso`);

--
-- Filtros para la tabla `ejecutivo`
--
ALTER TABLE `ejecutivo`
  ADD CONSTRAINT `ejecutivo_ibfk_1` FOREIGN KEY (`Campaña`) REFERENCES `campaña` (`Id_Campana`);

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`Campana`) REFERENCES `campaña` (`Id_Campana`),
  ADD CONSTRAINT `equipo_ibfk_2` FOREIGN KEY (`Mesa`) REFERENCES `mesa` (`Id_Mesa`);

--
-- Filtros para la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD CONSTRAINT `mesa_ibfk_1` FOREIGN KEY (`Campaña`) REFERENCES `campaña` (`Id_Campana`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
