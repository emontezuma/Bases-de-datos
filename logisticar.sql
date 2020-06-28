/*
SQLyog Community v12.09 (64 bit)
MySQL - 5.6.13 : Database - logisticar
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`logisticar` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `logisticar`;

/*Table structure for table `actualizaciones` */

DROP TABLE IF EXISTS `actualizaciones`;

CREATE TABLE `actualizaciones` (
  `plantas` datetime DEFAULT NULL COMMENT 'Se actualizaron las plantas?',
  `lineas` datetime DEFAULT NULL COMMENT 'Se actualizaron las líneas?',
  `maquinas` datetime DEFAULT NULL COMMENT 'Se actualizaron las máquinas?',
  `procesos` datetime DEFAULT NULL COMMENT 'Se actualizaron las procesos?',
  `rutas` datetime DEFAULT NULL COMMENT 'Se actualizaron las rutas?',
  `det_rutas` datetime DEFAULT NULL COMMENT 'Se actualizaron las rutas detalle?',
  `det_procesos` datetime DEFAULT NULL COMMENT 'Se actualizaron los procesos detalle?',
  `partes` datetime DEFAULT NULL COMMENT 'Se actualizaron las partes?',
  `recipientes` datetime DEFAULT NULL COMMENT 'Se actualizaron las recipientes?',
  `alertas` datetime DEFAULT NULL COMMENT 'Se actualizaron las alertas?',
  `situaciones` datetime DEFAULT NULL COMMENT 'Se actualizaron las situaciones?',
  `horario` datetime DEFAULT NULL COMMENT 'Se actualizaron las horarios?',
  `planes` datetime DEFAULT NULL COMMENT 'Se actualizaron las planes?',
  `prioridades` datetime DEFAULT NULL COMMENT 'Se actualizaron las prioridades?',
  `areas` datetime DEFAULT NULL COMMENT 'Se actualizaron las areas?',
  `fallas` datetime DEFAULT NULL COMMENT 'Se actualizaron las fallas?',
  `generales` datetime DEFAULT NULL COMMENT 'Se actualizaron las tablas generales?',
  `distribucion` datetime DEFAULT NULL COMMENT 'Se actualizaron las distribuciones?',
  `correos` datetime DEFAULT NULL COMMENT 'Se actualizaron los correos?',
  `turnos` datetime DEFAULT NULL COMMENT 'Se actualizaron los turnos?',
  `usuarios` datetime DEFAULT NULL COMMENT 'Se actualizaron los usuarios?',
  `traducciones` datetime DEFAULT NULL COMMENT 'Se actualizaron las traducciones?',
  `politicas` datetime DEFAULT NULL COMMENT 'Se actualizaron las politicas?',
  `rates` datetime DEFAULT NULL COMMENT 'Se actualizaron las rates?',
  `estimados` datetime DEFAULT NULL COMMENT 'Se actualizaron las estimados?',
  `objetivos` datetime DEFAULT NULL COMMENT 'Se actualizaron las objetivos?',
  `sensores` datetime DEFAULT NULL COMMENT 'Se actualizaron las sensores?',
  `paros` datetime DEFAULT NULL COMMENT 'Se actualizaron los paros?',
  `dispositivos` datetime DEFAULT NULL COMMENT 'Se actualizaron los dispositivos?',
  `vehiculos` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Control de actualización';

/*Table structure for table `alarmas` */

DROP TABLE IF EXISTS `alarmas`;

CREATE TABLE `alarmas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `alerta` bigint(20) DEFAULT '0' COMMENT 'ID de la alerta',
  `proceso` bigint(20) DEFAULT '0' COMMENT 'ID del proceso',
  `proceso_detalle` bigint(20) DEFAULT '0' COMMENT 'ID del detalle del proceso',
  `prioridad` varchar(1) DEFAULT NULL COMMENT 'Prioridad de la alerta',
  `inicio` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de inicio de la alarma',
  `fin` datetime DEFAULT NULL COMMENT 'Fecha de fin de la alarma',
  `tiempo` bigint(8) DEFAULT '0' COMMENT 'Tiempo que duro la alarma activa (en segundos)',
  `activada` datetime DEFAULT NULL COMMENT 'Fecha de activación',
  `repetida` datetime DEFAULT NULL COMMENT 'Fecha de repetición',
  `escalada1` datetime DEFAULT NULL COMMENT 'Fecha de escalamiento (1)',
  `escalada2` datetime DEFAULT NULL COMMENT 'Fecha de escalamiento (2)',
  `escalada3` datetime DEFAULT NULL COMMENT 'Fecha de escalamiento (3)',
  `escalada4` datetime DEFAULT NULL COMMENT 'Fecha de escalamiento (4)',
  `escalada5` datetime DEFAULT NULL COMMENT 'Fecha de escalamiento (5)',
  `fase` int(2) DEFAULT '0' COMMENT 'Fase en que está la alarma',
  `estatus` int(1) DEFAULT '0' COMMENT 'Estatus de la alarma',
  `repeticiones` int(4) DEFAULT '0' COMMENT 'Total repeticiones',
  `escalamientos1` int(4) DEFAULT '0' COMMENT 'Total escalamientos (1)',
  `escalamientos2` int(4) DEFAULT '0' COMMENT 'Total escalamientos (2)',
  `escalamientos3` int(4) DEFAULT '0' COMMENT 'Total escalamientos (3)',
  `escalamientos4` int(4) DEFAULT '0' COMMENT 'Total escalamientos (4)',
  `escalamientos5` int(4) DEFAULT '0' COMMENT 'Total escalamientos (5)',
  `informado` char(1) DEFAULT 'N' COMMENT 'Al terminarse esta informada?',
  `acumulada` char(1) DEFAULT 'N' COMMENT 'Es una alarma acumulada?',
  `termino` bigint(20) DEFAULT '0' COMMENT 'Usuario que terminó la alerta',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`alerta`,`inicio`),
  KEY `NewIndex2` (`inicio`),
  KEY `NewIndex3` (`tiempo`)
) ENGINE=MyISAM AUTO_INCREMENT=36243 DEFAULT CHARSET=latin1 COMMENT='Detalle de alarmas';

/*Table structure for table `cat_alertas` */

DROP TABLE IF EXISTS `cat_alertas`;

CREATE TABLE `cat_alertas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `referencia` varchar(50) DEFAULT NULL COMMENT 'Referencia',
  `nombre` varchar(60) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `solapar` char(1) DEFAULT 'N' COMMENT 'Solapar alertas',
  `evento` bigint(20) DEFAULT '0' COMMENT 'ID del evento a monitorear',
  `tipo` int(3) DEFAULT '0' COMMENT 'Tipo: 0=Normal, 9=Escape',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `proceso` bigint(20) DEFAULT '0' COMMENT 'Proceso asociado a la alerta',
  `linea` char(1) DEFAULT 'S' COMMENT 'Línea asignada a la alerta',
  `maquina` bigint(20) DEFAULT '0' COMMENT 'Máquina asignada a la alerta',
  `area` bigint(20) DEFAULT '0' COMMENT 'Área asignada a la alerta',
  `falla` bigint(20) DEFAULT '0' COMMENT 'Falla asignada a la alerta',
  `prioridad` int(1) DEFAULT '0' COMMENT 'Prioridad (0: Normal, 1: Alta)',
  `transcurrido` bigint(12) DEFAULT '0' COMMENT 'Tiempo trnscurrido en segundos para la alarma',
  `acumular` char(1) DEFAULT 'N' COMMENT 'Acumular fallas antes de enviar',
  `acumular_veces` bigint(6) DEFAULT '0' COMMENT 'Número de veces a acumular',
  `acumular_tiempo` bigint(8) DEFAULT '0' COMMENT 'Tiempo de acumulación',
  `acumular_inicializar` char(1) DEFAULT 'N' COMMENT 'Inicializa el contador una vez alcanzada la frecuencia',
  `log` char(1) DEFAULT 'N' COMMENT 'Se generará LOG',
  `sms` char(1) DEFAULT 'N' COMMENT 'Se enviará SMS',
  `correo` char(1) DEFAULT 'N' COMMENT 'Se enviará correo',
  `llamada` char(1) DEFAULT 'N' COMMENT 'Se hará llamada',
  `mmcall` char(1) DEFAULT 'N' COMMENT 'Se enviará llamada a MMCall',
  `lista` bigint(20) DEFAULT '0' COMMENT 'Lista de  distribución',
  `veces` int(3) DEFAULT '0' COMMENT 'Veces a alarmar',
  `escalar1` char(1) DEFAULT 'N' COMMENT 'Escalar 1ro',
  `tiempo1` bigint(8) DEFAULT '0' COMMENT 'Tiempo de escalación (1)',
  `lista1` bigint(20) DEFAULT '0' COMMENT 'Lista de distribución (1)',
  `log1` char(1) DEFAULT 'N' COMMENT 'Generar LOG (1)',
  `sms1` char(1) DEFAULT 'N' COMMENT 'Enviar SMS (1)',
  `correo1` char(1) DEFAULT 'N' COMMENT 'Enviar correo (1)',
  `llamada1` char(1) DEFAULT 'N' COMMENT 'Generar Llamada (1)',
  `mmcall1` char(1) DEFAULT 'N' COMMENT 'Área de MMCall (1)',
  `repetir1` char(1) DEFAULT 'N' COMMENT 'Repetir el escalamiento (1)',
  `veces1` int(3) DEFAULT '0' COMMENT 'Veces a escalar (1)',
  `escalar2` char(1) DEFAULT 'N' COMMENT 'Escalar 2do',
  `tiempo2` bigint(8) DEFAULT '0' COMMENT 'Tiempo de escalación (2)',
  `lista2` bigint(20) DEFAULT '0' COMMENT 'Lista de distribución (2)',
  `log2` char(1) DEFAULT 'N' COMMENT 'Generar LOG (2)',
  `sms2` char(1) DEFAULT 'N' COMMENT 'Enviar SMS (2)',
  `correo2` char(1) DEFAULT 'N' COMMENT 'Enviar correo (2)',
  `llamada2` char(1) DEFAULT 'N' COMMENT 'Generar Llamada (2)',
  `mmcall2` char(1) DEFAULT 'N' COMMENT 'Área de MMCall (2)',
  `repetir2` char(1) DEFAULT 'N' COMMENT 'Repetir el escalamiento (2)',
  `veces2` int(3) DEFAULT '0' COMMENT 'Veces a escalar (2)',
  `escalar3` char(1) DEFAULT 'N' COMMENT 'Escalar 3ro',
  `tiempo3` bigint(8) DEFAULT '0' COMMENT 'Tiempo de escalación (3)',
  `lista3` bigint(20) DEFAULT '0' COMMENT 'Lista de distribución (3)',
  `log3` char(1) DEFAULT 'N' COMMENT 'Generar LOG (3)',
  `sms3` char(1) DEFAULT 'N' COMMENT 'Enviar SMS (3)',
  `correo3` char(1) DEFAULT 'N' COMMENT 'Enviar correo (3)',
  `llamada3` char(1) DEFAULT 'N' COMMENT 'Generar Llamada (3)',
  `mmcall3` char(1) DEFAULT 'N' COMMENT 'Área de MMCall (3)',
  `repetir3` char(1) DEFAULT 'N' COMMENT 'Repetir el escalamiento (3)',
  `veces3` int(3) DEFAULT '0' COMMENT 'Veces a escalar (3)',
  `escalar4` char(1) DEFAULT 'N' COMMENT 'Escalar 4to',
  `tiempo4` bigint(8) DEFAULT '0' COMMENT 'Tiempo de escalación (4)',
  `lista4` bigint(20) DEFAULT '0' COMMENT 'Lista de distribución (4)',
  `log4` char(1) DEFAULT 'N' COMMENT 'Generar LOG (4)',
  `sms4` char(1) DEFAULT 'N' COMMENT 'Enviar SMS (4)',
  `correo4` char(1) DEFAULT 'N' COMMENT 'Enviar correo (4)',
  `llamada4` char(1) DEFAULT 'N' COMMENT 'Generar Llamada (4)',
  `mmcall4` char(1) DEFAULT 'N' COMMENT 'Área de MMCall (4)',
  `repetir4` char(1) DEFAULT 'N' COMMENT 'Repetir el escalamiento (4)',
  `veces4` int(3) DEFAULT '0' COMMENT 'Veces a escalar (4)',
  `escalar5` char(1) DEFAULT 'N' COMMENT 'Escalar 5to',
  `tiempo5` bigint(8) DEFAULT '0' COMMENT 'Tiempo de escalación (5)',
  `lista5` bigint(20) DEFAULT '0' COMMENT 'Lista de distribución (5)',
  `log5` char(1) DEFAULT 'N' COMMENT 'Generar LOG (5)',
  `sms5` char(1) DEFAULT 'N' COMMENT 'Enviar SMS (5)',
  `correo5` char(1) DEFAULT 'N' COMMENT 'Enviar correo (5)',
  `llamada5` char(1) DEFAULT 'N' COMMENT 'Generar Llamada (5)',
  `mmcall5` char(1) DEFAULT 'N' COMMENT 'Área de MMCall (5)',
  `repetir5` char(1) DEFAULT 'N' COMMENT 'Repetir el escalamiento (5)',
  `veces5` int(3) DEFAULT '0' COMMENT 'Veces a escalar (5)',
  `repetir` char(1) DEFAULT 'N' COMMENT 'Repetir llamada',
  `repetir_tiempo` bigint(8) DEFAULT '0' COMMENT 'Repetir llamada (segundos)',
  `repetir_log` char(1) DEFAULT 'N' COMMENT 'Generar log en la repetición',
  `repetir_sms` char(1) DEFAULT 'N' COMMENT 'Enviar SMS en la repetición',
  `repetir_correo` char(1) DEFAULT 'N' COMMENT 'Enviar correo en la repetición',
  `repetir_llamada` char(1) DEFAULT 'N' COMMENT 'Generar llamada en la repetición',
  `repetir_mmcall` char(1) DEFAULT 'N' COMMENT 'Área de MMCall en la repetición',
  `repetir_veces` int(4) DEFAULT '0' COMMENT 'Número de veces a repetir',
  `estadistica` char(1) DEFAULT 'N' COMMENT 'Generar estadística',
  `escape_veces` int(2) DEFAULT '3' COMMENT 'Número de veces que se repetirá una llamada',
  `escape_accion` char(1) DEFAULT 'N' COMMENT 'Acción de Escape',
  `escape_mensaje` varchar(200) DEFAULT NULL COMMENT 'Mensaje a enviar si se agotan las llamadas',
  `escape_lista` bigint(20) DEFAULT '0' COMMENT 'Lista de distribución',
  `informar_resolucion` char(1) DEFAULT 'N' COMMENT 'Informar resolución',
  `cancelacion_mensaje` varchar(200) DEFAULT NULL COMMENT 'Mensaje de cancelación',
  `resolucion_mensaje` varchar(200) DEFAULT NULL COMMENT 'Mensaje de resolución',
  `tiempo0` bigint(8) DEFAULT '0' COMMENT 'Tiempo previo para alertas informativas',
  `mensaje` varchar(300) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `mensaje_mmcall` char(80) DEFAULT NULL,
  `mensaje1_mantener` char(1) DEFAULT 'N',
  `mensaje1` varchar(300) DEFAULT NULL,
  `titulo1` varchar(100) DEFAULT NULL,
  `mensaje1_mmcall` varchar(80) DEFAULT NULL,
  `mensaje2_mantener` char(1) DEFAULT 'N',
  `mensaje2` varchar(300) DEFAULT NULL,
  `titulo2` varchar(100) DEFAULT NULL,
  `mensaje2_mmcall` varchar(50) DEFAULT NULL,
  `mensaje3_mantener` char(1) DEFAULT 'N',
  `mensaje3` varchar(300) DEFAULT NULL,
  `titulo3` varchar(100) DEFAULT NULL,
  `mensaje3_mmcall` varchar(80) DEFAULT NULL,
  `mensaje4_mantener` char(1) DEFAULT 'N',
  `mensaje4` varchar(200) DEFAULT NULL,
  `titulo4` varchar(100) DEFAULT NULL,
  `mensaje4_mmcall` varchar(80) DEFAULT NULL,
  `mensaje5_mantener` char(1) DEFAULT 'N',
  `mensaje5` varchar(200) DEFAULT NULL,
  `titulo5` varchar(100) DEFAULT NULL,
  `mensaje5_mmcall` varchar(80) DEFAULT NULL,
  `repetir_mantener` char(1) DEFAULT 'N',
  `repetir_mensaje` varchar(200) DEFAULT NULL,
  `repetir_titulo` varchar(100) DEFAULT NULL,
  `repetir_mensaje_mmcall` varchar(80) DEFAULT NULL,
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(20) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(20) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`evento`,`proceso`,`estatus`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=latin1 COMMENT='Catálogo de alertas';

/*Table structure for table `cat_areas` */

DROP TABLE IF EXISTS `cat_areas`;

CREATE TABLE `cat_areas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `planta` bigint(20) DEFAULT NULL COMMENT 'ID de la planta',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia con el sistema',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `agrupador_1` bigint(20) DEFAULT '0' COMMENT 'Agrupador (1)',
  `agrupador_2` bigint(20) DEFAULT '0' COMMENT 'Agrupador (2)',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `url_mmcall` varchar(1000) DEFAULT NULL COMMENT 'URL de MMCall',
  `audios_ruta` varchar(1000) DEFAULT NULL COMMENT 'Carpeta de audios',
  `audios_activar` char(1) DEFAULT 'N',
  `audios_prefijo` varchar(1000) DEFAULT NULL COMMENT 'Audio prefijo',
  `audios_general` char(1) DEFAULT 'S' COMMENT 'Grabar también en carpeta general',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=latin1 COMMENT='Catálogo de áreas';

/*Table structure for table `cat_choferes` */

DROP TABLE IF EXISTS `cat_choferes`;

CREATE TABLE `cat_choferes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `agrupador_1` bigint(20) DEFAULT '0' COMMENT 'Agrupador (1)',
  `agrupador_2` bigint(20) DEFAULT '0' COMMENT 'Agrupador (2)',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `correo` varchar(100) DEFAULT NULL COMMENT 'Correo electrónico',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'URL de MMCall',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`nombre`),
  KEY `NewIndex2` (`referencia`)
) ENGINE=MyISAM AUTO_INCREMENT=1147 DEFAULT CHARSET=latin1 COMMENT='Catálogo de áreas';

