/*
SQLyog Community v12.09 (64 bit)
MySQL - 5.6.13 : Database - sigmacall
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sigmacall` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sigmacall`;

/*Table structure for table `cat_calendarios` */

DROP TABLE IF EXISTS `cat_calendarios`;

CREATE TABLE `cat_calendarios` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `anyo` int(4) DEFAULT NULL COMMENT 'Año del calendario',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Calendarios';

/*Table structure for table `cat_correos` */

DROP TABLE IF EXISTS `cat_correos`;

CREATE TABLE `cat_correos` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `nombre` varchar(60) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `para` varchar(2000) DEFAULT NULL COMMENT 'Lista de distribución',
  `copia` varchar(2000) DEFAULT NULL COMMENT 'Lista de distribución (con copia)',
  `oculta` varchar(2000) DEFAULT NULL COMMENT 'Lista de distribución (con copia oculta)',
  `titulo` varchar(200) DEFAULT NULL COMMENT 'Título del correo',
  `cuerpo` varchar(1000) DEFAULT NULL COMMENT 'Cuerpo del correo',
  `reportes` varchar(100) DEFAULT NULL COMMENT 'Lista de reportes',
  `periodos` varchar(100) DEFAULT NULL COMMENT 'Períodos para generarlo',
  `nperiodos` varchar(100) DEFAULT NULL COMMENT 'Número de períodos',
  `frecuencia` varchar(20) DEFAULT NULL COMMENT 'Frecuencia de envío',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Catálogo de correos';

/*Table structure for table `cat_defectos` */

DROP TABLE IF EXISTS `cat_defectos`;

CREATE TABLE `cat_defectos` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(20) DEFAULT NULL COMMENT 'Referencia',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del defecto',
  `prefijo` varchar(30) DEFAULT NULL COMMENT 'Prefijo de la descripción',
  `agrupador1` bigint(11) DEFAULT NULL COMMENT 'ID del agrupador (1)',
  `agrupador2` bigint(11) DEFAULT NULL COMMENT 'ID del agrupador (2)',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `minimo` decimal(17,7) DEFAULT NULL COMMENT 'Minima cantidad a reportar',
  `maximo` decimal(17,7) DEFAULT NULL COMMENT 'Maxima cantidad a reportar',
  `defecto` char(1) DEFAULT NULL COMMENT 'Registro por defecto',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Catálogo de defectos';

/*Table structure for table `cat_distribucion` */

DROP TABLE IF EXISTS `cat_distribucion`;

CREATE TABLE `cat_distribucion` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia',
  `nombre` varchar(60) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `prefijo` varchar(30) DEFAULT NULL COMMENT 'Prefijo del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `telefonos` varchar(2000) DEFAULT NULL COMMENT 'Número de teléfono',
  `correos` varchar(2000) DEFAULT NULL COMMENT 'Correo electrónico',
  `mmcall` varchar(2000) DEFAULT NULL COMMENT 'Requesters de MMCall',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COMMENT='Catálogo de listas de distribución';

/*Table structure for table `cat_equipos` */

DROP TABLE IF EXISTS `cat_equipos`;

CREATE TABLE `cat_equipos` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(20) DEFAULT NULL COMMENT 'Referencia',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `prefijo` varchar(30) DEFAULT NULL COMMENT 'Prefijo del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `agrupador1` bigint(11) DEFAULT NULL COMMENT 'ID del agrupador (1)',
  `agrupador2` bigint(11) DEFAULT NULL COMMENT 'ID del agrupador (2)',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Catálogo de equipos';

/*Table structure for table `cat_estaciones` */

DROP TABLE IF EXISTS `cat_estaciones`;

CREATE TABLE `cat_estaciones` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Catálogo de estaciones';

/*Table structure for table `cat_generales` */

DROP TABLE IF EXISTS `cat_generales`;

CREATE TABLE `cat_generales` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `tabla` int(6) DEFAULT NULL COMMENT 'ID de la tabla',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `prefijo` varchar(30) DEFAULT NULL COMMENT 'Prefijo del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Tablas generales';

/*Table structure for table `cat_grupos` */

DROP TABLE IF EXISTS `cat_grupos`;

CREATE TABLE `cat_grupos` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(20) DEFAULT NULL COMMENT 'Referencia',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `prefijo` varchar(30) DEFAULT NULL COMMENT 'Prefijo del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `agrupador1` bigint(11) DEFAULT NULL COMMENT 'ID del agrupador (1)',
  `agrupador2` bigint(11) DEFAULT NULL COMMENT 'ID del agrupador (2)',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Catálogo de grupos';

/*Table structure for table `cat_listas` */

DROP TABLE IF EXISTS `cat_listas`;

CREATE TABLE `cat_listas` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(20) DEFAULT NULL COMMENT 'Referencia',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `prefijo` varchar(30) DEFAULT NULL COMMENT 'Prefijo del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `clase` bigint(11) DEFAULT NULL COMMENT 'ID de la clase',
  `area` bigint(11) DEFAULT NULL COMMENT 'ID del área',
  `equipo` bigint(11) DEFAULT NULL COMMENT 'ID del equipo',
  `tiempo_llenado` bigint(6) DEFAULT NULL COMMENT 'Tiempo límite para el llenado (segundos)',
  `tiempo_alarma` char(1) DEFAULT NULL COMMENT 'Generar alarma al sobrepasar el límite por',
  `prioridad` int(2) DEFAULT NULL COMMENT 'Prioridad del registro',
  `horario` bigint(11) DEFAULT NULL COMMENT 'Calendario',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` timestamp NULL DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Catálogo de listas de verificación';

/*Table structure for table `cat_medios` */

DROP TABLE IF EXISTS `cat_medios`;

CREATE TABLE `cat_medios` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `tipo` int(4) DEFAULT NULL COMMENT 'Tipo de comunicaión',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` timestamp NULL DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='Catálogo de medios de envío';

/*Table structure for table `cat_paros` */

DROP TABLE IF EXISTS `cat_paros`;

CREATE TABLE `cat_paros` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(20) DEFAULT NULL COMMENT 'Referencia',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `tipo` bigint(11) DEFAULT NULL COMMENT 'Tipo de paro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `agrupador1` bigint(11) DEFAULT NULL COMMENT 'ID del agrupador (1)',
  `agrupador2` bigint(11) DEFAULT NULL COMMENT 'ID del agrupador (2)',
  `adelantar` char(1) DEFAULT NULL COMMENT 'Se puede adelantar?',
  `cancelar` char(1) DEFAULT NULL COMMENT 'Se puede cancelar?',
  `con_clave` char(1) DEFAULT NULL COMMENT 'Se puede cabiar con clave',
  `una_vez` char(1) DEFAULT NULL COMMENT 'Paro de una vez',
  `periodico` char(1) DEFAULT NULL COMMENT 'Es un paro periódico',
  `semana` char(7) DEFAULT NULL COMMENT 'Día de semana',
  `habiles` char(1) DEFAULT NULL COMMENT 'Se aplica en día no hábiles',
  `desde` time DEFAULT NULL COMMENT 'Hora de inicio',
  `hasta` time DEFAULT NULL COMMENT 'Hora de fin',
  `inicia` date DEFAULT NULL COMMENT 'Fecha de inicio',
  `finaliza` date DEFAULT NULL COMMENT 'Fecha de finalización',
  `tiempo_seg` bigint(11) DEFAULT NULL COMMENT 'Tiempo del pago en segundos',
  `clendario` bigint(11) DEFAULT NULL COMMENT 'ID del calenadario',
  `carpeta` varchar(255) DEFAULT NULL COMMENT 'Carpeta de imagenes y videos',
  `defecto` char(1) DEFAULT NULL COMMENT 'Registro por defecto',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Catálogo de paros';

/*Table structure for table `cat_usuarios` */

DROP TABLE IF EXISTS `cat_usuarios`;

CREATE TABLE `cat_usuarios` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(50) DEFAULT NULL COMMENT 'Referencia',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `clave` varchar(30) DEFAULT NULL COMMENT 'Conraseña',
  `prefijo` varchar(30) DEFAULT NULL COMMENT 'Prefijo del registro',
  `notas` varchar(100) DEFAULT NULL COMMENT 'Notas varias',
  `rol` char(1) DEFAULT NULL COMMENT 'Rol de usuario',
  `politica` int(2) DEFAULT NULL COMMENT 'Política de contraseña',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `admin` char(1) DEFAULT NULL COMMENT 'Es administrador',
  `cerrar_al_ejecutar` char(1) DEFAULT NULL COMMENT 'Cerrar menú al ajecutar',
  `vista_resumida_fallas` char(1) DEFAULT NULL COMMENT 'Vista resumida de las fallas',
  `ultima_pantalla` int(2) DEFAULT NULL COMMENT 'Última pantalla usada',
  `inicializada` char(1) DEFAULT NULL COMMENT 'Contraseña inicializada',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COMMENT='Catalogo de usuarios';

/*Table structure for table `cat_variables` */

DROP TABLE IF EXISTS `cat_variables`;

