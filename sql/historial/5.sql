-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-05-2018 a las 05:00:32
-- Versión del servidor: 5.6.25
-- Versión de PHP: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pqr`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE IF NOT EXISTS `calificacion` (
  `id_calificacion` int(11) NOT NULL,
  `descripcion_calificacion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE IF NOT EXISTS `contacto` (
  `id_contacto` int(11) NOT NULL,
  `descripcion_contacto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta`
--

CREATE TABLE IF NOT EXISTS `encuesta` (
  `id_encuesta` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fecha_encuesta` date DEFAULT NULL,
  `hora_encuesta` time DEFAULT NULL,
  `mejora` varchar(3000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `id_estado` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `descripcion`) VALUES
(1, 'ENVIADA'),
(2, 'EN TRAMITE'),
(3, 'RESUELTA'),
(4, 'TERMINADA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE IF NOT EXISTS `preguntas` (
  `id_preguntas` int(11) NOT NULL,
  `descripcion_preguntas` varchar(3000) DEFAULT NULL,
  `id_contacto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas_encuesta`
--

CREATE TABLE IF NOT EXISTS `preguntas_encuesta` (
  `id_preguntas_encuesta` int(11) NOT NULL,
  `id_encuesta` int(11) DEFAULT NULL,
  `id_preguntas` int(11) DEFAULT NULL,
  `id_calificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimiento_solicitud`
--

CREATE TABLE IF NOT EXISTS `seguimiento_solicitud` (
  `id_seguimiento` int(11) NOT NULL,
  `id_solicitud` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `descripcion_estado` text
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `seguimiento_solicitud`
--

INSERT INTO `seguimiento_solicitud` (`id_seguimiento`, `id_solicitud`, `fecha`, `hora`, `id_estado`, `descripcion_estado`) VALUES
(41, 25, '2018-03-30', '02:13:41', 1, 'La solicitud fue recibida con exito, pronto recibira respuesta.'),
(42, 25, '2018-03-30', '02:23:57', 2, 'esta en seguimiento'),
(43, 25, '2018-03-30', '02:26:07', 3, 'ya se soluiciono'),
(44, 26, '2018-03-30', '02:38:55', 1, 'La solicitud fue recibida con exito, pronto recibira respuesta.'),
(45, 26, '2018-05-03', '07:06:58', NULL, 'respuesta no solucionada'),
(46, 26, '2018-05-03', '07:07:21', 2, 'respuesta no soluicionada'),
(47, 26, '2018-05-03', '07:08:49', 2, 'otra respuesta'),
(48, 26, '2018-05-03', '07:09:03', 2, 'otra y nada'),
(49, 26, '2018-05-03', '07:10:47', 3, 'ahora si'),
(50, 27, '2018-05-03', '07:13:18', 1, 'La solicitud fue recibida con exito, pronto recibira respuesta.'),
(57, 27, '2018-05-03', '07:39:18', 2, 'todvia no'),
(58, 27, '2018-05-03', '07:49:40', 3, 'si ya'),
(59, 27, '2018-05-03', '08:09:34', 2, 'aun no se me soluciona'),
(60, 27, '2018-05-03', '08:13:00', 4, 'ahora si ya');

--
-- Disparadores `seguimiento_solicitud`
--
DELIMITER $$
CREATE TRIGGER `cambia_estado_solicitud` BEFORE INSERT ON `seguimiento_solicitud`
 FOR EACH ROW BEGIN
IF NEW.id_estado = 3 THEN
       UPDATE `solicitud` SET estado_solicitud = 'Espera' WHERE id_solicitud = NEW.id_solicitud;
    END IF;
IF NEW.id_estado = 4 THEN
       UPDATE `solicitud` SET estado_solicitud = 'Inactiva' WHERE id_solicitud = NEW.id_solicitud;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

CREATE TABLE IF NOT EXISTS `solicitud` (
  `id_solicitud` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `id_tiposolicitud` int(11) DEFAULT NULL,
  `sufijo_solicitud` varchar(48) DEFAULT NULL,
  `descripcion_solicitud` varchar(10000) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado_solicitud` enum('Activa','Inactiva','Espera') DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `solicitud`
--

INSERT INTO `solicitud` (`id_solicitud`, `user_id`, `id_tiposolicitud`, `sufijo_solicitud`, `descripcion_solicitud`, `fecha`, `estado_solicitud`) VALUES
(25, 83, 1, 'SOLICITUD-0000', 'esta es una peticion de prueba', '2018-03-30', 'Inactiva'),
(26, 83, 2, 'SOLICITUD-0000', 'ESTA ES UNA QUEJA', '2018-03-30', 'Inactiva'),
(27, 83, 1, 'SOLICITUD-0000', 'Esta es una prueba inicial', '2018-05-04', 'Inactiva');

--
-- Disparadores `solicitud`
--
DELIMITER $$
CREATE TRIGGER `sufijo` BEFORE INSERT ON `solicitud`
 FOR EACH ROW BEGIN
set @num = new.id_solicitud;
SET NEW.sufijo_solicitud = CONCAT("SOLICITUD-000",'',@num);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_solicitud`
--

CREATE TABLE IF NOT EXISTS `tipo_solicitud` (
  `id_tiposolicitud` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_solicitud`
--

INSERT INTO `tipo_solicitud` (`id_tiposolicitud`, `descripcion`) VALUES
(1, 'PETICION'),
(2, 'QUEJA'),
(3, 'RECLAMO'),
(4, 'VIVENCIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL COMMENT 'auto incrementing user_id of each user, unique index',
  `firstname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
  `user_password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s password in salted and hashed format',
  `user_email` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique',
  `date_added` datetime NOT NULL,
  `perfil` enum('Administrador','Gerente','Empleado') COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identificacion` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `user_name`, `user_password_hash`, `user_email`, `date_added`, `perfil`, `direccion`, `telefono`, `identificacion`) VALUES
(1, 'Andres', 'Damian', 'admin', '$2y$10$MPVHzZ2ZPOWmtUUGCq3RXu31OTB.jo7M9LZ7PmPQYmgETSNn19ejO', 'admin@admin.com', '2016-05-21 15:06:00', 'Administrador', NULL, NULL, NULL),
(76, 'carlos', 'Empleado', 'empleado1', '$2y$10$X7ha4rCPbpxBqYwAzfft8uJvhhx5pTfnPhj6.lmY06P80X6Do24yi', 'emp@gmail.com', '2017-11-09 01:10:52', 'Empleado', NULL, NULL, NULL),
(77, 'gerente', 'Gerente', 'gerente', '$2y$10$f71nf0yAI6XT1nyTZDyjVOb223BLYiuXE2sopZFODXqr47LHq0oS2', 'ge@gmail.com', '2017-11-09 01:13:01', 'Gerente', NULL, NULL, NULL),
(81, 'andres', 'Empleado', 'admin1', '$2y$10$v9NaFOF6vcbRhU.BvVpMZ..4FMBz0iKwENTU3bB5Y9rN2S.xYNRCe', 'o@gmail.com', '2018-01-19 04:01:59', 'Empleado', NULL, NULL, NULL),
(82, 'alex', 'paz', 'oscar', '$2y$10$sx291m8coHDKvj4CoH4kPeCWND8HkAqhRXVcJp/B1Q8oymUUKZUza', 'oscar@gmail.com', '2018-01-19 22:02:04', 'Empleado', NULL, NULL, NULL),
(83, 'JUAN', 'ANDRES', 'juan', '$2y$10$G3pUOi9pyp1qO/L76QYJiuSXfmlRN3xc4nNUAqfp1Sz4wHd86CiGC', 'juan@gmail.com', '2018-03-13 22:57:45', 'Empleado', NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`id_calificacion`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id_contacto`);

--
-- Indices de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD PRIMARY KEY (`id_encuesta`),
  ADD KEY `usuario_id_fk_idx` (`user_id`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id_preguntas`),
  ADD KEY `id_contacto_idx_idx` (`id_contacto`);

--
-- Indices de la tabla `preguntas_encuesta`
--
ALTER TABLE `preguntas_encuesta`
  ADD PRIMARY KEY (`id_preguntas_encuesta`),
  ADD KEY `fkidx_encuesta_idx` (`id_encuesta`),
  ADD KEY `fkidx_preguntas_idx` (`id_preguntas`),
  ADD KEY `fkidx_calificacion_idx` (`id_calificacion`);

--
-- Indices de la tabla `seguimiento_solicitud`
--
ALTER TABLE `seguimiento_solicitud`
  ADD PRIMARY KEY (`id_seguimiento`),
  ADD KEY `idx_solicitud_fk_idx` (`id_solicitud`),
  ADD KEY `idx_estado_fk_idx` (`id_estado`);

--
-- Indices de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD KEY `id_user_idx_idx` (`user_id`),
  ADD KEY `id_tiposolicitud_idx_idx` (`id_tiposolicitud`);

--
-- Indices de la tabla `tipo_solicitud`
--
ALTER TABLE `tipo_solicitud`
  ADD PRIMARY KEY (`id_tiposolicitud`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `id_calificacion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id_contacto` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  MODIFY `id_encuesta` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id_preguntas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `preguntas_encuesta`
--
ALTER TABLE `preguntas_encuesta`
  MODIFY `id_preguntas_encuesta` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `seguimiento_solicitud`
--
ALTER TABLE `seguimiento_solicitud`
  MODIFY `id_seguimiento` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  MODIFY `id_solicitud` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `tipo_solicitud`
--
ALTER TABLE `tipo_solicitud`
  MODIFY `id_tiposolicitud` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index',AUTO_INCREMENT=84;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD CONSTRAINT `usuario_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `id_contacto_idx` FOREIGN KEY (`id_contacto`) REFERENCES `contacto` (`id_contacto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `preguntas_encuesta`
--
ALTER TABLE `preguntas_encuesta`
  ADD CONSTRAINT `fkidx_calificacion` FOREIGN KEY (`id_calificacion`) REFERENCES `calificacion` (`id_calificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fkidx_encuesta` FOREIGN KEY (`id_encuesta`) REFERENCES `encuesta` (`id_encuesta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fkidx_preguntas` FOREIGN KEY (`id_preguntas`) REFERENCES `preguntas` (`id_preguntas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `seguimiento_solicitud`
--
ALTER TABLE `seguimiento_solicitud`
  ADD CONSTRAINT `idx_estado_fk` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idx_solicitud_fk` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud` (`id_solicitud`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD CONSTRAINT `id_tiposolicitud_idx` FOREIGN KEY (`id_tiposolicitud`) REFERENCES `tipo_solicitud` (`id_tiposolicitud`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_user_idx` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