/*Table structure for table `cat_correos` */

DROP TABLE IF EXISTS `cat_correos`;

CREATE TABLE `cat_correos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `nombre` varchar(60) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `para` varchar(2000) DEFAULT NULL COMMENT 'Lista de distribución',
  `copia` varchar(2000) DEFAULT NULL COMMENT 'Lista de distribución (con copia)',
  `oculta` varchar(2000) DEFAULT NULL COMMENT 'Lista de distribución (con copia oculta)',
  `titulo` varchar(200) DEFAULT NULL COMMENT 'Título del correo',
  `cuerpo` varchar(1000) DEFAULT NULL COMMENT 'Cuerpo del correo',
  `extraccion` varchar(40) DEFAULT NULL COMMENT 'Extracción del reporte',
  `ultimo_envio` datetime DEFAULT NULL COMMENT 'Fecha del último envío',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(20) DEFAULT '0' COMMENT 'Creado por',
  `modificado` bigint(20) DEFAULT '0' COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='Catálogo de correos';

/*Table structure for table `cat_defectos` */

DROP TABLE IF EXISTS `cat_defectos`;

CREATE TABLE `cat_defectos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(20) DEFAULT NULL COMMENT 'Referencia',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del defecto',
  `prefijo` varchar(30) DEFAULT NULL COMMENT 'Prefijo de la descripción',
  `agrupador1` bigint(20) DEFAULT NULL COMMENT 'ID del agrupador (1)',
  `agrupador2` bigint(20) DEFAULT NULL COMMENT 'ID del agrupador (2)',
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

/*Table structure for table `cat_descargas` */