CREATE TABLE `cat_variables` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `referencia` varchar(20) DEFAULT NULL COMMENT 'Referencia del registro',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Descripción del registro',
  `prefijo` varchar(30) DEFAULT NULL COMMENT 'Prefijo del registro',
  `requerido` char(1) DEFAULT NULL COMMENT 'Campo requerido',
  `notas` varchar(500) DEFAULT NULL COMMENT 'Notas de la variable',
  `tipo` int(2) DEFAULT NULL COMMENT 'Tipo de valor (10=numérico, 20=Si/NO, 30=Tabla)',
  `idtabla` bigint(11) DEFAULT NULL COMMENT 'ID de la tabla',
  `unidad` bigint(11) DEFAULT NULL COMMENT 'ID de la unidad de medida',
  `permitido_min` decimal(30,10) DEFAULT NULL COMMENT 'Valor mínimo',
  `permitido_max` decimal(30,10) DEFAULT NULL COMMENT 'Valor máximo',
  `alarma_min` decimal(30,10) DEFAULT NULL COMMENT 'Valor mínimo para generar alarma',
  `alarma_max` decimal(30,10) DEFAULT NULL COMMENT 'Valor máximo para generar alarma',
  `alarma_clave` char(1) DEFAULT NULL COMMENT 'Valor fuera de rango requiere clave',
  `alarma_sino` char(1) DEFAULT NULL COMMENT 'Alarmar Si/No',
  `color` varchar(20) DEFAULT NULL COMMENT 'Color de fondo',
  `acumular` char(1) DEFAULT NULL COMMENT 'Acumular',
  `resaltada` char(1) DEFAULT NULL COMMENT 'Resaltar variable',
  `mostrar_rango` char(1) DEFAULT NULL COMMENT 'Mostrar rango en pantalla',
  `confirmar_respuesta` char(1) DEFAULT NULL COMMENT 'Confirmar la respuesta',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha en que se agregó',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha en que se modificó',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Usuario que agregó',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Usuario que modificó',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `consultas_det` */

DROP TABLE IF EXISTS `consultas_det`;

