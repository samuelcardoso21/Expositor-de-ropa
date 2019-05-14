-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 18-03-2019 a las 20:37:57
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `CRUD`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE IF NOT EXISTS `genero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sexo` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `sexo`) VALUES
(1, 'Hombre'),
(2, 'Mujer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prenda`
--

CREATE TABLE IF NOT EXISTS `prenda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gero` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  `precio` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  `fecha` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `enlace` varchar(350) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gero` (`gero`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `prenda`
--

INSERT INTO `prenda` (`id`, `gero`, `nombre`, `precio`, `fecha`, `enlace`) VALUES
(10, 1, 'Camiseta con estampado', '7,99 €', '02/03/2019', 'https://www.bershka.com/es/hombre/colecci%C3%B3n/camisetas/camiseta-con-estampado-c1010193239p101869472.html?colorId=250'),
(11, 1, 'Polo de manga corta', '17,99€', '02/03/2019', 'https://www.bershka.com/es/hombre/colecci%C3%B3n/camisetas/polo-con-manga-corta-c1010193239p101880712.html?colorId=800'),
(12, 1, 'Zapatillas monocolor piel', '30€', '02/03/2019', 'https://www.bershka.com/es/hombre/colecci%C3%B3n/camisetas/zapatilla-monocolor-piel-hombre-c1010193239p101759828.html?colorId=040'),
(13, 2, 'Sudadera panel cuello alto', '22,99€', '02/03/2019', 'https://www.pullandbear.com/es/mujer/trending-now/teen/sudadera-panel-cuello-alto-c1030192103p501388323.html?cS=403'),
(14, 2, 'Sudadera oversize bordado', '9,99€', '02/03/2019', 'https://www.pullandbear.com/es/mujer/ropa/sudaderas/sudadera-oversize-bordado-c29018p501219835.html?cS=305');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prenda`
--
ALTER TABLE `prenda`
  ADD CONSTRAINT `prenda_ibfk_1` FOREIGN KEY (`gero`) REFERENCES `genero` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