DROP TABLE IF EXISTS `cat_descargas`;

CREATE TABLE `cat_descargas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `destino` bigint(20) DEFAULT '0' COMMENT 'ID del destino',
  `transporte` bigint(20) DEFAULT '0' COMMENT 'ID del transporte',
  `tipo` bigint(20) DEFAULT '0',
  `carga` bigint(20) DEFAULT '0' COMMENT 'ID del tipo de carga',
  `tiempo` bigint(10) DEFAULT '0' COMMENT 'Tiempo estimado',
  `monitorear` char(1) DEFAULT 'S',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`destino`,`transporte`,`tipo`,`carga`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Table structure for table `cat_destinos` */

DROP TABLE IF EXISTS `cat_destinos`;

CREATE TABLE `cat_destinos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `planta` bigint(20) DEFAULT NULL COMMENT 'ID de la planta',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia con el sistema',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `color` varchar(20) DEFAULT NULL COMMENT 'Color principal',
  `agrupador_2` bigint(20) DEFAULT '0' COMMENT 'Agrupador (2)',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `url_mmcall` bigint(20) DEFAULT '0' COMMENT 'URL de MMCall',
  `audios_ruta` varchar(1000) DEFAULT NULL COMMENT 'Carpeta de audios',
  `audios_activar` char(1) DEFAULT 'N',
  `audios_prefijo` varchar(1000) DEFAULT NULL COMMENT 'Audio prefijo',
  `audios_general` char(1) DEFAULT 'S' COMMENT 'Grabar también en carpeta general',
  `inicial` char(1) DEFAULT 'N' COMMENT 'Destino inicial por defecto',
  `final` char(1) DEFAULT 'N' COMMENT 'Destino final por defecto',
  `patio_espera` char(1) DEFAULT 'N' COMMENT 'Patio de espera por defecto',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`),
  KEY `inicial` (`inicial`,`estatus`),
  KEY `final` (`final`,`estatus`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=latin1 COMMENT='Catálogo de destinos';

/*Table structure for table `cat_distribucion` */

DROP TABLE IF EXISTS `cat_distribucion`;

CREATE TABLE `cat_distribucion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia',
  `nombre` varchar(60) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `prefijo` varchar(30) DEFAULT NULL COMMENT 'Prefijo del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `telefonos` varchar(2000) DEFAULT '' COMMENT 'Número de teléfono',
  `correos` varchar(2000) DEFAULT '' COMMENT 'Correo electrónico',
  `mmcall` varchar(2000) DEFAULT '' COMMENT 'Requesters de MMCall',
  `hora_desde` time DEFAULT NULL COMMENT 'Hora de inicio',
  `hora_hasta` time DEFAULT NULL COMMENT 'Hora de fin',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(20) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(20) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1 COMMENT='Catálogo de listas de distribución';

/*Table structure for table `cat_equipos` */

DROP TABLE IF EXISTS `cat_equipos`;

CREATE TABLE `cat_equipos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `planta` bigint(20) DEFAULT '0' COMMENT 'ID de la planta',
  `linea` bigint(20) DEFAULT '0' COMMENT 'ID de la linea',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia con el sistema',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `prefijo` varchar(30) DEFAULT NULL COMMENT 'Prefijo del registro',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `agrupador1` bigint(11) DEFAULT NULL COMMENT 'ID del agrupador (1)',
  `agrupador2` bigint(11) DEFAULT NULL COMMENT 'ID del agrupador (2)',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT '0' COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT '0' COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Catálogo de equipos';

/*Table structure for table `cat_frases` */

DROP TABLE IF EXISTS `cat_frases`;

CREATE TABLE `cat_frases` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `linea` bigint(20) DEFAULT '0' COMMENT 'ID de la línea',
  `maquina` bigint(20) DEFAULT '0' COMMENT 'ID de la máquina',
  `area` bigint(20) DEFAULT '0' COMMENT 'ID del área',
  `falla` bigint(20) DEFAULT '0' COMMENT 'ID de la falla',
  `mensaje` varchar(200) DEFAULT '0' COMMENT 'Agrupador (2)',
  `largo` int(2) DEFAULT NULL COMMENT 'Largo del mensaje',
  `esperado` bigint(12) DEFAULT NULL COMMENT 'Tiempo esperado para reparación',
  `url_mmcall` varchar(250) DEFAULT NULL COMMENT 'URL de MMCall',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Table structure for table `cat_generales` */

DROP TABLE IF EXISTS `cat_generales`;

CREATE TABLE `cat_generales` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `tabla` int(6) DEFAULT NULL COMMENT 'ID de la tabla',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `prefijo` varchar(30) DEFAULT NULL COMMENT 'Prefijo del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `id_relacionado` bigint(20) DEFAULT NULL COMMENT 'Relación entre registros',
  `url_mmcall` varchar(1000) DEFAULT NULL COMMENT 'URL de MMCall',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(20) DEFAULT '0' COMMENT 'Creado por',
  `modificado` bigint(20) DEFAULT '0' COMMENT 'Modificado por',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`id_relacionado`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1 COMMENT='Tablas generales';

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

/*Table structure for table `cat_rutas` */

DROP TABLE IF EXISTS `cat_rutas`;

CREATE TABLE `cat_rutas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `origen` bigint(20) DEFAULT '0' COMMENT 'ID del origen',
  `destino` bigint(20) DEFAULT '0' COMMENT 'ID del destino',
  `transporte` bigint(20) DEFAULT '0' COMMENT 'ID del transporte',
  `tipo` bigint(20) DEFAULT '0',
  `carga` bigint(20) DEFAULT '0' COMMENT 'ID del tipo de carga',
  `tiempo` bigint(10) DEFAULT '0' COMMENT 'Tiempo estimado',
  `monitorear` char(1) DEFAULT 'S',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`origen`,`destino`,`transporte`,`tipo`,`carga`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=latin1 COMMENT='Catálogo de rutas';

/*Table structure for table `cat_transportes` */

DROP TABLE IF EXISTS `cat_transportes`;

CREATE TABLE `cat_transportes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `planta` bigint(20) DEFAULT NULL COMMENT 'ID de la planta',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia con el sistema',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `agrupador_1` bigint(20) DEFAULT '0' COMMENT 'Agrupador (1)',
  `agrupador_2` bigint(20) DEFAULT '0' COMMENT 'Agrupador (2)',
  `url_mmcall` bigint(20) DEFAULT '0' COMMENT 'ID del recipiente',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `disponibilidad` int(1) DEFAULT '0',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(20) DEFAULT '0' COMMENT 'Creado por',
  `modificado` bigint(20) DEFAULT '0' COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=879 DEFAULT CHARSET=latin1 COMMENT='Catálogo de líneas';

/*Table structure for table `cat_turnos` */

DROP TABLE IF EXISTS `cat_turnos`;

CREATE TABLE `cat_turnos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `planta` bigint(20) DEFAULT '0' COMMENT 'ID de la planta',
  `nombre` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nombre del registro',
  `referencia` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT 'Referencia',
  `inicia` time DEFAULT NULL COMMENT 'Hora de inicio',
  `termina` time DEFAULT NULL COMMENT 'Hora de Fin',
  `cambiodia` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Pasa de un día a otro (S/N)',
  `especial` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Turno especial (S/N)',
  `tipo` int(1) DEFAULT '0' COMMENT 'Tipo de turno (0=Diurno, 1=Matutino, 2=Nocturno, 3=Mixto)',
  `mover` int(1) DEFAULT '0' COMMENT 'Recorrer fecha de reporte (1=Dia anterior, 2=Dia posterior, 0=No recorrer)',
  `secuencia` int(2) DEFAULT NULL COMMENT 'Secuencia del turno',
  `estatus` char(1) COLLATE utf8_bin DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(20) DEFAULT NULL COMMENT 'Usuario que creó el registro',
  `modificado` bigint(20) DEFAULT NULL COMMENT 'Usuario que modificó el registro',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de turnos';

/*Table structure for table `cat_usuarios` */

DROP TABLE IF EXISTS `cat_usuarios`;