CREATE TABLE `consultas_det` (
  `consulta` bigint(11) DEFAULT NULL COMMENT 'ID de la consulta',
  `tabla` int(6) DEFAULT NULL COMMENT 'ID de la tabla',
  `valor` bigint(11) DEFAULT NULL COMMENT 'ID del valor',
  KEY `NewIndex1` (`consulta`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Detalle de la consulta';

/*Table structure for table `control_listas` */

DROP TABLE IF EXISTS `control_listas`;

CREATE TABLE `control_listas` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `lista` bigint(11) DEFAULT NULL COMMENT 'ID de la lista',
  `maestro` bigint(11) DEFAULT NULL COMMENT 'ID del maestro de listas',
  `cierre` datetime DEFAULT NULL COMMENT 'Fecha y hora de cierre',
  `usuario` bigint(11) DEFAULT NULL COMMENT 'ID del usuario',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Control de listas de verificacion';

/*Table structure for table `defectos` */

DROP TABLE IF EXISTS `defectos`;

CREATE TABLE `defectos` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `defecto` bigint(11) DEFAULT NULL COMMENT 'ID del defecto',
  `retrabajo` char(1) DEFAULT NULL COMMENT 'Se retrabajaron',
  `automatico` char(1) DEFAULT NULL COMMENT 'El defecto fue automático',
  `equipo` bigint(11) DEFAULT NULL COMMENT 'ID del equipo',
  `turno` bigint(11) DEFAULT NULL COMMENT 'ID del turno',
  `tripulacion` bigint(11) DEFAULT NULL COMMENT 'ID de la tripulación',
  `orden` bigint(11) DEFAULT NULL COMMENT 'ID de la orden de producción',
  `material` bigint(11) DEFAULT NULL COMMENT 'ID del material',
  `fecha` datetime DEFAULT NULL COMMENT 'Fecha de registro',
  `cantidad` decimal(17,7) DEFAULT NULL COMMENT 'Cantidad de piezas defectuosas',
  `comentarios` varchar(1000) DEFAULT NULL COMMENT 'Comentarios del sistema',
  `atendido` char(1) DEFAULT NULL COMMENT 'El paro fue atendido?',
  `clasificado_por` bigint(11) DEFAULT NULL COMMENT 'Usuario que clasificó el paro',
  `clasificado_fecha` datetime DEFAULT NULL COMMENT 'Fecha de la clasificación',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Defectos sucedidos';

/*Table structure for table `det_calendario` */

DROP TABLE IF EXISTS `det_calendario`;

CREATE TABLE `det_calendario` (
  `calendario` bigint(11) NOT NULL COMMENT 'ID del calendaro',
  `fecha` date NOT NULL COMMENT 'Fecha',
  `descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripción',
  `imagen` varchar(100) DEFAULT NULL COMMENT 'Imagen',
  PRIMARY KEY (`calendario`,`fecha`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Detalle del calendario';

/*Table structure for table `det_correo` */

DROP TABLE IF EXISTS `det_correo`;

CREATE TABLE `det_correo` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `correo` bigint(11) NOT NULL COMMENT 'ID del correo',
  `secuencia` int(4) NOT NULL COMMENT 'Línea en la lista',
  `reporte` bigint(8) DEFAULT NULL COMMENT 'ID del reporte',
  `lapso` int(2) DEFAULT NULL COMMENT 'Lapso a evaluar',
  `periodo` int(2) DEFAULT NULL COMMENT 'Tipo de período',
  `periodosatras` bigint(8) DEFAULT NULL COMMENT 'Número de períodos atrás',
  PRIMARY KEY (`id`,`correo`,`secuencia`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Detalle del correo (reportes)';

/*Table structure for table `det_correo_horario` */

DROP TABLE IF EXISTS `det_correo_horario`;

CREATE TABLE `det_correo_horario` (
  `correo` bigint(11) NOT NULL COMMENT 'ID del correo',
  `secuencia` int(4) NOT NULL COMMENT 'Línea en la lista',
  `semana` char(7) DEFAULT NULL COMMENT 'ID del reporte',
  `diames` varchar(100) DEFAULT NULL COMMENT 'Segundos atrás',
  `hora` varchar(50) DEFAULT NULL COMMENT 'Período',
  PRIMARY KEY (`correo`,`secuencia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Horarios de envío';

/*Table structure for table `det_distribucion` */

DROP TABLE IF EXISTS `det_distribucion`;

CREATE TABLE `det_distribucion` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `distribucion` bigint(11) NOT NULL COMMENT 'ID de la lista de distribución',
  `orden` int(4) NOT NULL COMMENT 'Línea en la lista',
  `tipo` int(2) DEFAULT NULL COMMENT 'Tipo de lista (0: Móvil-Llamada, 10: Móvil-SMS, 30: Móvil-LLamada y SMS, 40: Correo electrónico, 50: Ärea de MMCall)',
  `cadena` varchar(255) DEFAULT NULL COMMENT 'Cadena',
  `alias` varchar(30) DEFAULT NULL COMMENT 'Alias',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus',
  PRIMARY KEY (`id`,`distribucion`,`orden`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=latin1 COMMENT='Detalle de la lista de distribucón';

/*Table structure for table `det_estacion` */

DROP TABLE IF EXISTS `det_estacion`;

CREATE TABLE `det_estacion` (
  `estacion` bigint(11) NOT NULL COMMENT 'ID de la estación',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `equipo` bigint(11) NOT NULL COMMENT 'ID del equipo',
  PRIMARY KEY (`estacion`,`equipo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Detalle de las estaciones';

/*Table structure for table `det_lista` */

DROP TABLE IF EXISTS `det_lista`;

CREATE TABLE `det_lista` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `lista` bigint(11) NOT NULL COMMENT 'ID de la lista',
  `variable` bigint(11) NOT NULL COMMENT 'ID de la variable',
  `orden` int(4) DEFAULT NULL COMMENT 'Orden en la lista',
  `deorigen` char(1) DEFAULT NULL COMMENT 'Tomar los datos de origen',
  `requerido` char(1) DEFAULT NULL COMMENT 'Campo requerido',
  `notas` varchar(500) DEFAULT NULL COMMENT 'Notas de la variable',
  `tipo` int(2) DEFAULT NULL COMMENT 'Tipo de valor (10=numérico, 20=Si/NO, 30=Tabla)',
  `tabla` char(1) DEFAULT NULL COMMENT 'Tomar valor de una tabla',
  `idtabla` bigint(11) DEFAULT NULL COMMENT 'ID de la tabla',
  `unidad` bigint(11) DEFAULT NULL COMMENT 'ID de la unidad de medida',
  `permitido_min` decimal(30,10) DEFAULT NULL COMMENT 'Valor mínimo',
  `permitido_max` decimal(30,10) DEFAULT NULL COMMENT 'Valor máximo',
  `alarma_min` decimal(30,10) DEFAULT NULL COMMENT 'Valor mínimo para generar alarma',
  `alarma_max` decimal(30,10) DEFAULT NULL COMMENT 'Valor máximo para generar alarma',
  `alarma_supervision` char(1) DEFAULT NULL COMMENT 'Requiere supervisión',
  `alarma_regla` char(1) DEFAULT NULL COMMENT 'Requiere regla',
  `alarma_sino` char(1) DEFAULT NULL COMMENT 'Alarma Si/No',
  `color` varchar(20) DEFAULT NULL COMMENT 'Color de fondo',
  `resaltada` char(1) DEFAULT NULL COMMENT 'Resaltar variable',
  `mostrar_rango` char(1) DEFAULT NULL COMMENT 'Mostrar rango en pantalla',
  `confirmar_respuesta` char(1) DEFAULT NULL COMMENT 'Confirmar la respuesta',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha en que se agregó',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha en que se modificó',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Usuario que agregó',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Usuario que modificó',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`lista`,`variable`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Detalle de listas de verificación';

/*Table structure for table `det_regla` */

DROP TABLE IF EXISTS `det_regla`;

CREATE TABLE `det_regla` (
  `lista` bigint(11) DEFAULT NULL COMMENT 'ID de la lista',
  `variable` bigint(11) DEFAULT NULL COMMENT 'ID de la variable',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `periodo` int(2) DEFAULT NULL COMMENT 'período',
  `acumulado` int(4) DEFAULT NULL COMMENT 'Acumulado',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  KEY `NewIndex1` (`lista`),
  KEY `NewIndex2` (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Reglas de acumulación';

/*Table structure for table `estimados` */

DROP TABLE IF EXISTS `estimados`;

CREATE TABLE `estimados` (
  `equipo` bigint(11) DEFAULT NULL COMMENT 'ID del equipo',
  `anio` int(4) DEFAULT NULL COMMENT 'Año del estimado',
  `semana` int(2) DEFAULT NULL COMMENT 'Semana del estimado',
  `oee_minimo` decimal(10,5) DEFAULT NULL COMMENT 'Mínimo de OEE',
  `oee_maximo` decimal(10,5) DEFAULT NULL COMMENT 'Máximo de OEE',
  `ftq_minimo` decimal(10,5) DEFAULT NULL COMMENT 'Mínimo de FTQ',
  `ftq_maximo` decimal(10,5) DEFAULT NULL COMMENT 'Máximo de FTQ',
  `efi_minimo` decimal(10,5) DEFAULT NULL COMMENT 'Mínimo de Eficiencia',
  `efi_maximo` decimal(10,5) DEFAULT NULL COMMENT 'Máximo de Eficiencia',
  `dis_minimo` decimal(10,5) DEFAULT NULL COMMENT 'Mínimo de Disponibilidad',
  `dis_maximo` decimal(10,5) DEFAULT NULL COMMENT 'Máximo de Disponibilidad',
  UNIQUE KEY `NewIndex1` (`equipo`,`anio`,`semana`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Estimado de cumplimiento por semana';

/*Table structure for table `movimientos` */

DROP TABLE IF EXISTS `movimientos`;

CREATE TABLE `movimientos` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `desde` datetime DEFAULT NULL COMMENT 'Fecha de inicio del corte',
  `hasta` datetime DEFAULT NULL COMMENT 'Fecha de fin del corte',
  `sensor` bigint(11) DEFAULT NULL COMMENT 'ID del sensor',
  `equipo` bigint(11) DEFAULT NULL COMMENT 'ID de la máquina',
  `turno` bigint(11) DEFAULT NULL COMMENT 'ID del turno',
  `tripulacon` bigint(11) DEFAULT NULL COMMENT 'ID tripulación',
  `orden` bigint(11) DEFAULT NULL COMMENT 'ID de la O/P',
  `material` bigint(11) DEFAULT NULL COMMENT 'ID del material',
  `calendario` bigint(11) DEFAULT NULL COMMENT 'ID del calendario',
  `fecha_reporte` date DEFAULT NULL COMMENT 'Fecha calendario',
  `tiempo_corte` bigint(11) DEFAULT NULL COMMENT 'Tiempo del corte (segundos)',
  `piezas_buenas` decimal(17,7) DEFAULT NULL COMMENT 'Cantidad de piezas buenas',
  `piezas_malas` decimal(17,7) DEFAULT NULL COMMENT 'Cantidad de piezas malas',
  `disp_teorica` decimal(11,0) DEFAULT NULL COMMENT 'Disponibilidad teórica (segundos)',
  `disp_real` decimal(11,0) DEFAULT NULL COMMENT 'Disponibilidad real (segundos)',
  `rate_teorico` decimal(17,7) DEFAULT NULL COMMENT 'Rate teórico',
  `rate_real` decimal(17,7) DEFAULT NULL COMMENT 'Rate real',
  `oee` decimal(10,5) DEFAULT NULL COMMENT 'OEE del corte',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha servidor en que se creó el registro',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Movimientos';

/*Table structure for table `orden` */

DROP TABLE IF EXISTS `orden`;

CREATE TABLE `orden` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de la OP',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia de la OP',
  `planta` bigint(11) DEFAULT NULL COMMENT 'Número de la planta',
  `proveedor` bigint(11) DEFAULT NULL COMMENT 'Número de proveedor',
  `numero` varchar(30) DEFAULT NULL COMMENT 'Número de la OP',
  `descripción` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción de la OP',
  `modelo` bigint(11) DEFAULT NULL COMMENT 'Modelo de la OP',
  `maquina` bigint(11) DEFAULT NULL COMMENT 'Máquina',
  `cliente` bigint(11) DEFAULT NULL COMMENT 'Número del cliente',
  `plan` decimal(15,7) DEFAULT NULL COMMENT 'Cantidad planeada',
  `entregado` decimal(15,7) DEFAULT NULL COMMENT 'Cantidad entregada',
  `acumulado` decimal(15,7) DEFAULT NULL COMMENT 'Cantidad que viene acumulada',
  `liberada` datetime DEFAULT NULL COMMENT 'Fecha de liberación',
  `cierre` datetime DEFAULT NULL COMMENT 'Fecha de cierre',
  `primera` datetime DEFAULT NULL COMMENT 'Fecha de la primera lectura',
  `ultima` datetime DEFAULT NULL COMMENT 'Fecha de la última lectura',
  `rate` decimal(15,7) DEFAULT NULL COMMENT 'Rate por hora',
  `tiempociclo` bigint(10) DEFAULT NULL COMMENT 'Tiempo ciclo en segundos',
  `parosplaneados` int(4) DEFAULT NULL COMMENT 'Total paros planeados',
  `parosnoplaneados` int(4) DEFAULT NULL COMMENT 'Total paros no planeados',
  `segundosplaneados` int(8) DEFAULT NULL COMMENT 'Segundos paros planeados',
  `segundosnoplaneados` int(8) DEFAULT NULL COMMENT 'Segundos paros no planeados',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` timestamp NULL DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` varchar(50) DEFAULT NULL COMMENT 'Creado por',
  `modificado` varchar(50) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `ordenes` */

DROP TABLE IF EXISTS `ordenes`;

CREATE TABLE `ordenes` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `referencia` varchar(30) DEFAULT NULL,
  `maquina` varchar(50) DEFAULT NULL,
  `producto` varchar(50) DEFAULT NULL,
  `plan` bigint(10) DEFAULT '0',
  `avance` bigint(10) DEFAULT '0',
  `inicio` datetime DEFAULT NULL,
  `fin` date DEFAULT NULL,
  `cierre` date DEFAULT NULL,
  `iniciaen` bigint(10) DEFAULT '0',
  `tiempo` bigint(10) DEFAULT NULL,
  `rate` decimal(15,5) DEFAULT NULL,
  `bajorate` decimal(10,2) DEFAULT NULL,
  `sobrerate` decimal(10,2) DEFAULT NULL,
  `estatus` int(2) DEFAULT '0',
  `paros` bigint(11) DEFAULT '0',
  `defectos` bigint(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COMMENT='tabla de ordenes';

/*Table structure for table `ordenes_original` */

DROP TABLE IF EXISTS `ordenes_original`;

CREATE TABLE `ordenes_original` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de la OP',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia de la OP',
  `planta` bigint(11) DEFAULT NULL COMMENT 'Número de la planta',
  `proveedor` bigint(11) DEFAULT NULL COMMENT 'Número de proveedor',
  `numero` varchar(30) DEFAULT NULL COMMENT 'Número de la OP',
  `descripción` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción de la OP',
  `modelo` bigint(11) DEFAULT NULL COMMENT 'Modelo de la OP',
  `maquina` varchar(100) DEFAULT NULL COMMENT 'Máquina',
  `cliente` bigint(11) DEFAULT NULL COMMENT 'Número del cliente',
  `plan` decimal(15,7) DEFAULT NULL COMMENT 'Cantidad planeada',
  `entregado` decimal(15,7) DEFAULT NULL COMMENT 'Cantidad entregada',
  `acumulado` decimal(15,7) DEFAULT NULL COMMENT 'Cantidad que viene acumulada',
  `liberada` datetime DEFAULT NULL COMMENT 'Fecha de liberación',
  `cierre` datetime DEFAULT NULL COMMENT 'Fecha de cierre',
  `primera` datetime DEFAULT NULL COMMENT 'Fecha de la primera lectura',
  `ultima` datetime DEFAULT NULL COMMENT 'Fecha de la última lectura',
  `rate` decimal(15,7) DEFAULT NULL COMMENT 'Rate por hora',
  `tiempociclo` bigint(10) DEFAULT NULL COMMENT 'Tiempo ciclo en segundos',
  `parosplaneados` int(4) DEFAULT NULL COMMENT 'Total paros planeados',
  `parosnoplaneados` int(4) DEFAULT NULL COMMENT 'Total paros no planeados',
  `segundosplaneados` int(8) DEFAULT NULL COMMENT 'Segundos paros planeados',
  `segundosnoplaneados` int(8) DEFAULT NULL COMMENT 'Segundos paros no planeados',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` timestamp NULL DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` varchar(50) DEFAULT NULL COMMENT 'Creado por',
  `modificado` varchar(50) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Ordenes de producción';

/*Table structure for table `paros` */

DROP TABLE IF EXISTS `paros`;

CREATE TABLE `paros` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `paro` bigint(11) DEFAULT NULL COMMENT 'ID del paro',
  `automatico` char(1) DEFAULT NULL COMMENT 'El paro fue automático',
  `equipo` bigint(11) DEFAULT NULL COMMENT 'ID del equipo',
  `turno` bigint(11) DEFAULT NULL COMMENT 'ID del turno',
  `tripulacion` bigint(11) DEFAULT NULL COMMENT 'ID de la tripulación',
  `orden` bigint(11) DEFAULT NULL COMMENT 'ID de la orden de producción',
  `material` bigint(11) DEFAULT NULL COMMENT 'ID del material',
  `inicia` datetime DEFAULT NULL COMMENT 'Fecha de inicio',
  `finaliza` datetime DEFAULT NULL COMMENT 'Fecha de fin',
  `tiempo_plan` bigint(11) DEFAULT NULL COMMENT 'Tiempo total en segundos (plan)',
  `tiempo_real` bigint(11) DEFAULT NULL COMMENT 'Tiempo total en segundos (real)',
  `adelantado` char(1) DEFAULT NULL COMMENT 'El paro se adelantó',
  `terminado_antes` char(1) DEFAULT NULL COMMENT 'El paro se canceló',
  `terminado_por` bigint(11) DEFAULT NULL COMMENT 'Usuario que terminó el paro',
  `terminado_causa` bigint(11) DEFAULT NULL COMMENT 'Causa de la cancelación',
  `terminado_fecha` datetime DEFAULT NULL COMMENT 'Fecha de la cancelación',
  `genero_otro` char(2) DEFAULT NULL COMMENT 'Generó otro paro (N/P)',
  `comentarios` varchar(1000) DEFAULT NULL COMMENT 'Comentarios del sistema',
  `atendido` char(1) DEFAULT NULL COMMENT 'El paro fue atendido?',
  `clasificado_por` bigint(11) DEFAULT NULL COMMENT 'Usuario que clasificó el paro',
  `clasificado_fecha` datetime DEFAULT NULL COMMENT 'Fecha de la clasificación',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Paros sucedidos';

/*Table structure for table `pu_graficos` */

DROP TABLE IF EXISTS `pu_graficos`;

CREATE TABLE `pu_graficos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `usuario` bigint(11) DEFAULT NULL COMMENT 'ID del usuario',
  `grafico` int(4) DEFAULT NULL COMMENT 'Número del gráfico',
  `titulo` varchar(100) DEFAULT NULL COMMENT 'Título del gráfico',
  `titulo_fuente` int(2) DEFAULT NULL COMMENT 'Fuente del título',
  `sub_titulo` varchar(100) DEFAULT NULL COMMENT 'Subtítulo del gráfico',
  `subtitulo_fuente` int(2) DEFAULT NULL COMMENT 'Fuente del subtítulo',
  `texto_x` varchar(100) DEFAULT NULL COMMENT 'Texto eje X',
  `texto_x_fuente` int(2) DEFAULT NULL COMMENT 'Fuente del eje X',
  `texto_y` varchar(100) DEFAULT '0' COMMENT 'Texto eje Y',
  `texto_y_fuente` int(2) DEFAULT NULL COMMENT 'Fuente del eje Y',
  `texto_z` varchar(50) DEFAULT '0' COMMENT 'Texto eje Z',
  `texto_z_fuente` int(2) DEFAULT NULL COMMENT 'Fuente del eje Z',
  `etiqueta_fuente` int(2) DEFAULT NULL COMMENT 'Fuente de la etiqueta',
  `etiqueta_leyenda` int(2) DEFAULT NULL COMMENT 'Fuente de la leyenda',
  `ancho` int(6) DEFAULT NULL COMMENT 'Ancho de la pantalla',
  `alto` int(6) DEFAULT '0' COMMENT 'Alto de la pantalla',
  `margen_arriba` int(4) DEFAULT NULL COMMENT 'Margen arriba',
  `margen_abajo` int(4) DEFAULT NULL COMMENT 'Margen abajo',
  `margen_izquierda` int(4) DEFAULT NULL COMMENT 'Margen izquierda',
  `margen_derecha` int(4) DEFAULT NULL COMMENT 'Margen derecha',
  `maximo_barras` int(2) DEFAULT '0' COMMENT 'Máximo de barras',
  `maximo_barraspct` int(3) DEFAULT '0' COMMENT 'PCT de máximo de barras',
  `agrupar` char(1) DEFAULT NULL COMMENT 'Agrupar el resto',
  `agrupar_alfinal` char(1) DEFAULT NULL COMMENT 'Agrupar al final',
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de actualización',
  `periodo_tipo` int(2) DEFAULT NULL COMMENT 'Tipo de período (0: segundos, 1: minutos, 2: horas, 3: días, 4: semanas, 5: meses, 6: años, 10: DTD, 11: WTD, 12: MTD, 13: YTD)',
  `periodo_atras` bigint(8) DEFAULT NULL COMMENT 'Tiempo a recorrer hacía atrás',
  `mostrar_tabla` char(1) DEFAULT NULL COMMENT 'Mostrar tabla',
  `orden` char(1) DEFAULT NULL COMMENT 'Orden de la gráfica',
  `color_fondo_barras` varchar(20) DEFAULT NULL COMMENT 'Color de fondo de las barras',
  `color_letras` varchar(20) DEFAULT NULL COMMENT 'Color de las letras',
  `color_fondo` varchar(20) DEFAULT NULL COMMENT 'Color del fondo',
  `color_leyenda` varchar(20) DEFAULT NULL COMMENT 'Color del fondo de la leyenda',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`grafico`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1 COMMENT='Preferencias de usuario (Gráficos)';

/*Table structure for table `regcab_lista` */

DROP TABLE IF EXISTS `regcab_lista`;

CREATE TABLE `regcab_lista` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `lista` bigint(11) DEFAULT NULL COMMENT 'ID de la lista',
  `clase` bigint(11) DEFAULT NULL COMMENT 'ID de la clase',
  `area` bigint(11) DEFAULT NULL COMMENT 'ID del área',
  `equipo` bigint(11) DEFAULT NULL COMMENT 'ID del equio',
  `programado` datetime DEFAULT NULL COMMENT 'Fecha y hora en que debe iniciar',
  `iniciada` datetime DEFAULT NULL COMMENT 'Fecha y hora de inicio',
  `final` datetime DEFAULT NULL COMMENT 'Fecha y hora de finalización',
  `limite` bigint(10) DEFAULT '0' COMMENT 'Límite para llenar reporte',
  `total` bigint(10) DEFAULT '0' COMMENT 'Total tiempo para el llenado reporte',
  `variables` int(4) DEFAULT '0' COMMENT 'Total variables medidas',
  `llenas` int(4) DEFAULT '0' COMMENT 'Total variables llenas',
  `prioridad` int(2) DEFAULT NULL COMMENT 'Prioridad del registro',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `abierto` bigint(11) DEFAULT NULL COMMENT 'Fecha de creación',
  `cerrado` bigint(11) DEFAULT NULL COMMENT 'Fecha de modificación',
  `autorizado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Histórico de listas';

/*Table structure for table `regdet_lista` */

DROP TABLE IF EXISTS `regdet_lista`;

CREATE TABLE `regdet_lista` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `lista` bigint(11) NOT NULL COMMENT 'ID de la lista',
  `variable` bigint(11) NOT NULL COMMENT 'ID de la variable',
  `orden` int(4) DEFAULT NULL COMMENT 'Orden en la lista',
  `valor` char(1) DEFAULT NULL COMMENT 'Tomar los datos de origen',
  `requerido` char(1) DEFAULT NULL COMMENT 'Campo requerido',
  `notas` varchar(500) DEFAULT NULL COMMENT 'Notas de la variable',
  `tabla` char(1) DEFAULT NULL COMMENT 'Tomar valor de una tabla',
  `idtabla` bigint(11) DEFAULT NULL COMMENT 'ID de la tabla',
  `unidad` bigint(11) DEFAULT NULL COMMENT 'ID de la unidad de medida',
  `permitido_min` decimal(30,10) DEFAULT NULL COMMENT 'Valor mínimo',
  `permitido_max` decimal(30,10) DEFAULT NULL COMMENT 'Valor máximo',
  `alarma_min` decimal(30,10) DEFAULT NULL COMMENT 'Valor mínimo para generar alarma',
  `alarma_max` decimal(30,10) DEFAULT NULL COMMENT 'Valor máximo para generar alarma',
  `alarma_supervision` char(1) DEFAULT NULL COMMENT 'Requiere supervisión',
  `alarma_regla` char(1) DEFAULT NULL COMMENT 'Requiere regla',
  `color` varchar(20) DEFAULT NULL COMMENT 'Color de fondo',
  `resaltada` char(1) DEFAULT NULL COMMENT 'Resaltar variable',
  `mostrar_rango` char(1) DEFAULT NULL COMMENT 'Mostrar rango en pantalla',
  `confirmar_respuesta` char(1) DEFAULT NULL COMMENT 'Confirmar la respuesta',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha en que se agregó',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha en que se modificó',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Usuario que agregó',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Usuario que modificó',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`lista`,`variable`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `relaciondefectos` */

DROP TABLE IF EXISTS `relaciondefectos`;

CREATE TABLE `relaciondefectos` (
  `defecto` bigint(11) NOT NULL COMMENT 'ID del defecto',
  `grupo` bigint(11) NOT NULL COMMENT 'ID del grupo',
  `equipo` bigint(11) NOT NULL COMMENT 'ID del equipo',
  PRIMARY KEY (`defecto`,`grupo`,`equipo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Relación defectos verss equipos';

/*Table structure for table `relacionparos` */

DROP TABLE IF EXISTS `relacionparos`;

CREATE TABLE `relacionparos` (
  `paro` bigint(11) NOT NULL COMMENT 'ID del paro',
  `grupo` bigint(11) NOT NULL COMMENT 'ID del grupo',
  `equipo` bigint(11) NOT NULL COMMENT 'ID del equipo',
  PRIMARY KEY (`paro`,`grupo`,`equipo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Relacion paros versus equips';

/*Table structure for table `secenciadosparos` */

DROP TABLE IF EXISTS `secenciadosparos`;

CREATE TABLE `secenciadosparos` (
  `padre` bigint(11) NOT NULL COMMENT 'ID del paro padre',
  `hijo` bigint(11) NOT NULL COMMENT 'ID del paro hijo',
  `secuencia` int(6) NOT NULL COMMENT 'Secuencia del paro hijo en la lista',
  `tiempo_plan` bigint(11) DEFAULT NULL COMMENT 'Tiempo del paro (en segundos)',
  PRIMARY KEY (`padre`,`hijo`,`secuencia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Secuencia de paros continuados';

/*Table structure for table `sentencias` */

DROP TABLE IF EXISTS `sentencias`;

CREATE TABLE `sentencias` (
  `version` varchar(30) DEFAULT NULL COMMENT 'ID de la licencia',
  `orden` int(4) DEFAULT NULL COMMENT 'Orden de la ejecución',
  `sentencia` varchar(1000) DEFAULT NULL COMMENT 'Sentencia a aplicar',
  `estatus` char(1) DEFAULT '0' COMMENT 'Estatus de la licencia (0=Por aplicar, 1=Aplicado, 9=Error)'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Log de versiones';

/*Table structure for table `set_equipos` */

DROP TABLE IF EXISTS `set_equipos`;

CREATE TABLE `set_equipos` (
  `equipo` bigint(11) DEFAULT NULL COMMENT 'ID del equipo',
  `sensor` bigint(11) DEFAULT NULL COMMENT 'ID del sensor',
  `factor` decimal(20,10) DEFAULT NULL COMMENT 'Factor de conversión de la cantidad',
  `ip` varchar(100) DEFAULT NULL COMMENT 'Dirección IP',
  `nombrered` varchar(100) DEFAULT NULL COMMENT 'Nombre en la red',
  `clave` varchar(100) DEFAULT NULL COMMENT 'Contraseña en la red',
  `produccion` char(1) DEFAULT NULL COMMENT 'Es el sensor para contar la producción',
  `inicial` char(1) DEFAULT NULL COMMENT 'Es el sensor donde inicia el WIP',
  `wip` decimal(17,7) DEFAULT NULL COMMENT 'Cantidad total de WIP',
  `estimar_scrap` char(1) DEFAULT NULL COMMENT 'Estimar el scrap basado en el WIP',
  `estimar_retrabajos` char(1) DEFAULT NULL COMMENT 'Estimar piezas retrabajadas',
  `activarparo` bigint(11) DEFAULT NULL COMMENT 'Activar paro desde (segundos)',
  `activardefecto` decimal(17,7) DEFAULT NULL COMMENT 'Activar defectos automáticos desde',
  `mmcall_paro` char(1) DEFAULT NULL COMMENT 'Generar llamada a MMCall por paro',
  `mmcall_bajorate` char(1) DEFAULT NULL COMMENT 'Generar llamada a MMCall por bajo rate',
  `mmcall_altorate` char(1) DEFAULT NULL COMMENT 'Generar llamada a MMCall por alto rate',
  `bajo_rate_tipo` int(2) DEFAULT NULL COMMENT 'Tipo como se calcula el bajo rate',
  `bajo_rate_monto` decimal(17,7) DEFAULT NULL COMMENT 'Valor para generar llamada de bajo rate',
  `bajo_rate_clasificar` char(1) DEFAULT NULL COMMENT 'Solicitar clasificación de bajo rate',
  `alto_rate_tipo` int(2) DEFAULT NULL COMMENT 'Tipo como se calcula el alto rate',
  `alto_rate_monto` decimal(17,7) DEFAULT NULL COMMENT 'Valor para generar llamada de alto rate',
  `alto_rate_clasificar` char(1) DEFAULT NULL COMMENT 'Solicitar clasificación de alto rate',
  `tope_productividad` decimal(10,5) DEFAULT NULL COMMENT 'Topar el % de productividad',
  `tope_ftq` decimal(10,5) DEFAULT NULL COMMENT 'Topar el % de FTQ',
  `tope_disponibilidad` decimal(10,0) DEFAULT NULL COMMENT 'Topar el % de disponibilidad'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Configuracion de equipos';

/*Table structure for table `tablas` */

DROP TABLE IF EXISTS `tablas`;

CREATE TABLE `tablas` (
  `id` int(6) NOT NULL COMMENT 'ID de la tabla',
  `nombre` varchar(50) DEFAULT NULL COMMENT 'Nombre de la tabla',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Catálogo de tablas';

/*Table structure for table `traduccion` */

DROP TABLE IF EXISTS `traduccion`;

CREATE TABLE `traduccion` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `literal` varchar(50) DEFAULT NULL COMMENT 'Literal a buscar',
  `idioma` varchar(5) DEFAULT NULL COMMENT 'Idioma',
  `traduccion` varchar(100) DEFAULT NULL COMMENT 'Traducción',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`literal`,`idioma`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='Tabla de traducción';

/*Table structure for table `vw_alarmas` */

DROP TABLE IF EXISTS `vw_alarmas`;

CREATE TABLE `vw_alarmas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `falla` bigint(20) DEFAULT NULL COMMENT 'ID de la falla VW',
  `codigo` varchar(50) DEFAULT NULL COMMENT 'Codigo de la falla VW',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Descripción de la falla VW',
  `nave` varchar(50) DEFAULT NULL COMMENT 'ID de la nave',
  `area` varchar(50) DEFAULT NULL COMMENT 'Estación según gráfica',
  `estacion` varchar(50) DEFAULT NULL COMMENT 'ID del equipo VW',
  `prioridad` varchar(1) DEFAULT NULL COMMENT 'Prioridad',
  `inicio` datetime DEFAULT NULL COMMENT 'Acumular número de fallas',
  `fin` datetime DEFAULT NULL COMMENT 'Segundos a contar para acumular',
  `tiempo` bigint(8) DEFAULT '0' COMMENT 'Tiempo en segundos',
  `responsable` varchar(50) DEFAULT NULL COMMENT 'Responsable',
  `tecnologia` varchar(50) DEFAULT NULL COMMENT 'Tecnología',
  `alerta` bigint(11) DEFAULT NULL COMMENT 'Alerta asociada',
  `reporte` bigint(20) DEFAULT '0' COMMENT 'Reporte',
  `accion` int(2) DEFAULT NULL COMMENT 'Acción efectuada: 0=Acumuló, 1=Notificó luego de acumular, 2=Notificó sin acumulación, 3=Ya estaba activa la alerta ',
  `fecha_ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha directa de MySQL',
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`falla`,`inicio`),
  KEY `NewIndex2` (`inicio`)
) ENGINE=MyISAM AUTO_INCREMENT=33880 DEFAULT CHARSET=latin1 COMMENT='Tabla local de fallas para estadísticas';

/*Table structure for table `vw_alerta_escalamientos` */

DROP TABLE IF EXISTS `vw_alerta_escalamientos`;

CREATE TABLE `vw_alerta_escalamientos` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `alerta` bigint(11) NOT NULL DEFAULT '0' COMMENT 'ID de la alerta',
  `nivel` int(1) DEFAULT '0' COMMENT 'Nivel de escalamiento: 0-6',
  `tipo` int(2) DEFAULT '0' COMMENT 'Tipo de repositorio (0: Llamada, 10: SMS, 20: Llamada y SMS, 30: Correo to, 31: Correo copy to, 32: Correo blind copy, 40: Área de MMCall)',
  `cadena` varchar(200) DEFAULT NULL COMMENT 'Repositorio',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  PRIMARY KEY (`id`,`alerta`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='VW: Escalamientos asociados a una alerta';

/*Table structure for table `vw_alerta_fallas` */

DROP TABLE IF EXISTS `vw_alerta_fallas`;

CREATE TABLE `vw_alerta_fallas` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `alerta` bigint(11) NOT NULL DEFAULT '0' COMMENT 'ID de la alerta',
  `orden` int(4) DEFAULT NULL COMMENT 'Orden de la falla en la lista',
  `comparacion` int(2) DEFAULT NULL COMMENT 'Tipo de coincidencia',
  `prefijo` varchar(50) DEFAULT NULL COMMENT 'Repositorio',
  `estacion` varchar(50) DEFAULT NULL COMMENT 'Equipo asociado: *=Cualquiera',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  PRIMARY KEY (`id`,`alerta`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=latin1 COMMENT='VW: Fallas asociadas a una alerta';

/*Table structure for table `vw_alertas` */

DROP TABLE IF EXISTS `vw_alertas`;

CREATE TABLE `vw_alertas` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `referencia` varchar(50) DEFAULT NULL COMMENT 'Referencia',
  `nombre` varchar(60) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `solapar` char(1) DEFAULT NULL COMMENT 'Solapar alertas',
  `tipo` int(1) DEFAULT '1' COMMENT 'Tipo: 0=Normal, 9=Escape',
  `escape_estacion` varchar(100) DEFAULT NULL COMMENT 'Código de la estación (escape)',
  `prioridad` int(1) DEFAULT '3' COMMENT 'Prioridad de la alerta',
  `notas` varchar(100) DEFAULT NULL COMMENT 'Notas varias',
  `acumular` char(1) DEFAULT NULL COMMENT 'Acumular fallas antes de enviar',
  `acumular_veces` bigint(6) DEFAULT '0' COMMENT 'Número de veces a acumular',
  `acumular_tiempo` bigint(8) DEFAULT '0' COMMENT 'Tiempo de acumulación',
  `acumular_inicializar` char(1) DEFAULT NULL COMMENT 'Inicializa el contador una vez alcanzada la frecuencia',
  `acumular_tipo_mensaje` char(1) DEFAULT NULL COMMENT 'Tipo de mensaje para repeticiones',
  `acumular_mensaje` varchar(200) DEFAULT NULL COMMENT 'Mensaje de acumulación',
  `log` char(1) DEFAULT NULL COMMENT 'Se generará LOG',
  `sms` char(1) DEFAULT NULL COMMENT 'Se enviará SMS',
  `correo` char(1) DEFAULT NULL COMMENT 'Se enviará correo',
  `llamada` char(1) DEFAULT NULL COMMENT 'Se hará llamada',
  `mmcall` char(1) DEFAULT NULL COMMENT 'Se enviará llamada a MMCall',
  `lista` bigint(11) DEFAULT NULL COMMENT 'Lista de  distribución',
  `escalar1` char(1) DEFAULT NULL COMMENT 'Escalar 1ro',
  `tiempo1` bigint(8) DEFAULT '0' COMMENT 'Tiempo de escalación (1)',
  `lista1` bigint(11) DEFAULT '0' COMMENT 'Lista de distribución (1)',
  `log1` char(1) DEFAULT NULL COMMENT 'Generar LOG (1)',
  `sms1` char(1) DEFAULT NULL COMMENT 'Enviar SMS (1)',
  `correo1` char(1) DEFAULT NULL COMMENT 'Enviar correo (1)',
  `llamada1` char(1) DEFAULT NULL COMMENT 'Generar Llamada (1)',
  `mmcall1` char(1) DEFAULT NULL COMMENT 'Área de MMCall (1)',
  `repetir1` char(1) DEFAULT NULL COMMENT 'Repetir el escalamiento (1)',
  `escalar2` char(1) DEFAULT NULL COMMENT 'Escalar 2do',
  `tiempo2` bigint(8) DEFAULT '0' COMMENT 'Tiempo de escalación (2)',
  `lista2` bigint(11) DEFAULT '0' COMMENT 'Lista de distribución (2)',
  `log2` char(1) DEFAULT NULL COMMENT 'Generar LOG (2)',
  `sms2` char(1) DEFAULT NULL COMMENT 'Enviar SMS (2)',
  `correo2` char(1) DEFAULT NULL COMMENT 'Enviar correo (2)',
  `llamada2` char(1) DEFAULT NULL COMMENT 'Generar Llamada (2)',
  `mmcall2` char(1) DEFAULT NULL COMMENT 'Área de MMCall (2)',
  `repetir2` char(1) DEFAULT NULL COMMENT 'Repetir el escalamiento (2)',
  `escalar3` char(1) DEFAULT NULL COMMENT 'Escalar 3ro',
  `tiempo3` bigint(8) DEFAULT '0' COMMENT 'Tiempo de escalación (3)',
  `lista3` bigint(11) DEFAULT '0' COMMENT 'Lista de distribución (3)',
  `log3` char(1) DEFAULT NULL COMMENT 'Generar LOG (3)',
  `sms3` char(1) DEFAULT NULL COMMENT 'Enviar SMS (3)',
  `correo3` char(1) DEFAULT NULL COMMENT 'Enviar correo (3)',
  `llamada3` char(1) DEFAULT NULL COMMENT 'Generar Llamada (3)',
  `mmcall3` char(1) DEFAULT NULL COMMENT 'Área de MMCall (3)',
  `repetir3` char(1) DEFAULT NULL COMMENT 'Repetir el escalamiento (3)',
  `escalar4` char(1) DEFAULT NULL COMMENT 'Escalar 4to',
  `tiempo4` bigint(8) DEFAULT '0' COMMENT 'Tiempo de escalación (4)',
  `lista4` bigint(11) DEFAULT '0' COMMENT 'Lista de distribución (4)',
  `log4` char(1) DEFAULT NULL COMMENT 'Generar LOG (4)',
  `sms4` char(1) DEFAULT NULL COMMENT 'Enviar SMS (4)',
  `correo4` char(1) DEFAULT NULL COMMENT 'Enviar correo (4)',
  `llamada4` char(1) DEFAULT NULL COMMENT 'Generar Llamada (4)',
  `mmcall4` char(1) DEFAULT NULL COMMENT 'Área de MMCall (4)',
  `repetir4` char(1) DEFAULT NULL COMMENT 'Repetir el escalamiento (4)',
  `escalar5` char(1) DEFAULT NULL COMMENT 'Escalar 5to',
  `tiempo5` bigint(8) DEFAULT '0' COMMENT 'Tiempo de escalación (5)',
  `lista5` bigint(11) DEFAULT '0' COMMENT 'Lista de distribución (5)',
  `log5` char(1) DEFAULT NULL COMMENT 'Generar LOG (5)',
  `sms5` char(1) DEFAULT NULL COMMENT 'Enviar SMS (5)',
  `correo5` char(1) DEFAULT NULL COMMENT 'Enviar correo (5)',
  `llamada5` char(1) DEFAULT NULL COMMENT 'Generar Llamada (5)',
  `mmcall5` char(1) DEFAULT NULL COMMENT 'Área de MMCall (5)',
  `repetir5` char(1) DEFAULT NULL COMMENT 'Repetir el escalamiento (5)',
  `repetir` char(1) DEFAULT NULL COMMENT 'Repetir llamada',
  `repetir_tiempo` bigint(8) DEFAULT '0' COMMENT 'Repetir llamada (segundos)',
  `repetir_log` char(1) DEFAULT NULL COMMENT 'Generar log en la repetición',
  `repetir_sms` char(1) DEFAULT NULL COMMENT 'Enviar SMS en la repetición',
  `repetir_correo` char(1) DEFAULT NULL COMMENT 'Enviar correo en la repetición',
  `repetir_llamada` char(1) DEFAULT NULL COMMENT 'Generar llamada en la repetición',
  `repetir_mmcall` char(1) DEFAULT NULL COMMENT 'Área de MMCall en la repetición',
  `estadistica` char(1) DEFAULT NULL COMMENT 'Generar estadística',
  `escape_veces` int(2) DEFAULT '3' COMMENT 'Número de veces que se repetirá una llamada',
  `escape_accion` char(1) DEFAULT NULL COMMENT 'Acción de Escape',
  `escape_mensaje` varchar(200) DEFAULT NULL COMMENT 'Mensaje a enviar si se agotan las llamadas',
  `escape_lista` bigint(11) DEFAULT NULL COMMENT 'Lista de distribución',
  `acumulado` bigint(8) DEFAULT '0' COMMENT 'Contador actual',
  `activada` datetime DEFAULT NULL COMMENT 'Fecha de activación',
  `repetida` datetime DEFAULT NULL COMMENT 'Fecha de última repetición',
  `escalada1` datetime DEFAULT NULL COMMENT 'Fecha de escalamiento (1)',
  `escalada2` datetime DEFAULT NULL COMMENT 'Fecha de escalamiento (2)',
  `escalada3` datetime DEFAULT NULL COMMENT 'Fecha de escalamiento (3)',
  `escalada4` datetime DEFAULT NULL COMMENT 'Fecha de escalamiento (4)',
  `escalada5` datetime DEFAULT NULL COMMENT 'Fecha de escalamiento (5)',
  `atendida` datetime DEFAULT NULL COMMENT 'Fecha de cierre',
  `estado` int(2) DEFAULT '0' COMMENT 'Estado de la alerta (0=Escuchando, 1=Activada, 2=Escalada N1, 3=Escalada N2, 4=Escalada N3, 5=Escalada N4, 6=Escalada N5)   ',
  `informar_resolucion` char(1) DEFAULT NULL COMMENT 'Infoermar resolución',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COMMENT='VW: Catálogo de alertas';

/*Table structure for table `vw_configuracion` */

DROP TABLE IF EXISTS `vw_configuracion`;

CREATE TABLE `vw_configuracion` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `tiempo` bigint(8) DEFAULT NULL COMMENT 'Tiempo de revisión',
  `correo_cuenta` varchar(100) DEFAULT NULL COMMENT 'Perfil de correo',
  `correo_puerto` varchar(100) DEFAULT NULL COMMENT 'Puerto',
  `correo_ssl` char(1) DEFAULT NULL COMMENT 'Seguridad SSL',
  `correo_clave` varchar(100) DEFAULT NULL COMMENT 'Contraseña',
  `correo_host` varchar(100) DEFAULT NULL COMMENT 'Host',
  `flag_agregar` char(1) DEFAULT NULL COMMENT 'Flag de que se agregó una falla',
  `ejecutando_desde` datetime DEFAULT NULL COMMENT 'Ejecutando desde',
  `ultima_falla` bigint(20) DEFAULT NULL COMMENT 'Último ID de falla revisado',
  `ultima_revision` datetime DEFAULT NULL COMMENT 'Fecha de la última revisión',
  `revisar_cada` bigint(8) DEFAULT '0' COMMENT 'Revisar cada n segundos',
  `utilizar_arduino` char(1) DEFAULT NULL COMMENT 'Usar arduino?',
  `puerto_comm1` varchar(10) DEFAULT NULL COMMENT 'Puerto comm (1)',
  `puerto_comm1_par` varchar(100) DEFAULT NULL COMMENT 'Parámetros Puerto comm (1)',
  `puerto_comm2` varchar(10) DEFAULT NULL COMMENT 'Puerto comm (2)',
  `puerto_comm2_par` varchar(100) DEFAULT NULL COMMENT 'Parámetros Puerto comm (2)',
  `puerto_comm3` varchar(10) DEFAULT NULL COMMENT 'Puerto comm (3)',
  `puerto_comm3_par` varchar(100) DEFAULT NULL COMMENT 'Parámetros Puerto comm (3)',
  `puerto_comm4` varchar(10) NOT NULL COMMENT 'Puerto comm (4)',
  `puerto_comm4_par` varchar(100) DEFAULT NULL COMMENT 'Parámetros Puerto comm (4)',
  `puerto_comm5` varchar(10) DEFAULT NULL COMMENT 'Puerto comm (5)',
  `puerto_comm5_par` varchar(100) DEFAULT NULL COMMENT 'Parámetros Puerto comm (5)',
  `puerto_comm6` varchar(10) DEFAULT NULL COMMENT 'Puerto comm (6)',
  `puerto_comm6_par` varchar(100) DEFAULT NULL COMMENT 'Parámetros Puerto comm (6)',
  `ruta_sms` varchar(500) DEFAULT NULL COMMENT 'Ruta para los SMS',
  `ruta_audios` varchar(500) DEFAULT NULL COMMENT 'Ruta para las llamadas',
  `optimizar_llamada` char(1) DEFAULT NULL COMMENT 'Optimiza las llamadas',
  `optimizar_sms` char(1) DEFAULT NULL COMMENT 'Optimiza los SMS',
  `optimizar_correo` char(1) DEFAULT NULL COMMENT 'Optimiza los correos',
  `optimizar_mmcall` char(1) DEFAULT NULL COMMENT 'Optimiza las llamadas a MMCall',
  `mantener_prioridad` char(1) DEFAULT NULL COMMENT 'Mantener prioridad en la optimización',
  `voz_predeterminada` varchar(255) DEFAULT NULL COMMENT 'Voz predeterminada',
  `escape_mmcall` char(1) DEFAULT NULL COMMENT 'Escape para MMCall',
  `escape_mmcall_mensaje` varchar(200) DEFAULT NULL COMMENT 'Mensaje a enviar MMCall',
  `escape_mmcall_lista` bigint(11) DEFAULT NULL COMMENT 'Lista de distribución (requesters ocupados)',
  `escape_mmcall_cancelar` char(1) DEFAULT NULL COMMENT 'Cancelar el llamado a MMCall',
  `escape_llamadas` int(1) DEFAULT NULL COMMENT 'Número de veces a llamar',
  `escape_accion` char(1) DEFAULT NULL COMMENT 'Acción a tomar',
  `escape_lista` bigint(11) DEFAULT NULL COMMENT 'Lista de distribución',
  `escape_mensaje` varchar(200) DEFAULT NULL COMMENT 'Mensaje a enviar',
  `escape_mensaje_propio` char(1) DEFAULT NULL COMMENT 'Enviar mensaje al propio móvil',
  `veces_reproducir` int(1) DEFAULT '1' COMMENT 'Número de veces que se repeduce un audio',
  `gestion_log` char(6) DEFAULT NULL COMMENT 'Año y mes de la última gestión',
  `gestion_meses` int(4) DEFAULT NULL COMMENT 'Número de meses en línea',
  `correo_titulo_falla` char(1) DEFAULT NULL COMMENT 'Mantener el título de la falla',
  `correo_titulo` varchar(100) DEFAULT NULL COMMENT 'Título opcional del correo',
  `correo_cuerpo` varchar(200) DEFAULT NULL COMMENT 'Cuerpo del correo',
  `correo_firma` varchar(100) DEFAULT NULL COMMENT 'Firma del correo',
  `timeout_llamadas` int(4) DEFAULT NULL COMMENT 'Time Out para llamadas',
  `timeout_sms` int(4) DEFAULT NULL COMMENT 'Time Out para SMS',
  `traducir` char(1) DEFAULT NULL COMMENT 'Traducir mensajes de voz',
  `tiempo_corte` bigint(8) DEFAULT '0' COMMENT 'Tiempo del corte en minutos',
  `ultimo_corte` datetime DEFAULT NULL COMMENT 'Fecha y hora del último corte',
  `bajo_hasta` int(3) DEFAULT NULL,
  `bajo_color` varchar(20) DEFAULT NULL,
  `bajo_etiqueta` varchar(30) DEFAULT NULL,
  `medio_hasta` int(3) DEFAULT NULL,
  `medio_color` varchar(20) DEFAULT NULL,
  `medio_etiqueta` varchar(30) DEFAULT NULL,
  `alto_color` varchar(20) DEFAULT NULL,
  `alto_etiqueta` varchar(30) DEFAULT NULL,
  `noatendio_color` varchar(20) DEFAULT NULL,
  `noatendio_etiqueta` varchar(30) DEFAULT NULL,
  `escaladas_color` varchar(20) DEFAULT NULL,
  `escaladas_etiqueta` varchar(30) DEFAULT NULL,
  `flag_monitor` char(1) DEFAULT 'N' COMMENT 'Flag para leer desde el monitor',
  `ruta_archivos_enviar` varchar(500) DEFAULT NULL COMMENT 'Ruta de los archivos a enviar por correo',
  `server_mmcall` varchar(100) DEFAULT NULL COMMENT 'Server para MMCall',
  `cad_consolidado` varchar(20) DEFAULT NULL COMMENT 'Cadena de la consolidado',
  `ruta_imagenes` varchar(500) DEFAULT NULL COMMENT 'Ruta de imágenes',
  `tiempo_imagen` int(4) DEFAULT NULL COMMENT 'Tiempo entre imagenes',
  `graficas_seleccion` varchar(100) DEFAULT NULL COMMENT 'Gráficas a reportar',
  `graficas_duracion` varchar(100) DEFAULT NULL,
  `timeout_fallas` int(4) DEFAULT '0' COMMENT 'Timeout para crear alerta',
  PRIMARY KEY (`id`,`puerto_comm4`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 MIN_ROWS=1 MAX_ROWS=1 COMMENT='VW: Configuración de la aplicación';

/*Table structure for table `vw_control` */

DROP TABLE IF EXISTS `vw_control`;

CREATE TABLE `vw_control` (
  `fecha` varchar(10) NOT NULL COMMENT 'Fecha  y hora del envío',
  `mensajes` int(8) DEFAULT NULL COMMENT 'Mensajes enviados',
  PRIMARY KEY (`fecha`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Control de mensajes enviados';

/*Table structure for table `vw_estadistica` */

DROP TABLE IF EXISTS `vw_estadistica`;

CREATE TABLE `vw_estadistica` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `falla` varchar(50) DEFAULT NULL COMMENT 'ID de la falla VW',
  `equipo` varchar(50) DEFAULT NULL COMMENT 'ID del equipo VW',
  `descripcion` varchar(400) DEFAULT NULL COMMENT 'Descripción de la falla',
  `inicio` datetime DEFAULT NULL COMMENT 'Fecha y hora de inicio',
  `fin` datetime DEFAULT NULL COMMENT 'Fecha y hora de finalización',
  `tiempo` bigint(8) DEFAULT NULL COMMENT 'Tiempo total de falla',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `vw_fallascronos` */

DROP TABLE IF EXISTS `vw_fallascronos`;

CREATE TABLE `vw_fallascronos` (
  `idk` int(11) NOT NULL COMMENT 'Id de la falla en la tabla fallascronos',
  `nave` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ID de la Nave',
  `estacion` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ID de la estación',
  `codigo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Código dela falla',
  `fecha` datetime DEFAULT NULL COMMENT 'Fecha en que se generó la falla',
  `falla` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Descripción de la falla (se amplia a 100chars)',
  `resp` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Responsable (no lo uso)',
  `estado` int(2) DEFAULT '0' COMMENT 'Estado de la falla (lo uso para control)',
  `tecnologia` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tecnología asociad',
  `prioridad` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Prioridad de la falla (nuevo)',
  `ts` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que se registró la falla en esta tabla',
  `descripcion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Descripción completa de la falla',
  `eliminada` char(1) COLLATE utf8_unicode_ci DEFAULT 'N' COMMENT 'Falla eliminada?',
  `cierre` datetime DEFAULT NULL COMMENT 'Cierre de la falla',
  PRIMARY KEY (`idk`),
  KEY `NewIndex1` (`idk`,`estado`,`eliminada`),
  KEY `NewIndex2` (`idk`,`estado`),
  KEY `NewIndex3` (`eliminada`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Replica de la tabla de VW';

/*Table structure for table `vw_log` */

DROP TABLE IF EXISTS `vw_log`;

CREATE TABLE `vw_log` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora del registro',
  `aplicacion` int(6) DEFAULT NULL COMMENT 'ID de la aplicación',
  `tipo` int(1) DEFAULT '0' COMMENT 'Tipo de mensaje',
  `tiempo` bigint(8) DEFAULT NULL COMMENT 'Segundos en espera',
  `reporte` bigint(11) DEFAULT NULL COMMENT 'Número de reporte',
  `intentados` bigint(8) DEFAULT NULL COMMENT 'Alertas intentadas',
  `enviados` bigint(8) DEFAULT NULL COMMENT 'Alertas enviadas con exito',
  `texto` varchar(250) DEFAULT NULL COMMENT 'Mensaje descriptivo (hasta 250 caracteres)',
  `visto` char(1) DEFAULT 'N' COMMENT 'Ya se vió en el visor?',
  `visto_pc` char(1) DEFAULT 'N' COMMENT 'Ya se vió en el log del PC?',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`fecha`),
  KEY `NewIndex2` (`aplicacion`,`visto`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=207047 DEFAULT CHARSET=latin1 COMMENT='log de la aplicacion';

/*Table structure for table `vw_mensajes` */

DROP TABLE IF EXISTS `vw_mensajes`;

CREATE TABLE `vw_mensajes` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `alerta` bigint(11) DEFAULT NULL COMMENT 'ID de la alerta',
  `tipo` int(2) DEFAULT '0' COMMENT '0=Inicio, 1-5=Escalación1, 9=Repetición, 11-15=Repetición de escalamiento',
  `canal` int(1) DEFAULT NULL COMMENT 'Canal de envío',
  `prioridad` int(1) DEFAULT NULL COMMENT 'Prioridad del mensaje',
  `destino` varchar(100) DEFAULT NULL COMMENT 'Destino',
  `mensaje` varchar(250) DEFAULT NULL COMMENT 'Mensase a enviar',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del mensaje',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha del mensaje',
  `lista` bigint(11) DEFAULT '0' COMMENT 'Lista de distribución',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`tipo`,`estatus`),
  KEY `NewIndex2` (`id`,`alerta`,`canal`),
  KEY `NewIndex3` (`canal`,`prioridad`,`destino`,`estatus`)
) ENGINE=MyISAM AUTO_INCREMENT=64160 DEFAULT CHARSET=latin1 COMMENT='VW: Histórico de mensajes a enviar';

/*Table structure for table `vw_reportes` */

DROP TABLE IF EXISTS `vw_reportes`;

CREATE TABLE `vw_reportes` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `alerta` bigint(11) DEFAULT NULL COMMENT 'Alerta padre',
  `log` char(1) DEFAULT NULL COMMENT 'Se generará LOG',
  `sms` char(1) DEFAULT NULL COMMENT 'Se enviará SMS',
  `correo` char(1) DEFAULT NULL COMMENT 'Se enviará correo',
  `llamada` char(1) DEFAULT NULL COMMENT 'Se hará llamada',
  `mmcall` char(1) DEFAULT NULL COMMENT 'Se enviará llamada a MMCall',
  `lista` bigint(11) DEFAULT NULL COMMENT 'Lista de  distribución',
  `escalar1` char(1) DEFAULT NULL COMMENT 'Escalar 1ro',
  `tiempo1` bigint(8) DEFAULT '0' COMMENT 'Tiempo de escalación (1)',
  `lista1` bigint(11) DEFAULT '0' COMMENT 'Lista de distribución (1)',
  `log1` char(1) DEFAULT NULL COMMENT 'Generar LOG (1)',
  `sms1` char(1) DEFAULT NULL COMMENT 'Enviar SMS (1)',
  `correo1` char(1) DEFAULT NULL COMMENT 'Enviar correo (1)',
  `llamada1` char(1) DEFAULT NULL COMMENT 'Generar Llamada (1)',
  `mmcall1` char(1) DEFAULT NULL COMMENT 'Área de MMCall (1)',
  `repetir1` char(1) DEFAULT NULL COMMENT 'Repetir el escalamiento (1)',
  `escalar2` char(1) DEFAULT NULL COMMENT 'Escalar 2do',
  `tiempo2` bigint(8) DEFAULT '0' COMMENT 'Tiempo de escalación (2)',
  `lista2` bigint(11) DEFAULT '0' COMMENT 'Lista de distribución (2)',
  `log2` char(1) DEFAULT NULL COMMENT 'Generar LOG (2)',
  `sms2` char(1) DEFAULT NULL COMMENT 'Enviar SMS (2)',
  `correo2` char(1) DEFAULT NULL COMMENT 'Enviar correo (2)',
  `llamada2` char(1) DEFAULT NULL COMMENT 'Generar Llamada (2)',
  `mmcall2` char(1) DEFAULT NULL COMMENT 'Área de MMCall (2)',
  `repetir2` char(1) DEFAULT NULL COMMENT 'Repetir el escalamiento (2)',
  `escalar3` char(1) DEFAULT NULL COMMENT 'Escalar 3ro',
  `tiempo3` bigint(8) DEFAULT '0' COMMENT 'Tiempo de escalación (3)',
  `lista3` bigint(11) DEFAULT '0' COMMENT 'Lista de distribución (3)',
  `log3` char(1) DEFAULT NULL COMMENT 'Generar LOG (3)',
  `sms3` char(1) DEFAULT NULL COMMENT 'Enviar SMS (3)',
  `correo3` char(1) DEFAULT NULL COMMENT 'Enviar correo (3)',
  `llamada3` char(1) DEFAULT NULL COMMENT 'Generar Llamada (3)',
  `mmcall3` char(1) DEFAULT NULL COMMENT 'Área de MMCall (3)',
  `repetir3` char(1) DEFAULT NULL COMMENT 'Repetir el escalamiento (3)',
  `escalar4` char(1) DEFAULT NULL COMMENT 'Escalar 4to',
  `tiempo4` bigint(8) DEFAULT '0' COMMENT 'Tiempo de escalación (4)',
  `lista4` bigint(11) DEFAULT '0' COMMENT 'Lista de distribución (4)',
  `log4` char(1) DEFAULT NULL COMMENT 'Generar LOG (4)',
  `sms4` char(1) DEFAULT NULL COMMENT 'Enviar SMS (4)',
  `correo4` char(1) DEFAULT NULL COMMENT 'Enviar correo (4)',
  `llamada4` char(1) DEFAULT NULL COMMENT 'Generar Llamada (4)',
  `mmcall4` char(1) DEFAULT NULL COMMENT 'Área de MMCall (4)',
  `repetir4` char(1) DEFAULT NULL COMMENT 'Repetir el escalamiento (4)',
  `escalar5` char(1) DEFAULT NULL COMMENT 'Escalar 5to',
  `tiempo5` bigint(8) DEFAULT '0' COMMENT 'Tiempo de escalación (5)',
  `lista5` bigint(11) DEFAULT '0' COMMENT 'Lista de distribución (5)',
  `log5` char(1) DEFAULT NULL COMMENT 'Generar LOG (5)',
  `sms5` char(1) DEFAULT NULL COMMENT 'Enviar SMS (5)',
  `correo5` char(1) DEFAULT NULL COMMENT 'Enviar correo (5)',
  `llamada5` char(1) DEFAULT NULL COMMENT 'Generar Llamada (5)',
  `mmcall5` char(1) DEFAULT NULL COMMENT 'Área de MMCall (5)',
  `repetir5` char(1) DEFAULT NULL COMMENT 'Repetir el escalamiento (5)',
  `repetir` char(1) DEFAULT NULL COMMENT 'Repetir llamada',
  `repetir_tiempo` bigint(8) DEFAULT '0' COMMENT 'Repetir llamada (segundos)',
  `repetir_log` char(1) DEFAULT NULL COMMENT 'Generar log en la repetición',
  `repetir_sms` char(1) DEFAULT NULL COMMENT 'Enviar SMS en la repetición',
  `repetir_correo` char(1) DEFAULT NULL COMMENT 'Enviar correo en la repetición',
  `repetir_llamada` char(1) DEFAULT NULL COMMENT 'Generar llamada en la repetición',
  `repetir_mmcall` char(1) DEFAULT NULL COMMENT 'Área de MMCall en la repetición',
  `activada` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de activación',
  `repetida` datetime DEFAULT NULL COMMENT 'Fecha de última repetición',
  `escalada1` datetime DEFAULT NULL COMMENT 'Fecha de escalamiento (1)',
  `escalada2` datetime DEFAULT NULL COMMENT 'Fecha de escalamiento (2)',
  `escalada3` datetime DEFAULT NULL COMMENT 'Fecha de escalamiento (3)',
  `escalada4` datetime DEFAULT NULL COMMENT 'Fecha de escalamiento (4)',
  `escalada5` datetime DEFAULT NULL COMMENT 'Fecha de escalamiento (5)',
  `atendida` datetime DEFAULT NULL COMMENT 'Fecha de cierre',
  `tiempo` int(8) DEFAULT '0' COMMENT 'Tiempo total en segundos',
  `escalamientos` int(1) DEFAULT '0' COMMENT 'Nivel de escalamiento',
  `estado` int(2) DEFAULT '0' COMMENT 'Estado de la alerta (0=Escuchando, 1=Activada, 2=Escalada N1, 3=Escalada N2, 4=Escalada N3, 5=Escalada N4, 6=Escalada N5)   ',
  `repeticiones` int(4) DEFAULT '0' COMMENT 'Número de repeticiones',
  `es1` int(4) DEFAULT '0' COMMENT 'Número de escaadas en nivel 1',
  `es2` int(4) DEFAULT '0' COMMENT 'Número de escaadas en nivel 2',
  `es3` int(4) DEFAULT '0' COMMENT 'Número de escaadas en nivel 3',
  `es4` int(4) DEFAULT '0' COMMENT 'Número de escaadas en nivel 4',
  `es5` int(4) DEFAULT '0' COMMENT 'Número de escaadas en nivel 5',
  `informar_resolucion` char(1) DEFAULT NULL COMMENT 'Informar de la resolución',
  `informado` char(1) DEFAULT 'N' COMMENT 'Informado de la resolución',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`alerta`),
  KEY `NewIndex2` (`estado`,`informar_resolucion`,`informado`)
) ENGINE=MyISAM AUTO_INCREMENT=5797 DEFAULT CHARSET=latin1;

/*Table structure for table `vw_requester_mmcall` */

DROP TABLE IF EXISTS `vw_requester_mmcall`;

CREATE TABLE `vw_requester_mmcall` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(4) DEFAULT NULL COMMENT 'Secuencia del registro',
  `area` bigint(11) DEFAULT NULL COMMENT 'ID del área',
  `requester` varchar(100) DEFAULT NULL COMMENT 'ID del requester (MMCall)',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`area`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Secuencia de llamadas para MMCall';

/*Table structure for table `vw_resumen` */

DROP TABLE IF EXISTS `vw_resumen`;

CREATE TABLE `vw_resumen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `desde` datetime DEFAULT NULL COMMENT 'Fecha desde',
  `hasta` datetime DEFAULT NULL COMMENT 'Fecha hasta',
  `nave` varchar(20) DEFAULT NULL COMMENT 'Nave',
  `estacion` varchar(50) DEFAULT NULL COMMENT 'Estacion',
  `responsable` varchar(50) DEFAULT NULL COMMENT 'Responsable',
  `tecnologia` varchar(50) DEFAULT NULL COMMENT 'Tecnologia',
  `codigo` varchar(50) DEFAULT NULL COMMENT 'Falla',
  `fallas_generadas` bigint(8) DEFAULT '0' COMMENT 'Fallas generadas en el período',
  `fallas_cerradas` bigint(8) DEFAULT '0' COMMENT 'Fallas cerradas en el período',
  `fallas_escaladas` bigint(8) DEFAULT '0' COMMENT 'FAllas cerradas escaladas',
  `fallas_entiempo` bigint(8) DEFAULT '0' COMMENT 'Fallas cerradas sin escalar',
  `fallas_total` bigint(8) DEFAULT '0' COMMENT 'Fallas abiertas (escaladas y no escaladas)',
  `creado` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`desde`),
  KEY `NewIndex2` (`responsable`,`tecnologia`,`codigo`),
  KEY `NewIndex3` (`responsable`),
  KEY `NewIndex4` (`tecnologia`),
  KEY `NewIndex5` (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=179594 DEFAULT CHARSET=latin1 COMMENT='Resumen de fallas y reportes';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
