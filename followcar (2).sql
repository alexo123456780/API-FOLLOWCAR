-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2024 a las 02:07:07
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
-- Base de datos: `followcar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriasinventario`
--

CREATE TABLE `categoriasinventario` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` longtext DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriasservicio`
--

CREATE TABLE `categoriasservicio` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` longtext DEFAULT NULL,
  `Icono` varchar(50) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `Id` int(11) NOT NULL,
  `ClienteId` int(11) NOT NULL,
  `VehiculoId` int(11) NOT NULL,
  `TipoServicioId` int(11) NOT NULL,
  `MecanicoId` int(11) DEFAULT NULL,
  `FechaHora` datetime(6) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  `MotivoCancelacion` longtext DEFAULT NULL,
  `ObservacionesCliente` longtext DEFAULT NULL,
  `ObservacionesInternas` longtext DEFAULT NULL,
  `Prioridad` varchar(10) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizaciones`
--

CREATE TABLE `cotizaciones` (
  `Id` int(11) NOT NULL,
  `DiagnosticoId` int(11) NOT NULL,
  `NumeroCotizacion` varchar(20) NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL,
  `IVA` decimal(10,2) NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `MotivoRechazo` longtext DEFAULT NULL,
  `FechaAprobacion` datetime(6) DEFAULT NULL,
  `FechaExpiracion` datetime(6) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallescotizacion`
--

CREATE TABLE `detallescotizacion` (
  `Id` int(11) NOT NULL,
  `CotizacionId` int(11) NOT NULL,
  `Tipo` varchar(10) NOT NULL,
  `PiezaId` int(11) DEFAULT NULL,
  `ServicioId` int(11) DEFAULT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `PrecioUnitario` decimal(10,2) NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL,
  `Notas` longtext DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnosticos`
--

CREATE TABLE `diagnosticos` (
  `Id` int(11) NOT NULL,
  `CitaId` int(11) NOT NULL,
  `MecanicoId` int(11) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `DescripcionProblema` longtext NOT NULL,
  `DiagnosticoDetallado` longtext DEFAULT NULL,
  `Recomendaciones` longtext DEFAULT NULL,
  `FechaInicio` datetime(6) DEFAULT NULL,
  `FechaFin` datetime(6) DEFAULT NULL,
  `FotosEvidencia` longtext DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentosvehiculo`
--

CREATE TABLE `documentosvehiculo` (
  `Id` int(11) NOT NULL,
  `VehiculoId` int(11) NOT NULL,
  `Tipo` varchar(20) NOT NULL,
  `ArchivoUrl` varchar(255) NOT NULL,
  `FechaVencimiento` datetime(6) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` longtext DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `Id` int(11) NOT NULL,
  `CotizacionId` int(11) NOT NULL,
  `NumeroFactura` varchar(20) NOT NULL,
  `FechaEmision` datetime(6) NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL,
  `IVA` decimal(10,2) NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `MetodoPago` varchar(20) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `Notas` longtext DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarios`
--

CREATE TABLE `inventarios` (
  `Id` int(11) NOT NULL,
  `CategoriaId` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` longtext NOT NULL,
  `SKU` varchar(50) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `PrecioCompra` decimal(10,2) NOT NULL,
  `PrecioVenta` decimal(10,2) NOT NULL,
  `PuntoReorden` int(11) NOT NULL,
  `ImagenUrl` varchar(255) DEFAULT NULL,
  `Ubicacion` longtext DEFAULT NULL,
  `Estado` varchar(20) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mecanicoespecialidades`
--

CREATE TABLE `mecanicoespecialidades` (
  `Id` int(11) NOT NULL,
  `MecanicoId` int(11) NOT NULL,
  `EspecialidadId` int(11) NOT NULL,
  `NivelExperiencia` int(11) NOT NULL,
  `FechaCertificacion` datetime(6) DEFAULT NULL,
  `NumeroCertificado` longtext DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `Id` int(11) NOT NULL,
  `RemitenteId` int(11) NOT NULL,
  `DestinatarioId` int(11) NOT NULL,
  `Contenido` longtext NOT NULL,
  `FechaEnvio` datetime(6) NOT NULL,
  `FechaLectura` datetime(6) DEFAULT NULL,
  `Estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientosinventario`
--

CREATE TABLE `movimientosinventario` (
  `Id` int(11) NOT NULL,
  `ArticuloId` int(11) NOT NULL,
  `TipoMovimiento` varchar(20) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `UsuarioId` int(11) DEFAULT NULL,
  `CitaId` int(11) DEFAULT NULL,
  `FechaMovimiento` datetime(6) NOT NULL,
  `Motivo` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `Id` int(11) NOT NULL,
  `UsuarioId` int(11) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `Contenido` longtext NOT NULL,
  `FechaEnvio` datetime(6) NOT NULL,
  `FechaLectura` datetime(6) DEFAULT NULL,
  `Estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `Id` int(11) NOT NULL,
  `FacturaId` int(11) NOT NULL,
  `Monto` decimal(10,2) NOT NULL,
  `FechaPago` datetime(6) NOT NULL,
  `MetodoPago` varchar(50) NOT NULL,
  `NumeroReferencia` varchar(100) DEFAULT NULL,
  `Estado` varchar(20) NOT NULL,
  `Notas` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` longtext DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`Id`, `Nombre`, `Descripcion`, `CreatedAt`) VALUES
(3, 'Ariel', 'Usuario Frecuente', '2024-11-30 03:40:41.630000'),
(4, 'string', 'string', '2024-12-01 00:51:59.670000'),
(5, 'string', 'string', '2024-12-01 00:51:59.670000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposservicio`
--

CREATE TABLE `tiposservicio` (
  `Id` int(11) NOT NULL,
  `CategoriaId` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` longtext NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `DuracionEstimada` int(11) NOT NULL,
  `IconoUrl` varchar(255) DEFAULT NULL,
  `Estado` varchar(20) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `RolId` int(11) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Direccion` longtext DEFAULT NULL,
  `DNI` varchar(20) DEFAULT NULL,
  `FechaNacimiento` datetime(6) DEFAULT NULL,
  `FotoUrl` varchar(255) DEFAULT NULL,
  `Estado` varchar(20) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Id`, `Nombre`, `Apellido`, `Email`, `Password`, `RolId`, `Telefono`, `Direccion`, `DNI`, `FechaNacimiento`, `FotoUrl`, `Estado`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'Ariel', 'Martinez', 'Ariel123@gmail.com', '12345678', 3, '9993245789', 'serapio rendon', '331', '2005-11-30 03:40:41.630000', 'foto.url', 'activo', '2024-11-30 03:40:41.630000', '2024-11-30 03:40:41.630000'),
(3, 'Edson', 'De la Cruz', 'user@example.com', 'string', 5, 'string', 'string', 'string', '2024-12-01 00:51:59.670000', 'string', 'string', '2024-12-01 00:51:59.670000', '2024-12-01 00:51:59.670000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `Id` int(11) NOT NULL,
  `PropietarioId` int(11) NOT NULL,
  `Marca` varchar(50) NOT NULL,
  `Modelo` varchar(50) NOT NULL,
  `Anio` int(11) NOT NULL,
  `NumeroPlaca` varchar(20) NOT NULL,
  `VIN` varchar(17) NOT NULL,
  `Color` varchar(50) DEFAULT NULL,
  `Tipo` longtext DEFAULT NULL,
  `Transmision` longtext DEFAULT NULL,
  `Combustible` longtext DEFAULT NULL,
  `Kilometraje` int(11) DEFAULT NULL,
  `FotoUrl` varchar(255) DEFAULT NULL,
  `Estado` varchar(20) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20241130033741_InitialCreate', '7.0.14');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoriasinventario`
--
ALTER TABLE `categoriasinventario`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `categoriasservicio`
--
ALTER TABLE `categoriasservicio`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Citas_ClienteId` (`ClienteId`),
  ADD KEY `IX_Citas_MecanicoId` (`MecanicoId`),
  ADD KEY `IX_Citas_TipoServicioId` (`TipoServicioId`),
  ADD KEY `IX_Citas_VehiculoId` (`VehiculoId`);

--
-- Indices de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Cotizaciones_DiagnosticoId` (`DiagnosticoId`);

--
-- Indices de la tabla `detallescotizacion`
--
ALTER TABLE `detallescotizacion`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_DetallesCotizacion_CotizacionId` (`CotizacionId`),
  ADD KEY `IX_DetallesCotizacion_PiezaId` (`PiezaId`),
  ADD KEY `IX_DetallesCotizacion_ServicioId` (`ServicioId`);

--
-- Indices de la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Diagnosticos_CitaId` (`CitaId`),
  ADD KEY `IX_Diagnosticos_MecanicoId` (`MecanicoId`);

--
-- Indices de la tabla `documentosvehiculo`
--
ALTER TABLE `documentosvehiculo`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_DocumentosVehiculo_VehiculoId` (`VehiculoId`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Facturas_CotizacionId` (`CotizacionId`);

--
-- Indices de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Inventarios_CategoriaId` (`CategoriaId`);

--
-- Indices de la tabla `mecanicoespecialidades`
--
ALTER TABLE `mecanicoespecialidades`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_MecanicoEspecialidades_EspecialidadId` (`EspecialidadId`),
  ADD KEY `IX_MecanicoEspecialidades_MecanicoId` (`MecanicoId`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Mensajes_DestinatarioId` (`DestinatarioId`),
  ADD KEY `IX_Mensajes_RemitenteId` (`RemitenteId`);

--
-- Indices de la tabla `movimientosinventario`
--
ALTER TABLE `movimientosinventario`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_MovimientosInventario_ArticuloId` (`ArticuloId`),
  ADD KEY `IX_MovimientosInventario_CitaId` (`CitaId`),
  ADD KEY `IX_MovimientosInventario_UsuarioId` (`UsuarioId`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Notificaciones_UsuarioId` (`UsuarioId`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Pagos_FacturaId` (`FacturaId`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `tiposservicio`
--
ALTER TABLE `tiposservicio`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_TiposServicio_CategoriaId` (`CategoriaId`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Usuarios_RolId` (`RolId`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Vehiculos_PropietarioId` (`PropietarioId`);

--
-- Indices de la tabla `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoriasinventario`
--
ALTER TABLE `categoriasinventario`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoriasservicio`
--
ALTER TABLE `categoriasservicio`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallescotizacion`
--
ALTER TABLE `detallescotizacion`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentosvehiculo`
--
ALTER TABLE `documentosvehiculo`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mecanicoespecialidades`
--
ALTER TABLE `mecanicoespecialidades`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientosinventario`
--
ALTER TABLE `movimientosinventario`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tiposservicio`
--
ALTER TABLE `tiposservicio`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `FK_Citas_TiposServicio_TipoServicioId` FOREIGN KEY (`TipoServicioId`) REFERENCES `tiposservicio` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Citas_Usuarios_ClienteId` FOREIGN KEY (`ClienteId`) REFERENCES `usuarios` (`Id`),
  ADD CONSTRAINT `FK_Citas_Usuarios_MecanicoId` FOREIGN KEY (`MecanicoId`) REFERENCES `usuarios` (`Id`),
  ADD CONSTRAINT `FK_Citas_Vehiculos_VehiculoId` FOREIGN KEY (`VehiculoId`) REFERENCES `vehiculos` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD CONSTRAINT `FK_Cotizaciones_Diagnosticos_DiagnosticoId` FOREIGN KEY (`DiagnosticoId`) REFERENCES `diagnosticos` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detallescotizacion`
--
ALTER TABLE `detallescotizacion`
  ADD CONSTRAINT `FK_DetallesCotizacion_Cotizaciones_CotizacionId` FOREIGN KEY (`CotizacionId`) REFERENCES `cotizaciones` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DetallesCotizacion_Inventarios_PiezaId` FOREIGN KEY (`PiezaId`) REFERENCES `inventarios` (`Id`),
  ADD CONSTRAINT `FK_DetallesCotizacion_TiposServicio_ServicioId` FOREIGN KEY (`ServicioId`) REFERENCES `tiposservicio` (`Id`);

--
-- Filtros para la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  ADD CONSTRAINT `FK_Diagnosticos_Citas_CitaId` FOREIGN KEY (`CitaId`) REFERENCES `citas` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Diagnosticos_Usuarios_MecanicoId` FOREIGN KEY (`MecanicoId`) REFERENCES `usuarios` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `documentosvehiculo`
--
ALTER TABLE `documentosvehiculo`
  ADD CONSTRAINT `FK_DocumentosVehiculo_Vehiculos_VehiculoId` FOREIGN KEY (`VehiculoId`) REFERENCES `vehiculos` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `FK_Facturas_Cotizaciones_CotizacionId` FOREIGN KEY (`CotizacionId`) REFERENCES `cotizaciones` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD CONSTRAINT `FK_Inventarios_CategoriasInventario_CategoriaId` FOREIGN KEY (`CategoriaId`) REFERENCES `categoriasinventario` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `mecanicoespecialidades`
--
ALTER TABLE `mecanicoespecialidades`
  ADD CONSTRAINT `FK_MecanicoEspecialidades_Especialidades_EspecialidadId` FOREIGN KEY (`EspecialidadId`) REFERENCES `especialidades` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_MecanicoEspecialidades_Usuarios_MecanicoId` FOREIGN KEY (`MecanicoId`) REFERENCES `usuarios` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `FK_Mensajes_Usuarios_DestinatarioId` FOREIGN KEY (`DestinatarioId`) REFERENCES `usuarios` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Mensajes_Usuarios_RemitenteId` FOREIGN KEY (`RemitenteId`) REFERENCES `usuarios` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `movimientosinventario`
--
ALTER TABLE `movimientosinventario`
  ADD CONSTRAINT `FK_MovimientosInventario_Citas_CitaId` FOREIGN KEY (`CitaId`) REFERENCES `citas` (`Id`),
  ADD CONSTRAINT `FK_MovimientosInventario_Inventarios_ArticuloId` FOREIGN KEY (`ArticuloId`) REFERENCES `inventarios` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_MovimientosInventario_Usuarios_UsuarioId` FOREIGN KEY (`UsuarioId`) REFERENCES `usuarios` (`Id`);

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `FK_Notificaciones_Usuarios_UsuarioId` FOREIGN KEY (`UsuarioId`) REFERENCES `usuarios` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `FK_Pagos_Facturas_FacturaId` FOREIGN KEY (`FacturaId`) REFERENCES `facturas` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tiposservicio`
--
ALTER TABLE `tiposservicio`
  ADD CONSTRAINT `FK_TiposServicio_CategoriasServicio_CategoriaId` FOREIGN KEY (`CategoriaId`) REFERENCES `categoriasservicio` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `FK_Usuarios_Roles_RolId` FOREIGN KEY (`RolId`) REFERENCES `roles` (`Id`);

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `FK_Vehiculos_Usuarios_PropietarioId` FOREIGN KEY (`PropietarioId`) REFERENCES `usuarios` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