CREATE TABLE `cat_usuarios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(50) DEFAULT NULL COMMENT 'Referencia',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `clave` varchar(255) DEFAULT NULL COMMENT 'Conraseña',
  `prefijo` varchar(50) DEFAULT NULL COMMENT 'Prefijo del registro',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `rol` char(1) DEFAULT NULL COMMENT 'Rol de usuario',
  `politica` int(2) DEFAULT NULL COMMENT 'Política de contraseña',
  `operacion` char(1) DEFAULT 'N' COMMENT 'Ver todas las operaciones (S/N)',
  `linea` char(1) DEFAULT 'N' COMMENT 'Ver todas las líneas (S/N)',
  `maquina` char(1) DEFAULT 'N' COMMENT 'Ver todas las máquinas (S/N)',
  `area` char(1) DEFAULT 'N' COMMENT 'Ver todas las áreas (S/N)',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `admin` char(1) DEFAULT 'N' COMMENT 'Es administrador',
  `calidad` char(1) DEFAULT 'N' COMMENT 'Puede hacer inspecciones de calidad',
  `reversos` char(1) DEFAULT 'N' COMMENT 'Puede hacer reversos',
  `programacion` char(1) DEFAULT 'N' COMMENT 'Ver programación(lectura)',
  `inventario` char(1) DEFAULT 'N' COMMENT 'Ver inventario',
  `tecnico` char(1) DEFAULT 'N' COMMENT 'Rol de técnico',
  `planta` bigint(20) DEFAULT '0' COMMENT 'ID de la plant',
  `apagar_alertas` char(1) DEFAULT 'N' COMMENT 'El usuario puede cancelar alertas',
  `ver_alertas` char(1) DEFAULT 'N' COMMENT 'El usuario puede ver las alertas',
  `cerrar_al_ejecutar` char(1) DEFAULT 'N' COMMENT 'Cerrar menú al ajecutar',
  `vista_resumida_fallas` char(1) DEFAULT NULL COMMENT 'Vista resumida de las fallas',
  `confirmar_reparacion` char(1) DEFAULT 'N' COMMENT 'Puede confirmar una reparación',
  `ultima_pantalla` int(2) DEFAULT '0' COMMENT 'Última pantalla usada',
  `inicializada` char(1) DEFAULT 'S' COMMENT 'Contraseña inicializada',
  `preferencias_andon` varchar(50) DEFAULT '00000000000000000000000000000000000000000000000000' COMMENT 'Preferecia de Andon',
  `departamento` bigint(20) DEFAULT '0' COMMENT 'ID del Departamento',
  `compania` bigint(20) DEFAULT '0' COMMENT 'ID de la compañía',
  `tema` int(3) DEFAULT '0' COMMENT 'ID del tema',
  `turno` bigint(20) DEFAULT '0' COMMENT 'Turno asociado',
  `claveant1` varchar(255) DEFAULT NULL COMMENT 'Últimas claves usadas',
  `claveant2` varchar(255) DEFAULT NULL COMMENT 'Últimas claves usadas',
  `claveant3` varchar(255) DEFAULT NULL COMMENT 'Últimas claves usadas',
  `claveant4` varchar(255) DEFAULT NULL COMMENT 'Últimas claves usadas',
  `claveant5` varchar(255) DEFAULT NULL COMMENT 'Últimas claves usadas',
  `ucambio` date DEFAULT NULL COMMENT 'Fecha del último cambio',
  `entrada` datetime DEFAULT NULL COMMENT 'Fecha de la última entrada',
  `salida` datetime DEFAULT NULL COMMENT 'Fecha de la última salida',
  `ultimo_reporte` int(1) DEFAULT '0' COMMENT 'Último reporte consultado',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT '0' COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT '0' COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=latin1 COMMENT='Catalogo de usuarios';

/*Table structure for table `cat_vehiculos` */

DROP TABLE IF EXISTS `cat_vehiculos`;

CREATE TABLE `cat_vehiculos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `linea` bigint(20) DEFAULT '0' COMMENT 'ID de la línea (0=Suelta)',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia con el sistema',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `tipo` bigint(20) DEFAULT '0' COMMENT 'Tipo de máquina',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas',
  `agrupador_1` bigint(20) DEFAULT '0' COMMENT 'Agrupador (1)',
  `agrupador_2` bigint(20) DEFAULT '0' COMMENT 'Agrupador (2)',
  `url_mmcall` bigint(20) DEFAULT '0' COMMENT 'Recipiente',
  `chofer` bigint(20) DEFAULT '0',
  `carga` bigint(20) DEFAULT '0' COMMENT 'Carga acistumbrada',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(20) DEFAULT '0' COMMENT 'Creado por',
  `modificado` bigint(20) DEFAULT '0' COMMENT 'Modificado por',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`nombre`)
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=latin1 COMMENT='Catálogo de máquinas';

/*Table structure for table `configuracion` */

DROP TABLE IF EXISTS `configuracion`;

CREATE TABLE `configuracion` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `planta` varchar(100) DEFAULT NULL COMMENT 'Nombre de la planta',
  `rfc` varchar(30) DEFAULT NULL COMMENT 'RFC',
  `licencia` varchar(30) DEFAULT NULL COMMENT 'Número de licencia',
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
  `timeout_fallas` int(10) DEFAULT '0' COMMENT 'Timeout para crear alerta',
  `avisar_segundos` bigint(4) DEFAULT NULL COMMENT 'Avisar con tantos segundos antes',
  `color_aviso` varchar(20) DEFAULT NULL COMMENT 'Color del aviso',
  `contar_post` char(1) DEFAULT NULL COMMENT 'Contar luego de vencer el tiempo',
  `color_post` varchar(20) DEFAULT NULL COMMENT 'Color del post',
  `escaner_prefijo` varchar(10) DEFAULT NULL COMMENT 'Prefijo del escaner',
  `escaner_sufijo` varchar(10) DEFAULT NULL COMMENT 'Sufijo del escaner',
  `tiempo_holgura` int(4) DEFAULT '0',
  `tiempo_entre_lecturas` int(4) DEFAULT NULL COMMENT 'Tiempo entre lecturas (seg)',
  `tiempo_escaner` int(4) DEFAULT '0' COMMENT 'Tiempo de espera entre milesegundos',
  `largo_escaner` int(2) DEFAULT '0' COMMENT 'Largo mínimo de la frase del escaner',
  `lote_inspeccion_clave` char(1) DEFAULT NULL COMMENT 'Requiere clave el envío de lotes a calidad',
  `reverso_permitir` char(1) DEFAULT NULL COMMENT 'Permitir reverso? (S/N/C)',
  `reverso_referencia` varchar(20) DEFAULT NULL COMMENT 'Referencia para reversar',
  `dias_programacion` int(4) DEFAULT '0' COMMENT 'Días atras para la programación',
  `holgura_reprogramar` int(6) DEFAULT '0' COMMENT 'Holgura en segundos para reprogramar',
  `tipo_flujo` char(1) DEFAULT NULL COMMENT 'Tipo de flujo',
  `estimado_productividad` int(3) DEFAULT NULL COMMENT 'Estimado productividad',
  `confirmar_mensaje_mantto` char(1) DEFAULT 'S' COMMENT 'Confirmar mensaje de configuración',
  `url_mmcall` varchar(1000) DEFAULT NULL COMMENT 'URL de MMCall',
  `accion_mmcall` char(1) DEFAULT 'N' COMMENT 'Acumula MMCall',
  `tiempo_reporte` bigint(12) DEFAULT NULL COMMENT 'Tiempo para cerrar el reporte',
  `be_alarmas_correos` char(1) DEFAULT 'N' COMMENT 'Enviar alarmas por correo',
  `be_alarmas_mmcall` char(1) DEFAULT 'N' COMMENT 'Enviar alarmas por MMCall',
  `be_alarmas_llamadas` char(1) DEFAULT 'N' COMMENT 'Enviar alarmas por llamada',
  `be_alarmas_sms` char(1) DEFAULT 'N' COMMENT 'Enviar alarmas por SMS',
  `be_envio_reportes` char(1) DEFAULT 'N' COMMENT 'Enviar reportes',
  `be_revision_correos` int(6) DEFAULT '0' COMMENT 'Envíos de correos (segundos)',
  `be_revision_mmcall` int(6) DEFAULT '0' COMMENT 'Envíos de MMCall (segundos)',
  `be_revision_arduino` int(6) DEFAULT '0' COMMENT 'Envíos de Arduino (segundos)',
  `be_log_lineas` int(4) DEFAULT '0' COMMENT 'Líneas a visulizar en en log',
  `be_log_activar` char(1) DEFAULT 'N' COMMENT 'Activar el log?',
  `maximo_largo_mmcall` int(2) DEFAULT '0' COMMENT 'Máximo de caracteres para mensajes a MMCall',
  `separador_mail` char(1) DEFAULT ';' COMMENT 'Separador de correos',
  `limitar_inicio` int(4) DEFAULT '0' COMMENT 'Segundos a limitar el inicio de sesión',
  `limitar_respuestas` int(4) DEFAULT '0' COMMENT 'Segundos a limitar respuestas',
  `recuperar_sesion` char(1) DEFAULT 'N' COMMENT 'Recuperar sesión luego de téenico',
  `visor_revisar_cada` int(6) DEFAULT '0' COMMENT 'Visor: Segundos para revisar',
  `logo_arriba` int(6) DEFAULT '0' COMMENT 'Arriba del logo',
  `logo_izquierda` int(6) DEFAULT '0' COMMENT 'Izquierda del logo',
  `logo_ancho` int(6) DEFAULT '0' COMMENT 'Ancho del logo',
  `logo_alto` int(6) DEFAULT '0' COMMENT 'Alto del logo',
  `logo_ruta` varchar(500) DEFAULT NULL COMMENT 'Ruta del logo',
  `mapa_alineacion` varchar(30) DEFAULT NULL COMMENT 'Tipo de alineación del mapa',
  `mapa_fondo` varchar(20) DEFAULT NULL COMMENT 'Color de fondo del mapa',
  `confirmar_reparacion` char(1) DEFAULT 'N' COMMENT 'Confirmar reparación',
  `ruta_programa_mapa` varchar(1000) DEFAULT NULL COMMENT 'Programa para actualizar el mapa',
  `mapa_delay` int(4) DEFAULT NULL COMMENT 'Segundos a mostrar múltiples mapas',
  `mapa_rotacion` int(1) DEFAULT '0' COMMENT 'Muestra de mapas (0: Solo con falla, 1: todos)',
  `tema_principal` int(3) DEFAULT NULL COMMENT 'ID del tema principal',
  `mapa_ultimo` datetime DEFAULT NULL COMMENT 'Fecha de la última actualización del mapa',
  `mapa_solicitud` char(1) DEFAULT NULL COMMENT 'Solicitar actualización de mapa',
  `tema_permitir_crear` char(1) DEFAULT NULL COMMENT 'Permitir a los usuarios crear temas',
  `tema_permitir_cambio` char(1) DEFAULT NULL COMMENT 'Permitir a los usuarios cambiar temas',
  `turno_modo` int(1) DEFAULT NULL COMMENT 'Modo de cambiar de turno (0: Manual, 1: Sugerir, 2: Prompt, 3: Automático)',
  `ver_logo_cronos` char(1) DEFAULT 'S' COMMENT 'Visualizar el logo de cronos',
  `url_cronos` varchar(300) DEFAULT NULL COMMENT 'URL de la página de cronos',
  `audios_activar` char(1) DEFAULT 'N' COMMENT 'Activar generación de audios generales',
  `audios_ruta` varchar(1000) DEFAULT NULL COMMENT 'Ruta a guardar',
  `audios_prefijo` varchar(1000) DEFAULT NULL COMMENT 'Ruta del audio prefijo',
  `ver_ayuda` char(1) DEFAULT 'S' COMMENT 'Ver ayuda en andon',
  `ip_localhost` varchar(100) DEFAULT NULL COMMENT 'IP local (primaria)',
  `mensaje` varchar(300) DEFAULT NULL COMMENT 'Mensaje a enviar como audio',
  `ultimo_audio` datetime DEFAULT NULL COMMENT 'Fecha de la ultima generación de audios',
  `audios_escalamiento` int(1) DEFAULT '0' COMMENT 'Modo de escalamiento de los audios',
  `audios_resolucion` varchar(100) DEFAULT NULL COMMENT 'Informar la resolución',
  `modulo_produccion` char(1) DEFAULT 'N' COMMENT 'Ver hoja de Excel',
  `usar_clave_falla` char(1) DEFAULT NULL COMMENT 'Usar clave de falla',
  `mostrar_numero` char(1) DEFAULT NULL COMMENT 'Mostrar el número de reporte',
  `turno_actual` bigint(20) DEFAULT '0' COMMENT 'ID del turno',
  `dimension` varchar(20) DEFAULT NULL COMMENT 'Dimension de la aplicación',
  `tiempo_andon` int(6) DEFAULT '0' COMMENT 'Tiempo de espera etre repeticionesANDOn',
  `lectura_pendiente` int(1) DEFAULT '0' COMMENT 'Lectura pendiente?',
  `modulo_oee` char(1) DEFAULT NULL COMMENT 'Modulo de OEE',
  `ver_nombre_planta` char(1) DEFAULT NULL COMMENT 'Ver titulo del mapa',
  `oee_mostrar_paro` char(1) DEFAULT 'N' COMMENT 'Mostrar mensaje de paros',
  `carrusel_oee` int(1) DEFAULT '0' COMMENT 'Tipo de carrusel OEE (0=Todas las máquinas, 1=Sólo maquinas produciendo)',
  `carrusel_tiempo` bigint(6) DEFAULT '0' COMMENT 'Tiempo de visualización de la máquina en segundos',
  `kanban` char(1) DEFAULT 'N' COMMENT 'Activar módulo de kanban',
  `smed` char(1) DEFAULT 'N' COMMENT 'Activar opción de SMED',
  `esperado_oee` decimal(6,2) DEFAULT '0.00',
  `esperado_ftq` decimal(6,2) DEFAULT '0.00',
  `esperado_efi` decimal(6,2) DEFAULT '0.00',
  `esperado_dis` decimal(6,2) DEFAULT '0.00',
  `esperado_mttr` decimal(15,5) DEFAULT '0.00000',
  `esperado_mtbf` decimal(15,5) DEFAULT '0.00000',
  `modulo_wip` char(1) DEFAULT 'N' COMMENT 'Módulo WIP',
  `reportes_inicial` int(1) DEFAULT '0' COMMENT 'Automaticamente ver todos',
  `turno_oee` bigint(20) DEFAULT '0',
  `mensaje_mmcall` varchar(60) DEFAULT NULL,
  `andon_repeticiones` int(3) DEFAULT NULL,
  `agregar_movil` char(1) DEFAULT 'S',
  `adicionales` char(1) DEFAULT 'N',
  `pagers_val` char(1) DEFAULT 'S',
  `asignar_destino` char(1) DEFAULT 'S',
  `asignar_caseta` char(1) DEFAULT 'N',
  `asignar_automatico` char(1) DEFAULT 'N',
  `visor_mostrar` int(1) DEFAULT '0',
  `agregar_transporte` char(1) DEFAULT 'N',
  PRIMARY KEY (`id`,`puerto_comm4`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 MIN_ROWS=1 MAX_ROWS=1;

/*Table structure for table `consultas_cab` */

DROP TABLE IF EXISTS `consultas_cab`;

CREATE TABLE `consultas_cab` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `nombre` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Nombre de la consulta',
  `usuario` bigint(20) DEFAULT NULL COMMENT 'ID del usuario',
  `publico` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Es una consulta pública?',
  `periodo` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT 'Período a usar',
  `desde` datetime DEFAULT NULL COMMENT 'Fecha desde',
  `hasta` datetime DEFAULT NULL COMMENT 'Fecha de hasta',
  `defecto` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Consulta por defecto',
  `filtrooper` char(1) COLLATE utf8_bin DEFAULT 'S' COMMENT 'Total operaciones filtradas',
  `filtronpar` char(1) COLLATE utf8_bin DEFAULT 'S' COMMENT 'Total Números de parte filtradas',
  `filtrolin` char(1) COLLATE utf8_bin DEFAULT 'S' COMMENT 'Total Números de parte filtradas',
  `filtromaq` char(1) COLLATE utf8_bin DEFAULT 'S' COMMENT 'Total Números de parte filtradas',
  `filtroare` char(1) COLLATE utf8_bin DEFAULT 'S' COMMENT 'Total Números de parte filtradas',
  `filtrofal` char(1) COLLATE utf8_bin DEFAULT 'S' COMMENT 'Total Números de parte filtradas',
  `filtromq1` char(10) COLLATE utf8_bin DEFAULT 'S' COMMENT 'Total Números de parte filtradas',
  `filtromq2` char(10) COLLATE utf8_bin DEFAULT 'S' COMMENT 'Total Números de parte filtradas',
  `filtromq3` char(10) COLLATE utf8_bin DEFAULT 'S' COMMENT 'Total Números de parte filtradas',
  `filtrofa1` char(10) COLLATE utf8_bin DEFAULT 'S' COMMENT 'Total Números de parte filtradas',
  `filtrofa2` char(10) COLLATE utf8_bin DEFAULT 'S' COMMENT 'Total Números de parte filtradas',
  `filtrotec` char(10) COLLATE utf8_bin DEFAULT 'S' COMMENT 'Total Números de parte filtradas',
  `filtrotur` char(10) COLLATE utf8_bin DEFAULT 'S',
  `filtroord` char(10) COLLATE utf8_bin DEFAULT 'S',
  `visualizar` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Visualizar todo',
  `general` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Consulta general',
  `actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`usuario`),
  KEY `NewIndex2` (`usuario`,`general`)
) ENGINE=MyISAM AUTO_INCREMENT=441 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de consultas';

/*Table structure for table `consultas_det` */

DROP TABLE IF EXISTS `consultas_det`;

CREATE TABLE `consultas_det` (
  `consulta` bigint(20) DEFAULT NULL COMMENT 'ID de la consulta',
  `tabla` int(6) DEFAULT NULL COMMENT 'ID de la tabla',
  `valor` bigint(20) DEFAULT NULL COMMENT 'ID del valor',
  KEY `NewIndex1` (`consulta`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Detalle de la consulta';

/*Table structure for table `control` */

DROP TABLE IF EXISTS `control`;

CREATE TABLE `control` (
  `fecha` varchar(10) NOT NULL COMMENT 'Fecha  y hora del envío',
  `mensajes` int(8) DEFAULT NULL COMMENT 'Mensajes enviados',
  PRIMARY KEY (`fecha`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Control de mensajes enviados';

/*Table structure for table `det_correo` */

DROP TABLE IF EXISTS `det_correo`;

CREATE TABLE `det_correo` (
  `correo` bigint(20) DEFAULT NULL COMMENT 'ID del correo',
  `reporte` bigint(20) DEFAULT NULL COMMENT 'ID del reporte'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Detalle de los coreos a enviar';

/*Table structure for table `det_disponibilidad` */

DROP TABLE IF EXISTS `det_disponibilidad`;

CREATE TABLE `det_disponibilidad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `calendario` bigint(20) DEFAULT NULL COMMENT 'ID del calendario',
  `equipo` bigint(20) DEFAULT NULL COMMENT 'ID del equipo',
  `fecha` date DEFAULT NULL COMMENT 'Fecha especifica',
  `disponibilidad` bigint(5) DEFAULT NULL COMMENT 'Disponibilidad en segundos',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`calendario`,`equipo`,`fecha`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Disponibilidad por equipo y fecha';

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

/*Table structure for table `dias` */

DROP TABLE IF EXISTS `dias`;

CREATE TABLE `dias` (
  `fecha` date NOT NULL COMMENT 'Fecha del día',
  `dia` int(1) NOT NULL,
  PRIMARY KEY (`fecha`,`dia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Tabla de dias';

/*Table structure for table `figuras` */

DROP TABLE IF EXISTS `figuras`;

CREATE TABLE `figuras` (
  `id` varchar(50) NOT NULL,
  `mapa_id` int(11) NOT NULL,
  `objeto_id` varchar(50) NOT NULL,
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `ancho` float NOT NULL DEFAULT '0',
  `largo` float NOT NULL DEFAULT '0',
  `rotacion` float NOT NULL DEFAULT '0',
  `idx` float NOT NULL DEFAULT '0',
  `idy` float NOT NULL DEFAULT '0',
  `rotacion_texto` float NOT NULL DEFAULT '0',
  `tipo_id` int(11) NOT NULL,
  `color_borde` varchar(20) NOT NULL DEFAULT '#FFF',
  `alfa_borde` float DEFAULT '1',
  `color_fondo` varchar(20) NOT NULL DEFAULT '#FFF',
  `alfa_fondo` float DEFAULT '1',
  `color_texto` varchar(20) NOT NULL DEFAULT '#000',
  `fuente` varchar(50) NOT NULL DEFAULT 'Sans-serif',
  `tamano_fuente` float NOT NULL DEFAULT '0',
  `fuente_italica` tinyint(4) NOT NULL DEFAULT '0',
  `fuente_negrita` tinyint(4) NOT NULL DEFAULT '0',
  `archivo` varchar(300) NOT NULL DEFAULT '',
  `status_asociado` int(11) NOT NULL,
  `ultima_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mensaje` varchar(300) NOT NULL DEFAULT '',
  `efecto` varchar(2) NOT NULL DEFAULT '',
  `ancho_borde` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`mapa_id`),
  KEY `mapa_id` (`mapa_id`,`objeto_id`),
  KEY `tipo_id` (`tipo_id`),
  KEY `status_asociado` (`status_asociado`),
  KEY `figuras_ibfk_3` (`status_asociado`,`mapa_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `horarios` */

DROP TABLE IF EXISTS `horarios`;

CREATE TABLE `horarios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `clase` int(1) DEFAULT '0' COMMENT 'Clase de horario (0=Disponibilidad de producción, 1=Mantenimiento)',
  `tipo` char(1) DEFAULT 'S' COMMENT 'Tipo de horario (S/N)',
  `proceso` bigint(20) DEFAULT '0' COMMENT 'ID del proceso',
  `maquina` bigint(20) DEFAULT '0' COMMENT 'ID de la maquina',
  `dia` int(1) DEFAULT '0' COMMENT 'Dia de semana (9=por fecha)',
  `fecha` date DEFAULT NULL COMMENT 'Fecha a revisar',
  `desde` time DEFAULT NULL COMMENT 'Hora desde',
  `hasta` time DEFAULT NULL COMMENT 'Hora hasta',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1 COMMENT='Horarios';

/*Table structure for table `int_eventos` */

DROP TABLE IF EXISTS `int_eventos`;

CREATE TABLE `int_eventos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `planta` bigint(20) DEFAULT '0' COMMENT 'ID de la planta',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `monitor` char(1) DEFAULT NULL COMMENT 'Monitorear (S/N)',
  `alerta` bigint(20) DEFAULT '0' COMMENT 'ID de la alerta asociado',
  `revision` int(6) DEFAULT '0' COMMENT 'Tiempo de revisión',
  `revisado` datetime DEFAULT NULL COMMENT 'Fecha y hora la última revisión',
  `prioridad` int(3) DEFAULT NULL COMMENT 'Prioridad de la revisión',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(20) DEFAULT '0' COMMENT 'Creado por',
  `modificado` bigint(20) DEFAULT '0' COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COMMENT='Catálogo de eventos';

/*Table structure for table `int_listados` */

DROP TABLE IF EXISTS `int_listados`;

CREATE TABLE `int_listados` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del correo',
  `nombre` varchar(50) DEFAULT NULL COMMENT 'Reporte',
  `datos` char(1) DEFAULT 'S' COMMENT 'Permite datos en csv',
  `grafica` char(1) DEFAULT 'S' COMMENT 'Permite gráficas',
  `orden` int(3) DEFAULT '0' COMMENT 'Orden en la vista',
  `file_name` varchar(200) DEFAULT NULL COMMENT 'Nombre del archivo',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Activo?',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=latin1 COMMENT='Reportes para el negocio';

/*Table structure for table `int_opciones` */

DROP TABLE IF EXISTS `int_opciones`;

CREATE TABLE `int_opciones` (
  `id` int(6) DEFAULT NULL COMMENT 'ID de la opción',
  `rol` char(1) DEFAULT NULL COMMENT 'ID del rol',
  `nombre` varchar(60) DEFAULT NULL COMMENT 'Descripción de la opción',
  `orden` int(4) DEFAULT NULL COMMENT 'Orden en la pantalla de usuarios',
  `visualizar` char(1) DEFAULT 'S' COMMENT 'Visualizar en el sistema',
  `acciones` varchar(10) DEFAULT 'SSSSS' COMMENT 'Acciones (Visualizar, Crear, Editar, Inactivar/Reactivar, Eliminar)',
  `opcion_app` int(4) DEFAULT '0' COMMENT 'Opción de la app',
  `url` varchar(40) DEFAULT NULL COMMENT 'URL a ejecutar',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus de la opción'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `licencias` */

DROP TABLE IF EXISTS `licencias`;

CREATE TABLE `licencias` (
  `tipo` char(1) DEFAULT NULL COMMENT 'Tipo de dispositivo (B=Botonera, R=Reloj)',
  `mmcall` varchar(50) DEFAULT NULL COMMENT 'Valor MMCall',
  `cronos` varchar(50) DEFAULT NULL COMMENT 'Clave de Cronos',
  `inicio` datetime DEFAULT NULL COMMENT 'Fecha de inicio de la licencia',
  `licenciado` date DEFAULT NULL COMMENT 'Fecha de licencia',
  `vencimiento` datetime DEFAULT NULL COMMENT 'Fecha de vencimiento',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus de la licencia',
  KEY `NewIndex1` (`tipo`,`mmcall`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Licenciamiento de equipos';

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora del registro',
  `aplicacion` int(6) DEFAULT NULL COMMENT 'ID de la aplicación',
  `tipo` int(1) DEFAULT '0' COMMENT 'Tipo de mensaje',
  `proceso` bigint(20) DEFAULT '0' COMMENT 'Número del proceso',
  `texto` varchar(250) DEFAULT NULL COMMENT 'Mensaje descriptivo (hasta 250 caracteres)',
  `visto` char(1) DEFAULT 'N' COMMENT 'Ya se vió en el visor?',
  `visto_pc` char(1) DEFAULT 'N' COMMENT 'Ya se vió en el log del PC?',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`fecha`),
  KEY `NewIndex2` (`visto_pc`),
  KEY `NewIndex3` (`visto`)
) ENGINE=MyISAM AUTO_INCREMENT=6653422 DEFAULT CHARSET=latin1;

/*Table structure for table `mapas` */

DROP TABLE IF EXISTS `mapas`;

CREATE TABLE `mapas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `planta` bigint(20) DEFAULT NULL COMMENT 'ID de la planta',
  `descripcion` varchar(200) NOT NULL,
  `ancho` float NOT NULL DEFAULT '0',
  `alto` float NOT NULL DEFAULT '0',
  `tasa_actualizacion` int(11) NOT NULL DEFAULT '5',
  `tasa_refresco` int(11) NOT NULL DEFAULT '600',
  `activo` tinyint(4) NOT NULL DEFAULT '0',
  `nombre` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

/*Table structure for table `mensajes` */

DROP TABLE IF EXISTS `mensajes`;

CREATE TABLE `mensajes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `alerta` bigint(20) DEFAULT '0' COMMENT 'ID de la alerta',
  `canal` int(2) DEFAULT '0' COMMENT 'Canal de la alerta (0=Llamada, 1=SMS, 2=Correo, 3=MMcall)',
  `tipo` int(2) DEFAULT '0' COMMENT '0=Inicio, 1-5=Escalación1, 9=Repetición, 11-15=Repetición de escalamiento',
  `proceso` bigint(20) DEFAULT '0' COMMENT 'ID del proceso',
  `alarma` bigint(20) DEFAULT '0' COMMENT 'ID de la alarma',
  `prioridad` int(1) DEFAULT '0' COMMENT 'Prioridad del mensaje',
  `estatus` varchar(20) DEFAULT 'A' COMMENT 'Estatus del mensaje',
  `lista` bigint(20) DEFAULT '0' COMMENT 'ID del Recipiente',
  `creada` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creación del mensaje',
  `enviada` datetime DEFAULT NULL COMMENT 'Fecha de envío del mensaje',
  `texto` varchar(20) DEFAULT '' COMMENT 'Mensaje',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`prioridad`,`estatus`),
  KEY `NewIndex2` (`estatus`),
  KEY `NewIndex3` (`canal`,`estatus`)
) ENGINE=MyISAM AUTO_INCREMENT=81612 DEFAULT CHARSET=latin1;

/*Table structure for table `mensajes_procesados` */

DROP TABLE IF EXISTS `mensajes_procesados`;

CREATE TABLE `mensajes_procesados` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del mensaje',
  `texto` varchar(400) DEFAULT NULL COMMENT 'Texto a enviar o dictar',
  `canal` int(2) DEFAULT '0' COMMENT 'Canal de difusión',
  `titulo` varchar(100) DEFAULT '0' COMMENT '(Para correo)',
  `prioridad` int(2) DEFAULT '0' COMMENT 'Proridad del mensaje',
  `fecha` date DEFAULT NULL COMMENT 'Fecha del mensaje (solo dura un día)',
  `mensaje` decimal(20,0) DEFAULT '0' COMMENT 'ID del mensaje',
  `estatus` char(20) DEFAULT 'A' COMMENT 'Estatus del envío',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`id`,`canal`,`prioridad`),
  KEY `NewIndex2` (`fecha`),
  KEY `NewIndex3` (`mensaje`)
) ENGINE=MyISAM AUTO_INCREMENT=822 DEFAULT CHARSET=latin1 COMMENT='Mensajes a enviar o llamar';

/*Table structure for table `movimientos_cab` */

DROP TABLE IF EXISTS `movimientos_cab`;

CREATE TABLE `movimientos_cab` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `requester` bigint(20) DEFAULT NULL COMMENT 'ID del requester',
  `pager` int(3) DEFAULT NULL COMMENT 'ID del pager',
  `transporte` bigint(20) DEFAULT '0',
  `chofer` bigint(20) DEFAULT '0',
  `vehiculo` bigint(20) DEFAULT '0',
  `carga` bigint(20) DEFAULT '0' COMMENT 'Carga',
  `origen` bigint(20) DEFAULT '0',
  `destino` bigint(20) DEFAULT '0',
  `actual_fecha` datetime DEFAULT NULL,
  `inicio` datetime DEFAULT NULL,
  `fin` datetime DEFAULT NULL,
  `tiempo` bigint(14) DEFAULT '0',
  `estado` int(2) DEFAULT '0' COMMENT 'Estado del movimiento',
  `alarmado` char(1) DEFAULT 'N',
  `alarmado_desde` datetime DEFAULT NULL,
  `transacciones` int(4) DEFAULT '0' COMMENT 'Número de movimientos del viaje',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`requester`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Cabecera de movimientos';

/*Table structure for table `movimientos_det` */

DROP TABLE IF EXISTS `movimientos_det`;

CREATE TABLE `movimientos_det` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `cabecera` bigint(20) DEFAULT '0' COMMENT 'ID del movimiento cabecera',
  `requester` bigint(20) DEFAULT '0' COMMENT 'ID del requester asociado',
  `origen` bigint(20) DEFAULT '0',
  `destino` bigint(20) DEFAULT '0',
  `des_inicio` datetime DEFAULT NULL,
  `des_fin` datetime DEFAULT NULL,
  `des_tiempo` bigint(10) DEFAULT '0',
  `des_estimado` bigint(10) DEFAULT '0',
  `des_alarmado` char(1) DEFAULT 'N',
  `des_alarmado_desde` datetime DEFAULT NULL,
  `inicio` datetime DEFAULT NULL,
  `fin` datetime DEFAULT NULL,
  `tiempo` bigint(10) DEFAULT '0',
  `estimado` bigint(10) DEFAULT '0',
  `alarmado` char(1) DEFAULT 'N',
  `alarmado_desde` datetime DEFAULT NULL,
  `estatus` int(1) DEFAULT '0',
  `estado` int(2) DEFAULT '0',
  `viaje` int(3) DEFAULT '0',
  `transporte` bigint(20) DEFAULT '0',
  `vehiculo` bigint(20) DEFAULT '0',
  `area` bigint(20) DEFAULT '0',
  `carga` bigint(20) DEFAULT '0',
  `chofer` bigint(20) DEFAULT '0',
  `espera` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`cabecera`),
  KEY `NewIndex2` (`requester`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;

/*Table structure for table `objetos` */

DROP TABLE IF EXISTS `objetos`;

CREATE TABLE `objetos` (
  `mapa_id` int(11) NOT NULL,
  `id` varchar(50) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `ultima_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mapa_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `politicas` */

DROP TABLE IF EXISTS `politicas`;

CREATE TABLE `politicas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `nombre` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nombre corto',
  `deunsolouso` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'De un sólo uso',
  `obligatoria` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Se requiere contraseña?',
  `vence` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT 'La contraseña vence?',
  `diasvencimiento` bigint(7) DEFAULT NULL COMMENT 'Días para vencerse',
  `aviso` bigint(7) DEFAULT NULL COMMENT 'Días de anticipación para avisar',
  `complejidad` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT 'Complejidad de la contraseña (1-2=largo,3=especiales,4=numeros,5=mayus/minus)',
  `usadas` int(2) DEFAULT NULL COMMENT 'Últimas contraseñas usadas',
  `caducidad` int(3) DEFAULT NULL COMMENT 'Días de gracia',
  `estatus` char(1) CHARACTER SET latin1 DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(20) DEFAULT NULL COMMENT 'Usuario que creó el registro',
  `modificado` bigint(20) DEFAULT NULL COMMENT 'Usuario que modificó el registro',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de políticas';

/*Table structure for table `pu_colores` */

DROP TABLE IF EXISTS `pu_colores`;

CREATE TABLE `pu_colores` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del tema',
  `planta` bigint(20) DEFAULT '0' COMMENT 'ID de la planta',
  `usuario` bigint(20) DEFAULT '0' COMMENT 'ID del usuario',
  `nombre` varchar(50) DEFAULT NULL COMMENT 'Nomre del tema',
  `personalizada` char(1) DEFAULT 'N' COMMENT 'Skin personalizada',
  `obligatorio` char(1) DEFAULT 'N' COMMENT 'Skin obligatorio',
  `seleccionado` char(1) DEFAULT 'N' COMMENT 'Skin seleccionado',
  `fondo_total` varchar(20) DEFAULT NULL COMMENT 'Color de fondo total',
  `fondo_barra_superior` varchar(20) DEFAULT NULL COMMENT 'Color de la barra superior',
  `fondo_barra_inferior` varchar(20) DEFAULT NULL COMMENT 'Color de la barra inferior',
  `fondo_aplicacion` varchar(20) DEFAULT NULL COMMENT 'Color de fondo',
  `fondo_seleccion` varchar(20) DEFAULT NULL COMMENT 'Color de fondo selección',
  `fondo_boton` varchar(20) DEFAULT NULL COMMENT 'Color de fondo botón ',
  `fondo_slider` varchar(20) DEFAULT NULL COMMENT 'Color de fondo slider',
  `fondo_tarjeta` varchar(20) DEFAULT NULL COMMENT 'Color de fondo de la tarjeta',
  `fondo_boton_inactivo` varchar(20) DEFAULT NULL COMMENT 'Color de fondo botón inactivo',
  `fondo_boton_positivo` varchar(20) DEFAULT NULL COMMENT 'Color de fondo botón positivo',
  `fondo_boton_negativo` varchar(20) DEFAULT NULL COMMENT 'Color de fondo botón negativo',
  `fondo_boton_barra` varchar(20) DEFAULT NULL COMMENT 'Color de fondo botón en barra',
  `fondo_tiptool` varchar(20) DEFAULT NULL COMMENT 'Color de fondo tiptool',
  `fondo_logo` varchar(20) DEFAULT NULL COMMENT 'Color de fondo logo',
  `fondo_snack_normal` varchar(20) DEFAULT NULL COMMENT 'Color de fondo snack normal',
  `fondo_snack_error` varchar(20) DEFAULT NULL COMMENT 'Color de fondo snack error',
  `borde_total` varchar(20) DEFAULT NULL COMMENT 'Color de borde',
  `borde_seleccion` varchar(20) DEFAULT NULL COMMENT 'Color de borde en selección',
  `borde_hover` varchar(20) DEFAULT NULL COMMENT 'Color de borde en Hover',
  `borde_boton` varchar(20) DEFAULT NULL COMMENT 'Color de borde de botones',
  `borde_boton_inactivo` varchar(20) DEFAULT NULL COMMENT 'Color de borde de inactivo',
  `borde_tarjeta` varchar(20) DEFAULT NULL COMMENT 'Color de borde de la tarjeta',
  `borde_tiptool` varchar(20) DEFAULT NULL COMMENT 'Color de borde del tiptool',
  `color_impar` varchar(20) DEFAULT NULL COMMENT 'Color impar',
  `color_par` varchar(20) DEFAULT NULL COMMENT 'Color par',
  `texto_tarjeta` varchar(20) DEFAULT NULL COMMENT 'Texto tarjeta',
  `texto_tarjeta_resalte` varchar(20) DEFAULT NULL COMMENT 'Texto tarjeta resaltado',
  `texto_barra_superior` varchar(20) DEFAULT NULL COMMENT 'Texto barra superior',
  `texto_barra_inferior` varchar(20) DEFAULT NULL COMMENT 'Texto barra inferior',
  `texto_boton` varchar(20) DEFAULT NULL COMMENT 'Texto botón',
  `texto_boton_inactivo` varchar(20) DEFAULT NULL COMMENT 'Texto botón inactivo',
  `texto_boton_positivo` varchar(20) DEFAULT NULL COMMENT 'Texto botón positivo',
  `texto_boton_negativo` varchar(20) DEFAULT NULL COMMENT 'Texto botón negativo',
  `texto_boton_barra` varchar(20) DEFAULT NULL COMMENT 'Texto botón barra',
  `texto_seleccion` varchar(20) DEFAULT NULL COMMENT 'Texto selección',
  `texto_tiptool` varchar(20) DEFAULT NULL COMMENT 'Texto tiptool',
  `texto_snack_normal` varchar(20) DEFAULT NULL COMMENT 'Texto snack normal',
  `texto_snack_error` varchar(20) DEFAULT NULL COMMENT 'Texto snack error',
  `texto_solo_texto` varchar(20) DEFAULT NULL COMMENT 'Texto solo lectura',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus',
  `eliminable` char(1) DEFAULT 'S',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Colores';

/*Table structure for table `pu_graficos` */

DROP TABLE IF EXISTS `pu_graficos`;

CREATE TABLE `pu_graficos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `usuario` bigint(11) DEFAULT NULL COMMENT 'ID del usuario',
  `visualizar` char(1) DEFAULT 'S' COMMENT 'Visualizar gráfico',
  `grafico` int(4) DEFAULT NULL COMMENT 'Número del gráfico',
  `titulo` varchar(100) DEFAULT NULL COMMENT 'Título del gráfico',
  `titulo_fuente` int(2) DEFAULT NULL COMMENT 'Fuente del título',
  `sub_titulo` varchar(100) DEFAULT NULL COMMENT 'Subtítulo del gráfico',
  `subtitulo_fuente` int(2) DEFAULT NULL COMMENT 'Fuente del subtítulo',
  `texto_x` varchar(100) DEFAULT NULL COMMENT 'Texto eje X',
  `texto_x_fuente` int(2) DEFAULT NULL COMMENT 'Fuente del eje X',
  `texto_y` varchar(100) DEFAULT '0' COMMENT 'Texto eje Y',
  `texto_y_fuente` int(2) DEFAULT NULL COMMENT 'Fuente del eje Y',
  `texto_z` varchar(100) DEFAULT '0' COMMENT 'Texto eje Z',
  `texto_z_fuente` int(2) DEFAULT NULL COMMENT 'Fuente del eje Z',
  `etiqueta_mostrar` char(1) DEFAULT NULL COMMENT 'Mostrar etiquetas',
  `etiqueta_fuente` int(2) DEFAULT NULL COMMENT 'Fuente de la etiqueta',
  `etiqueta_leyenda` varchar(30) DEFAULT NULL COMMENT 'Título de la leyenda',
  `etiqueta_color` varchar(20) DEFAULT NULL COMMENT 'Color de la etiqueta',
  `etiqueta_fondo` varchar(20) DEFAULT NULL COMMENT 'Color del fondo',
  `ancho` int(6) DEFAULT NULL COMMENT 'Ancho de la pantalla',
  `alto` int(6) DEFAULT '0' COMMENT 'Alto de la pantalla',
  `margen_arriba` int(4) DEFAULT NULL COMMENT 'Margen arriba',
  `margen_abajo` int(4) DEFAULT NULL COMMENT 'Margen abajo',
  `margen_izquierda` int(4) DEFAULT NULL COMMENT 'Margen izquierda',
  `margen_derecha` int(4) DEFAULT NULL COMMENT 'Margen derecha',
  `maximo_barras` int(2) DEFAULT '0' COMMENT 'Máximo de barras',
  `maximo_barraspct` int(3) DEFAULT '0' COMMENT 'PCT de máximo de barras',
  `agrupar` char(1) DEFAULT NULL COMMENT 'Agrupar el resto',
  `agrupar_posicion` char(1) DEFAULT NULL COMMENT 'P=Principio, F=Final, N=Ordenado',
  `agrupar_texto` varchar(30) DEFAULT NULL COMMENT 'Texto de la barra agrupada',
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de actualización',
  `periodo_tipo` int(2) DEFAULT NULL COMMENT 'Tipo de período (0: segundos, 1: minutos, 2: horas, 3: días, 4: semanas, 5: meses, 6: años, 10: DTD, 11: WTD, 12: MTD, 13: YTD)',
  `periodo_atras` bigint(8) DEFAULT NULL COMMENT 'Tiempo a recorrer hacía atrás',
  `mostrar_tabla` char(1) DEFAULT NULL COMMENT 'Mostrar tabla',
  `orden` char(1) DEFAULT NULL COMMENT 'Orden de la gráfica',
  `color_fondo_barras` varchar(20) DEFAULT NULL COMMENT 'Color de fondo de las barras',
  `color_letras` varchar(20) DEFAULT NULL COMMENT 'Color de las letras',
  `color_fondo` varchar(20) DEFAULT NULL COMMENT 'Color del fondo',
  `color_leyenda_fondo` varchar(20) DEFAULT NULL COMMENT 'Color del fondo de la leyenda',
  `color_leyenda` varchar(20) DEFAULT NULL COMMENT 'Color del texto de la leyenda',
  `ver_esperado` char(1) DEFAULT 'N' COMMENT 'Ver esperado',
  `grueso_esperado` int(2) DEFAULT NULL COMMENT 'Pixls del esperado',
  `color_esperado` varchar(20) DEFAULT NULL COMMENT 'Color del esperado',
  `texto_esperado` varchar(30) DEFAULT NULL COMMENT 'Texto para el valor esperado',
  `valor_esperado` decimal(20,3) DEFAULT '0.000' COMMENT 'Valor esperado',
  `incluir_ceros` char(1) DEFAULT 'N' COMMENT 'Incluir valores cero',
  `orden_grafica` char(1) DEFAULT 'N' COMMENT 'Orden de la gráfica (M=Mayor a menor, N= Menor a mayor, A=Alfabético)',
  `mostrarpct` char(1) DEFAULT 'N' COMMENT 'Mostrar frecuencia',
  `color_barra` varchar(20) DEFAULT NULL COMMENT 'Color de la barra',
  `color_barra_borde` varchar(20) DEFAULT NULL COMMENT 'Color de la barra borde',
  `color_barra_o` varchar(20) DEFAULT NULL COMMENT 'Color de la barra opcional',
  `color_barra_borde_o` varchar(20) DEFAULT NULL COMMENT 'Color de la barra borde opcional',
  `ver_leyenda` char(1) DEFAULT 'S' COMMENT 'Ver leyenda',
  `overlap` char(1) DEFAULT 'S' COMMENT 'Tipo de overlap',
  `adicionales` char(13) DEFAULT '0;0;0;0;0;0;0' COMMENT 'YTD, MTD, Año anterior, Mes anterior, Mismo mes Año anterior, Aplicar Filtro a los acumulados',
  `adicionales_colores` varchar(130) DEFAULT NULL COMMENT 'Colores',
  `adicionales_titulos` varchar(130) DEFAULT NULL,
  `oee` char(6) DEFAULT 'NNNSSS',
  `oee_colores` varchar(80) DEFAULT NULL,
  `oee_tipo` char(3) DEFAULT 'BBB',
  `oee_nombre` varchar(80) DEFAULT ';;',
  `tipo_principal` char(1) DEFAULT 'B',
  `colores_multiples` char(1) DEFAULT NULL COMMENT 'Usar colores diferentes',
  `color_spiline` varchar(20) DEFAULT NULL COMMENT 'Color del spline',
  `grueso_spiline` int(2) DEFAULT '0' COMMENT 'Pixls del spline',
  `mostrar_argumentos` char(1) DEFAULT 'S' COMMENT 'Mostrar argumentos',
  `activo` char(1) DEFAULT 'S' COMMENT 'Gráfico activo para el sistema?',
  `esperado_esquema` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`grafico`)
) ENGINE=MyISAM AUTO_INCREMENT=166 DEFAULT CHARSET=latin1 COMMENT='Preferencias de usuario (Gráficos)';

/*Table structure for table `relacion_usuarios_opciones` */

DROP TABLE IF EXISTS `relacion_usuarios_opciones`;

CREATE TABLE `relacion_usuarios_opciones` (
  `usuario` bigint(20) DEFAULT NULL COMMENT 'ID del número de parte',
  `opcion` bigint(6) DEFAULT NULL COMMENT 'ID de la ruta',
  KEY `NewIndex1` (`usuario`,`opcion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Relación usuarios y opciones del sistema';

/*Table structure for table `relacion_usuarios_operaciones` */

DROP TABLE IF EXISTS `relacion_usuarios_operaciones`;

CREATE TABLE `relacion_usuarios_operaciones` (
  `usuario` bigint(20) DEFAULT NULL COMMENT 'ID del número de parte',
  `proceso` bigint(20) DEFAULT NULL COMMENT 'ID de la ruta',
  `tipo` int(2) DEFAULT '0' COMMENT 'Catálogo asociado',
  KEY `NewIndex1` (`usuario`,`proceso`,`tipo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Relación entre usuarios y operaciones';

/*Table structure for table `relaciones` */

DROP TABLE IF EXISTS `relaciones`;

CREATE TABLE `relaciones` (
  `operacion` bigint(4) DEFAULT NULL COMMENT '1=Alertas',
  `indice` bigint(20) DEFAULT NULL COMMENT 'ID del registro principal a evaluar',
  `detalle` bigint(20) DEFAULT NULL COMMENT 'ID del registro detalle',
  KEY `NewIndex1` (`operacion`,`indice`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `relacionparos` */

DROP TABLE IF EXISTS `relacionparos`;

CREATE TABLE `relacionparos` (
  `paro` bigint(11) NOT NULL COMMENT 'ID del paro',
  `grupo` bigint(11) NOT NULL COMMENT 'ID del grupo',
  `equipo` bigint(11) NOT NULL COMMENT 'ID del equipo',
  PRIMARY KEY (`paro`,`grupo`,`equipo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Relacion paros versus equips';

/*Table structure for table `requesters` */

DROP TABLE IF EXISTS `requesters`;

CREATE TABLE `requesters` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `pager` int(3) DEFAULT '0' COMMENT 'ID del pager en MMCall',
  `nombre` varchar(30) DEFAULT NULL COMMENT 'Nombre asociado al requester',
  `area` bigint(20) DEFAULT '0',
  `color` varchar(20) DEFAULT NULL,
  `origen` bigint(20) DEFAULT '0',
  `destino` bigint(20) DEFAULT '0' COMMENT 'ID del área asignada',
  `estimado` bigint(10) DEFAULT '0',
  `chofer` bigint(20) DEFAULT '0',
  `vehiculo` bigint(20) DEFAULT '0',
  `transporte` bigint(20) DEFAULT '0',
  `movimiento` bigint(20) DEFAULT '0' COMMENT 'Registro actual',
  `estado` int(2) DEFAULT '0' COMMENT 'Estado',
  `mensaje` varchar(300) DEFAULT NULL,
  `mensaje_mmcall` varchar(40) DEFAULT NULL,
  `desde` datetime DEFAULT NULL,
  `hasta` datetime DEFAULT NULL,
  `alarmado` char(1) DEFAULT 'N',
  `alarmado_desde` datetime DEFAULT NULL,
  `carga` bigint(20) DEFAULT NULL,
  `estatus` int(1) DEFAULT '0',
  `repeticiones` int(3) DEFAULT '0' COMMENT 'Número de repeticiones',
  `ultima_repeticion` datetime DEFAULT NULL,
  `repeticiones_audio` int(3) DEFAULT '0',
  `ultima_repeticion_audio` datetime DEFAULT NULL,
  `viajes` int(4) DEFAULT '0' COMMENT 'Total viajes',
  `alarmas` int(4) DEFAULT '0' COMMENT 'Total alarmas',
  `tipo` int(1) DEFAULT '0' COMMENT 'Tipo: 0=Requester 1=Movil',
  `movil` varchar(30) DEFAULT NULL COMMENT 'Movil',
  `monitorear` char(1) DEFAULT 'N',
  `des_estimado` bigint(10) DEFAULT '0',
  `des_monitorear` char(1) DEFAULT 'N',
  `preasignado` char(1) DEFAULT 'N',
  `orden` int(6) DEFAULT '0',
  `fecha_recibo` datetime DEFAULT NULL,
  `espera_temporal` bigint(8) DEFAULT '0',
  `fecha_asignacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`pager`),
  KEY `NewIndex2` (`movil`),
  KEY `NewIndex3` (`estatus`,`estado`)
) ENGINE=MyISAM AUTO_INCREMENT=1524 DEFAULT CHARSET=utf16 COMMENT='Catálogo de requesters';

/*Table structure for table `sentencias` */

DROP TABLE IF EXISTS `sentencias`;

CREATE TABLE `sentencias` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `sentencia` varchar(5000) DEFAULT NULL,
  `estatus` char(1) DEFAULT 'N',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `elvis` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `status_objetos` */

DROP TABLE IF EXISTS `status_objetos`;

CREATE TABLE `status_objetos` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `color` varchar(10) NOT NULL,
  `normal` tinyint(4) NOT NULL DEFAULT '0',
  `mapa_Id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`mapa_Id`),
  KEY `fk_status_objetos_mapas_idx` (`mapa_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `tablas` */

DROP TABLE IF EXISTS `tablas`;

CREATE TABLE `tablas` (
  `id` int(6) NOT NULL COMMENT 'ID de la tabla',
  `nombre` varchar(50) DEFAULT NULL COMMENT 'Nombre de la tabla',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Catálogo de tablas';

/*Table structure for table `tipos_figuras` */

DROP TABLE IF EXISTS `tipos_figuras`;

CREATE TABLE `tipos_figuras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

/*Table structure for table `traduccion` */

DROP TABLE IF EXISTS `traduccion`;

CREATE TABLE `traduccion` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `literal` varchar(100) DEFAULT NULL COMMENT 'Literal a buscar',
  `idioma` varchar(5) DEFAULT NULL COMMENT 'Idioma',
  `traduccion` varchar(100) DEFAULT NULL COMMENT 'Traducción',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`literal`,`idioma`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='Tabla de traducción';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
