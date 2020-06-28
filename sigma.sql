/*
SQLyog Community v12.09 (64 bit)
MySQL - 5.6.13 : Database - sigmafm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sigmafm` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sigmafm`;

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
  `rechazos` datetime DEFAULT NULL,
  `variables` datetime DEFAULT NULL,
  `checklists` datetime DEFAULT NULL,
  `valores` datetime DEFAULT NULL,
  `planes_checklists` datetime DEFAULT NULL
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
) ENGINE=MyISAM AUTO_INCREMENT=36179 DEFAULT CHARSET=latin1 COMMENT='Detalle de alarmas';

/*Table structure for table `calidad_historia` */

DROP TABLE IF EXISTS `calidad_historia`;

CREATE TABLE `calidad_historia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `lote` bigint(20) DEFAULT NULL COMMENT 'ID del lote',
  `tipo` int(2) DEFAULT NULL COMMENT 'Tipo de movimiento',
  `parte` bigint(20) DEFAULT '0' COMMENT 'ID del Número de parte',
  `inspeccion_id` bigint(20) DEFAULT '0' COMMENT 'Número de inspección',
  `inspeccionado_por` bigint(20) DEFAULT '0' COMMENT 'Inspeccionado por (usuario)',
  `proceso` bigint(20) DEFAULT '0' COMMENT 'ID del proceso',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia de operación',
  `equipo` bigint(20) DEFAULT '0' COMMENT 'ID del equipo',
  `inicia` datetime DEFAULT NULL COMMENT 'Fecha de inicio en el sistema',
  `finaliza` datetime DEFAULT NULL COMMENT 'Fecha de fin en el sistema',
  `tiempo` bigint(12) DEFAULT '0' COMMENT 'Tiempo total',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`lote`),
  KEY `NewIndex2` (`lote`,`parte`,`proceso`),
  KEY `NewIndex3` (`lote`,`parte`,`proceso`,`equipo`,`inicia`),
  KEY `NewIndex4` (`lote`,`finaliza`)
) ENGINE=MyISAM AUTO_INCREMENT=212 DEFAULT CHARSET=latin1 COMMENT='Histórico de inspecciones de calidad';

/*Table structure for table `cargas` */

DROP TABLE IF EXISTS `cargas`;

CREATE TABLE `cargas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `fecha` datetime DEFAULT NULL COMMENT 'Fecha y hora de programación',
  `fecha_original` datetime DEFAULT NULL COMMENT 'Fecha original',
  `fecha_anterior` datetime DEFAULT NULL COMMENT 'Fecha anterior',
  `equipo` bigint(20) DEFAULT '0' COMMENT 'ID del equipo',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `alarma` char(1) DEFAULT 'S' COMMENT 'Generar alarma',
  `alarma_rep` char(1) DEFAULT 'N' COMMENT 'Alarma reportada?',
  `permitir_reprogramacion` char(1) DEFAULT 'S' COMMENT 'Permitir reprogramación?',
  `completada` char(1) DEFAULT 'N' COMMENT 'Carga completa',
  `carga` varchar(20) DEFAULT NULL COMMENT 'Número de carga',
  `reprogramaciones` int(4) DEFAULT '0' COMMENT 'Veces que se ha reprogramado',
  `alarma_rep_p` char(1) NOT NULL DEFAULT 'N',
  `alarma_rep_paso` char(1) DEFAULT NULL,
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1 COMMENT='Tabla de cargas';

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
  `proceso` char(1) DEFAULT 'S' COMMENT 'Proceso asociado a la alerta',
  `linea` char(1) DEFAULT 'S' COMMENT 'Línea asignada a la alerta',
  `maquina` char(1) DEFAULT 'S' COMMENT 'Máquina asignada a la alerta',
  `area` char(1) DEFAULT 'S' COMMENT 'Área asignada a la alerta',
  `falla` char(1) DEFAULT 'S' COMMENT 'Falla asignada a la alerta',
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
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=latin1 COMMENT='Catálogo de alertas';

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
  `id_mmcall` varchar(500) DEFAULT NULL COMMENT 'ID de MMCall',
  `recipiente` bigint(20) DEFAULT '0' COMMENT 'ID del recipiente',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`),
  KEY `Index01` (`url_mmcall`)
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=latin1 COMMENT='Catálogo de áreas';

/*Table structure for table `cat_checklists` */

DROP TABLE IF EXISTS `cat_checklists`;

CREATE TABLE `cat_checklists` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `planta` bigint(20) DEFAULT NULL COMMENT 'ID de la planta',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `referencia` varchar(30) DEFAULT NULL,
  `tipo` bigint(20) DEFAULT '0' COMMENT 'ID de tipo',
  `departamento` bigint(20) DEFAULT '0',
  `equipo` bigint(20) DEFAULT '0',
  `equipo_automatico` char(1) DEFAULT 'N',
  `imagen` varchar(255) DEFAULT NULL,
  `variables` char(1) DEFAULT 'N',
  `notas` varchar(300) DEFAULT NULL,
  `url_mmcall` varchar(1000) DEFAULT NULL,
  `tiempo` bigint(10) DEFAULT '0',
  `recipiente` bigint(20) DEFAULT '0',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(20) DEFAULT '0' COMMENT 'Creado por',
  `modificado` bigint(20) DEFAULT '0' COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COMMENT='Catálogo de correos';

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
  `habilitado` char(1) DEFAULT 'S' COMMENT 'Habilitar como disponible',
  `hora_desde` time DEFAULT NULL COMMENT 'Hora de inicio',
  `hora_hasta` time DEFAULT NULL COMMENT 'Hora de fin',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(20) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(20) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COMMENT='Catálogo de listas de distribución';

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

/*Table structure for table `cat_fallas` */

DROP TABLE IF EXISTS `cat_fallas`;

CREATE TABLE `cat_fallas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `planta` bigint(20) DEFAULT '0' COMMENT 'ID de la planta',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Referencia con el sistema',
  `nombre` varchar(200) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `imagen` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Imagen a mostrar',
  `linea` char(1) CHARACTER SET latin1 DEFAULT 'N' COMMENT 'ID de la línea',
  `maquina` char(1) CHARACTER SET latin1 DEFAULT 'N' COMMENT 'ID de la máquina',
  `area` char(1) CHARACTER SET latin1 DEFAULT 'N' COMMENT 'ID del área',
  `agrupador_1` bigint(20) DEFAULT '0' COMMENT 'Agrupador (1)',
  `afecta_oee` char(1) DEFAULT 'S',
  `agrupador_2` bigint(20) DEFAULT '0' COMMENT 'Agrupador (2)',
  `ultima_incidencia` datetime DEFAULT NULL COMMENT 'Última vez que pasó',
  `notas` varchar(300) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Notas varias',
  `url_mmcall` varchar(1000) CHARACTER SET latin1 DEFAULT NULL COMMENT 'URL de MMCall',
  `estatus` char(1) CHARACTER SET latin1 DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  `codigo` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1431 DEFAULT CHARSET=utf16 COMMENT='Catálogo de fallas';

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
  `url_mmcall` varchar(1000) DEFAULT NULL COMMENT 'URL de MMCall',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(20) DEFAULT '0' COMMENT 'Creado por',
  `modificado` bigint(20) DEFAULT '0' COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1 COMMENT='Tablas generales';

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

/*Table structure for table `cat_idiomas` */

DROP TABLE IF EXISTS `cat_idiomas`;

CREATE TABLE `cat_idiomas` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `codigo` varchar(5) DEFAULT NULL COMMENT 'Código del idioma',
  `nombre` varchar(50) DEFAULT '0' COMMENT 'Nombre del idioma',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `cat_lineas` */

DROP TABLE IF EXISTS `cat_lineas`;

CREATE TABLE `cat_lineas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `planta` bigint(20) DEFAULT NULL COMMENT 'ID de la planta',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia con el sistema',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `agrupador_1` bigint(20) DEFAULT '0' COMMENT 'Agrupador (1)',
  `agrupador_2` bigint(20) DEFAULT '0' COMMENT 'Agrupador (2)',
  `url_mmcall` varchar(1000) DEFAULT NULL COMMENT 'URL de MMCall',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `disponibilidad` int(1) DEFAULT '0',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(20) DEFAULT '0' COMMENT 'Creado por',
  `modificado` bigint(20) DEFAULT '0' COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COMMENT='Catálogo de líneas';

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

/*Table structure for table `cat_maquinas` */

DROP TABLE IF EXISTS `cat_maquinas`;

CREATE TABLE `cat_maquinas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `disponibilidad` int(2) DEFAULT '0' COMMENT 'Disponibilidad de la empresa',
  `planta` bigint(20) DEFAULT NULL COMMENT 'ID de la planta',
  `linea` bigint(20) DEFAULT '0' COMMENT 'ID de la línea (0=Suelta)',
  `proceso` bigint(20) DEFAULT '0' COMMENT 'ID del proceso asociado',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `programar` char(1) DEFAULT 'N' COMMENT 'Permite la programación',
  `ultimo_parte` bigint(20) DEFAULT '0' COMMENT 'Última parte',
  `capacidad` bigint(12) DEFAULT '0' COMMENT 'Capacidad en segundos',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia con el sistema',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `tipo` bigint(20) DEFAULT '0' COMMENT 'Tipo de máquina',
  `agrupador_1` bigint(20) DEFAULT '0' COMMENT 'Agrupador (1)',
  `agrupador_2` bigint(20) DEFAULT '0' COMMENT 'Agrupador (2)',
  `url_mmcall` varchar(1000) DEFAULT NULL COMMENT 'URL de MMCall',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `oee` char(1) DEFAULT 'N',
  `oee_turno_actual` bigint(20) DEFAULT '0',
  `oee_tripulacion_actual` bigint(20) DEFAULT '0',
  `oee_lote_actual` bigint(20) DEFAULT '0',
  `oee_parte_actual` bigint(20) DEFAULT '0',
  `oee_tipo_rate` int(2) DEFAULT '0' COMMENT 'OJO/Quitar',
  `oee_permitir_resto` char(1) DEFAULT 'N' COMMENT 'OJO/Quitar',
  `oee_objetivo_por_equipo` char(1) DEFAULT 'N' COMMENT 'OJO/Quitar',
  `oee_objetivo_piezas` bigint(20) DEFAULT '0' COMMENT 'OJO/Quitar',
  `oee_objetivo_piezas_base` bigint(20) DEFAULT '0' COMMENT 'OJO/Quitar',
  `oee_progreso_reiniciar` char(1) DEFAULT 'N' COMMENT 'OJO/Quitar',
  `oee_reiniciar_tipo` int(2) DEFAULT '0' COMMENT 'OJO/Quitar',
  `oee_reiniciar_hora` int(2) DEFAULT '0' COMMENT 'OJO/Quitar',
  `oee_umbral_produccion` bigint(6) DEFAULT '0' COMMENT 'Segundos a esperar para paro',
  `oee_umbral_alerta` bigint(6) DEFAULT '0' COMMENT 'Segundos a esperar para alerta',
  `oee_estado` char(1) DEFAULT 'N' COMMENT 'Estado de la máquina',
  `oee_estado_desde` datetime DEFAULT NULL COMMENT 'Fecha del último estado',
  `oee_estado_cambio` datetime DEFAULT NULL COMMENT 'Fecha de cambio',
  `confirmar_reparacion` char(1) DEFAULT 'N' COMMENT 'Confirmar reparacion',
  `oee_historico_rate` int(1) NOT NULL DEFAULT '0',
  `oee_historico_rate_reiniciar` int(1) NOT NULL DEFAULT '0',
  `boton_1` datetime DEFAULT NULL,
  `boton_2` datetime DEFAULT NULL,
  `id_mmcall` varchar(500) DEFAULT NULL COMMENT 'ID de MMCall',
  `usuario` bigint(20) DEFAULT '0' COMMENT 'ID del usuario',
  `tipo_andon` int(1) DEFAULT '0' COMMENT 'Tipo de botonera',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `id_mapa` bigint(20) DEFAULT '0',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(20) DEFAULT '0' COMMENT 'Creado por',
  `modificado` bigint(20) DEFAULT '0' COMMENT 'Modificado por',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`linea`),
  KEY `Index01` (`id_mmcall`)
) ENGINE=MyISAM AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1 COMMENT='Catálogo de máquinas';

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `tipo` bigint(20) DEFAULT '0' COMMENT 'Tipo de paro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `agrupador1` bigint(20) DEFAULT '0' COMMENT 'ID del agrupador (1)',
  `agrupador2` bigint(20) DEFAULT '0' COMMENT 'ID del agrupador (2)',
  `adelantar` char(1) DEFAULT 'N' COMMENT 'Se puede adelantar?',
  `cancelar` char(1) DEFAULT 'N' COMMENT 'Se puede cancelar?',
  `con_clave` char(1) DEFAULT 'N' COMMENT 'Se puede cabiar con clave',
  `una_vez` char(1) DEFAULT 'N' COMMENT 'Paro de una vez',
  `periodico` char(1) DEFAULT 'N' COMMENT 'Es un paro periódico',
  `semana` char(7) DEFAULT NULL COMMENT 'Día de semana',
  `habiles` char(1) DEFAULT NULL COMMENT 'Se aplica en día no hábiles',
  `desde` time DEFAULT NULL COMMENT 'Hora de inicio',
  `hasta` time DEFAULT NULL COMMENT 'Hora de fin',
  `inicia` date DEFAULT NULL COMMENT 'Fecha de inicio',
  `finaliza` date DEFAULT NULL COMMENT 'Fecha de finalización',
  `tiempo_seg` bigint(10) DEFAULT NULL COMMENT 'Tiempo del pago en segundos',
  `clendario` bigint(20) DEFAULT '0' COMMENT 'ID del calenadario',
  `carpeta` varchar(255) DEFAULT NULL COMMENT 'Carpeta de imagenes y videos',
  `defecto` char(1) DEFAULT NULL COMMENT 'Registro por defecto',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(20) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(20) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Catálogo de paros';

/*Table structure for table `cat_partes` */

DROP TABLE IF EXISTS `cat_partes`;

CREATE TABLE `cat_partes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia con el sistema',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `prefijo` varchar(30) DEFAULT NULL COMMENT 'Prefijo del registro',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `ruta` bigint(20) DEFAULT '0' COMMENT 'Ruta de fabricación asociada',
  `tipo` int(2) DEFAULT '0' COMMENT 'Tipo de item (0=Producción, 1=SMED/Herramentales, 2=Modelos)',
  `maquinas` char(1) DEFAULT 'N',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1132 DEFAULT CHARSET=latin1 COMMENT='Catálogo de numeros de parte';

/*Table structure for table `cat_partes_smed` */

DROP TABLE IF EXISTS `cat_partes_smed`;

CREATE TABLE `cat_partes_smed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia con el sistema',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `prefijo` varchar(30) DEFAULT NULL COMMENT 'Prefijo del registro',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `ruta` bigint(20) DEFAULT '0' COMMENT 'Ruta de fabricación asociada',
  `tipo` int(2) DEFAULT '0' COMMENT 'Tipo de item (0=Producción, 1=SMED/Herramentales, 2=Modelos)',
  `maquinas` char(1) DEFAULT 'N',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1126 DEFAULT CHARSET=latin1;

/*Table structure for table `cat_plantas` */

DROP TABLE IF EXISTS `cat_plantas`;

CREATE TABLE `cat_plantas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia con el sistema',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `idioma` int(4) DEFAULT '0',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COMMENT='Catálogo de plantas';

/*Table structure for table `cat_procesos` */

DROP TABLE IF EXISTS `cat_procesos`;

CREATE TABLE `cat_procesos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia con el sistema',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `tipo` char(1) DEFAULT NULL COMMENT 'Tipo de proceso: N = Normal, E = Espera',
  `capacidad_stock` bigint(6) DEFAULT '0' COMMENT 'Capacidad en Stock (lotes)',
  `capacidad_proceso` bigint(6) DEFAULT '0' COMMENT 'Capacidad en proceso (lotes)',
  `reduccion_setup` char(1) NOT NULL DEFAULT 'S',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`referencia`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COMMENT='Catalogo de procesos';

/*Table structure for table `cat_rutas` */

DROP TABLE IF EXISTS `cat_rutas`;

CREATE TABLE `cat_rutas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia con el sistema',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `prefijo` varchar(30) DEFAULT NULL COMMENT 'Prefijo del registro',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `alarma` char(1) DEFAULT NULL COMMENT 'Genera alarmas?',
  `inicia` int(6) DEFAULT NULL,
  `finaliza` int(6) DEFAULT NULL,
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COMMENT='Catálogo de rutas de producción';

/*Table structure for table `cat_situaciones` */

DROP TABLE IF EXISTS `cat_situaciones`;

CREATE TABLE `cat_situaciones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia con el sistema',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `tipo` int(2) DEFAULT NULL COMMENT 'Tipo de situación (0=Calidad, 50= Scrap)',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Catálogo de situaciones';

/*Table structure for table `cat_tripulacion` */

DROP TABLE IF EXISTS `cat_tripulacion`;

CREATE TABLE `cat_tripulacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `planta` bigint(20) DEFAULT NULL COMMENT 'ID de la planta',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia con el sistema',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `compania` bigint(20) DEFAULT '0' COMMENT 'Compañía asociada',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='Catálogo de tripulaciones';

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
  `usuario` bigint(20) DEFAULT '0' COMMENT 'ID del usuario',
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
  `notas` varchar(100) DEFAULT NULL COMMENT 'Notas varias',
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
  `idioma` int(4) DEFAULT '0',
  `planta_defecto` bigint(20) DEFAULT '0',
  `plantas` char(1) DEFAULT 'S',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT '0' COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT '0' COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=237 DEFAULT CHARSET=latin1 COMMENT='Catalogo de usuarios';

/*Table structure for table `cat_variables` */

DROP TABLE IF EXISTS `cat_variables`;

CREATE TABLE `cat_variables` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `planta` bigint(20) DEFAULT NULL COMMENT 'ID de la planta',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia con el sistema',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `prefijo` varchar(20) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `tipo` bigint(20) DEFAULT '0' COMMENT 'Agrupador (1)',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `maquinas` char(1) DEFAULT 'S',
  `url_mmcall` varchar(1000) DEFAULT NULL COMMENT 'URL de MMCall',
  `unidad` bigint(20) DEFAULT '0' COMMENT 'ID de MMCall',
  `recipiente` bigint(20) DEFAULT '0' COMMENT 'ID del recipiente',
  `tipo_valor` int(1) DEFAULT '0',
  `alarma_binaria` int(1) DEFAULT '0',
  `minimo` decimal(25,10) DEFAULT NULL,
  `maximo` decimal(25,10) DEFAULT NULL,
  `por_defecto` varchar(50) DEFAULT NULL,
  `requerida` char(1) DEFAULT 'N',
  `acumular` char(1) DEFAULT 'N',
  `sensor` int(10) DEFAULT '0',
  `sobrescribir` char(1) DEFAULT 'N',
  `reiniciar` char(1) DEFAULT 'N',
  `tope` decimal(25,10) DEFAULT '0.0000000000',
  `reiniciar_en` decimal(25,10) DEFAULT '0.0000000000',
  `van` decimal(25,10) DEFAULT '0.0000000000',
  `fecha_reiniico` datetime DEFAULT NULL,
  `fecha_tope` datetime DEFAULT NULL,
  `alarmado_desde` datetime DEFAULT NULL,
  `alarmado` char(1) DEFAULT 'N',
  `ultima_lectura_fecha` datetime DEFAULT NULL,
  `ultima_lectura_valor` decimal(25,10) DEFAULT NULL,
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`),
  KEY `Index01` (`url_mmcall`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Table structure for table `causa_raiz` */

DROP TABLE IF EXISTS `causa_raiz`;

CREATE TABLE `causa_raiz` (
  `reporte` bigint(20) NOT NULL DEFAULT '0' COMMENT 'ID del reporte',
  `p1` varchar(500) DEFAULT NULL,
  `p2` varchar(500) DEFAULT NULL,
  `p3` varchar(500) DEFAULT NULL,
  `p4` varchar(500) DEFAULT NULL,
  `p5` varchar(500) DEFAULT NULL,
  `plan` varchar(500) DEFAULT NULL,
  `fecha` varchar(100) DEFAULT NULL,
  `responsable` varchar(300) DEFAULT NULL,
  `departamento` varchar(300) DEFAULT NULL,
  `mano_de_obra` varchar(500) DEFAULT NULL,
  `maquina` varchar(500) DEFAULT NULL,
  `medio_ambiente` varchar(500) DEFAULT NULL,
  `metodo` varchar(500) DEFAULT NULL,
  `material` varchar(500) DEFAULT NULL,
  `comentarios` varchar(500) DEFAULT NULL,
  `creado` bigint(20) DEFAULT '0',
  `modificado` bigint(20) DEFAULT '0',
  `creacion` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`reporte`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `checkeje_cab` */

DROP TABLE IF EXISTS `checkeje_cab`;

CREATE TABLE `checkeje_cab` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `checklist` bigint(20) DEFAULT '0' COMMENT 'ID del checklist',
  `plan` bigint(20) DEFAULT '0' COMMENT 'ID del plan',
  `planta` bigint(20) DEFAULT NULL COMMENT 'ID de la planta',
  `tipo` int(1) DEFAULT '0' COMMENT 'Tipo de creación (0=Automática; 1=Manual)',
  `alarmado` char(1) DEFAULT 'N' COMMENT 'Checklist alarmado',
  `alarmado_fecha` datetime DEFAULT NULL COMMENT 'Fecha en que se alarmó',
  `alarmado_variable` char(1) DEFAULT NULL COMMENT 'Checklist alarmado por variable',
  `alarmado_variable_fecha` datetime DEFAULT NULL COMMENT 'Fecha en que se alarmó por variable',
  `checklist.Enabled = False` bigint(20) DEFAULT '0',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `estado` int(2) DEFAULT '0' COMMENT 'Estado del checklist',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `iniciado` datetime DEFAULT NULL COMMENT 'Fecha de inicio',
  `finalizado` datetime DEFAULT NULL COMMENT 'Fecha de fin',
  `tiempo` bigint(6) DEFAULT '0' COMMENT 'Tiempo usado por el checklist',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Table structure for table `checkeje_det` */

DROP TABLE IF EXISTS `checkeje_det`;

CREATE TABLE `checkeje_det` (
  `checklist` bigint(20) DEFAULT '0' COMMENT 'ID del checklist',
  `variable` bigint(20) DEFAULT '0' COMMENT 'ID del variable',
  `orden` int(4) DEFAULT '0' COMMENT 'Orden en el checklist',
  `equipo` bigint(20) DEFAULT '0' COMMENT 'ID del equipo',
  `valor_num` decimal(25,10) DEFAULT '0.0000000000',
  `valor_tabla` int(3) DEFAULT '0',
  `valor_directo` varchar(50) DEFAULT NULL,
  `alarmada` char(1) DEFAULT NULL,
  `fecha_alarma` datetime DEFAULT NULL,
  KEY `checklist` (`checklist`,`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `configuracion` */

DROP TABLE IF EXISTS `configuracion`;

CREATE TABLE `configuracion` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `planta` varchar(100) DEFAULT NULL COMMENT 'Nombre de la planta',
  `rfc` varchar(30) DEFAULT NULL COMMENT 'RFC',
  `licencia` varchar(50) DEFAULT NULL COMMENT 'Número de licencia',
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
  `puerto_comm4` varchar(10) DEFAULT NULL COMMENT 'Puerto comm (4)',
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
  `usar_clave_falla` char(1) DEFAULT NULL COMMENT 'Usar clave de falla',
  `mostrar_numero` char(1) DEFAULT NULL COMMENT 'Mostrar el número de reporte',
  `turno_actual` bigint(20) DEFAULT '0' COMMENT 'ID del turno',
  `dimension` varchar(20) DEFAULT NULL COMMENT 'Dimension de la aplicación',
  `tiempo_andon` int(6) DEFAULT '0' COMMENT 'Tiempo de espera etre repeticionesANDOn',
  `lectura_pendiente` int(1) DEFAULT '0' COMMENT 'Lectura pendiente?',
  `ver_nombre_planta` char(1) DEFAULT NULL COMMENT 'Ver titulo del mapa',
  `oee_mostrar_paro` char(1) DEFAULT 'N' COMMENT 'Mostrar mensaje de paros',
  `carrusel_oee` int(1) DEFAULT '0' COMMENT 'Tipo de carrusel OEE (0=Todas las máquinas, 1=Sólo maquinas produciendo)',
  `carrusel_tiempo` bigint(6) DEFAULT '0' COMMENT 'Tiempo de visualización de la máquina en segundos',
  `esperado_oee` decimal(6,2) DEFAULT '0.00',
  `esperado_ftq` decimal(6,2) DEFAULT '0.00',
  `esperado_efi` decimal(6,2) DEFAULT '0.00',
  `esperado_dis` decimal(6,2) DEFAULT '0.00',
  `esperado_mttr` decimal(15,5) DEFAULT '0.00000',
  `esperado_mtbf` decimal(15,5) DEFAULT '0.00000',
  `reportes_inicial` int(1) DEFAULT '0' COMMENT 'Automaticamente ver todos',
  `turno_oee` bigint(20) DEFAULT '0',
  `pagers_val` char(1) DEFAULT NULL COMMENT 'S',
  `permitir_multiples_reportes` char(1) DEFAULT 'N',
  `ver_reportes_final` char(1) DEFAULT 'N',
  `andon_prorrateado` char(1) DEFAULT 'S',
  `audios_repeticiones` int(3) DEFAULT '0',
  `tiempo_audios` int(4) DEFAULT '0',
  `audio_rate` int(2) DEFAULT '0',
  `audios_externos` char(1) DEFAULT NULL,
  `audios_externos_carpeta` varchar(500) DEFAULT NULL,
  `audios_externos_modo` int(2) DEFAULT '0',
  `audios_externos_pausa` int(4) DEFAULT '0',
  `programacion` bigint(10) DEFAULT '0' COMMENT 'Programacion',
  `hibrido_mostrar_reparacion` char(1) DEFAULT 'N',
  `hibrido_alarmar_ubicacion` char(1) DEFAULT 'N',
  `hibrido_alarmar_reparacion` char(1) DEFAULT 'N',
  `mail_vencimiento` varchar(200) DEFAULT NULL COMMENT 'Mails para notificar el vencimiento',
  `finalizar_sesion` int(4) DEFAULT '0',
  `wip_salto_adelante` char(1) DEFAULT 'S',
  `wip_salto_detras` char(1) DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

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
  `filtrooper` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Total operaciones filtradas',
  `filtronpar` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Total Números de parte filtradas',
  `filtrolin` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Total Números de parte filtradas',
  `filtromaq` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Total Números de parte filtradas',
  `filtroare` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Total Números de parte filtradas',
  `filtrofal` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Total Números de parte filtradas',
  `filtromq1` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Total Números de parte filtradas',
  `filtromq2` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Total Números de parte filtradas',
  `filtromq3` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Total Números de parte filtradas',
  `filtrofa1` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Total Números de parte filtradas',
  `filtrofa2` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Total Números de parte filtradas',
  `filtrotec` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Total Números de parte filtradas',
  `filtrotur` char(1) COLLATE utf8_bin DEFAULT 'N',
  `filtroord` char(1) COLLATE utf8_bin DEFAULT 'N',
  `filtropar` char(1) COLLATE utf8_bin DEFAULT 'N',
  `filtrocla` char(1) COLLATE utf8_bin DEFAULT 'N',
  `filtroori` char(1) COLLATE utf8_bin DEFAULT 'N',
  `visualizar` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Visualizar todo',
  `general` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Consulta general',
  `actualizacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`usuario`),
  KEY `NewIndex2` (`usuario`,`general`)
) ENGINE=MyISAM AUTO_INCREMENT=498 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de consultas';

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

/*Table structure for table `defectos_info` */

DROP TABLE IF EXISTS `defectos_info`;

CREATE TABLE `defectos_info` (
  `corte` bigint(20) DEFAULT '0' COMMENT 'ID del corte',
  `piezas` decimal(25,10) DEFAULT '0.0000000000' COMMENT 'Tiempo del paro',
  `defecto` bigint(20) DEFAULT '0' COMMENT 'ID del defecto',
  `fecha` datetime DEFAULT NULL COMMENT 'Fecha del defecto',
  `dia` date DEFAULT NULL COMMENT 'Dia de control',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del defecto',
  `tipo` char(1) DEFAULT 'C' COMMENT 'A=Acumulado, C=Corte',
  UNIQUE KEY `NewIndex1` (`corte`,`tipo`,`estatus`),
  KEY `NewIndex2` (`corte`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `det_calendario` */

DROP TABLE IF EXISTS `det_calendario`;

CREATE TABLE `det_calendario` (
  `calendario` bigint(11) NOT NULL COMMENT 'ID del calendaro',
  `fecha` date NOT NULL COMMENT 'Fecha',
  `descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripción',
  `imagen` varchar(100) DEFAULT NULL COMMENT 'Imagen',
  PRIMARY KEY (`calendario`,`fecha`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Detalle del calendario';

/*Table structure for table `det_checklist` */

DROP TABLE IF EXISTS `det_checklist`;

CREATE TABLE `det_checklist` (
  `checklist` bigint(20) DEFAULT '0' COMMENT 'ID del checklist',
  `variable` bigint(20) DEFAULT '0' COMMENT 'ID del variable',
  `orden` int(4) DEFAULT '0' COMMENT 'Orden en el checklist',
  `equipo` bigint(20) DEFAULT '0' COMMENT 'ID del equipo',
  KEY `checklist` (`checklist`,`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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

/*Table structure for table `det_plan_checklists` */

DROP TABLE IF EXISTS `det_plan_checklists`;

CREATE TABLE `det_plan_checklists` (
  `plan` bigint(20) DEFAULT NULL COMMENT 'ID del plan',
  `checklist` bigint(20) DEFAULT NULL COMMENT 'ID del checklist'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `det_procesos` */

DROP TABLE IF EXISTS `det_procesos`;

CREATE TABLE `det_procesos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia con el sistema',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `prefijo` varchar(30) DEFAULT NULL COMMENT 'Prefijo del registro',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `capacidad` bigint(12) DEFAULT '0' COMMENT 'Tiempo general de un lote en stock (segundos)',
  `proceso` bigint(20) DEFAULT NULL COMMENT 'ID del proceso asociado',
  `programar` char(1) DEFAULT 'N' COMMENT 'Permitir la programación',
  `ultimo_parte` bigint(20) DEFAULT '0',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

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

/*Table structure for table `det_rutas` */

DROP TABLE IF EXISTS `det_rutas`;

CREATE TABLE `det_rutas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `ruta` bigint(20) DEFAULT NULL COMMENT 'ID de la ruta',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia de la operación',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'Referencia con el sistema',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `prefijo` varchar(30) DEFAULT NULL COMMENT 'Prefijo del registro',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `tiempo_stock` bigint(12) DEFAULT '0' COMMENT 'Tiempo general de un lote en stock (segundos)',
  `tiempo_proceso` bigint(12) DEFAULT '0' COMMENT 'Tiempo general de un lote en proceso (segundos)',
  `tiempo_setup` bigint(12) DEFAULT '0' COMMENT 'Tiempo de preparación',
  `proceso` bigint(20) DEFAULT NULL COMMENT 'ID del proceso asociado',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`ruta`,`secuencia`)
) ENGINE=MyISAM AUTO_INCREMENT=747 DEFAULT CHARSET=latin1 COMMENT='Detalle de rutas';

/*Table structure for table `detalleparos` */

DROP TABLE IF EXISTS `detalleparos`;

CREATE TABLE `detalleparos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `planta` bigint(20) DEFAULT '0' COMMENT 'ID de la planta',
  `paro` varchar(50) DEFAULT NULL COMMENT 'ID del paro',
  `reporte` bigint(20) NOT NULL DEFAULT '0',
  `tipo` bigint(20) DEFAULT '0' COMMENT 'ID tipo de paro',
  `clase` int(2) DEFAULT '0' COMMENT 'Clase de paro (0=planeado, 1=No planeado, 2=Manual)',
  `area` bigint(20) DEFAULT '0' COMMENT 'ID del área responsable del paro',
  `masivo` char(1) DEFAULT 'N',
  `hora_inicial` varchar(8) DEFAULT NULL,
  `hora_final` varchar(8) DEFAULT NULL,
  `maquina` bigint(20) DEFAULT '0' COMMENT 'ID de la máquina',
  `fecha` date DEFAULT NULL COMMENT 'Fecha para reporte',
  `desde` datetime DEFAULT NULL COMMENT 'Fecha y hora de inicio según plan',
  `hasta` datetime DEFAULT NULL COMMENT 'Fecha y hora de fin según plan',
  `tiempo` bigint(12) DEFAULT '0' COMMENT 'Tiempo real del paro',
  `turno` bigint(20) DEFAULT '0' COMMENT 'ID del turno',
  `inicio` bigint(20) DEFAULT '0' COMMENT 'Usuario que inició',
  `finalizo` bigint(20) DEFAULT '0' COMMENT 'Usuario que finalizó',
  `inicia` datetime DEFAULT NULL COMMENT 'Fecha y hora de inicio real',
  `finaliza` datetime DEFAULT NULL COMMENT 'Fecha y hora de finalización real',
  `finalizo_accion` char(1) DEFAULT 'P' COMMENT 'Forma de finalizar (M=Manual, P=Por conteo de piezas, T=Por tiempo)',
  `contabilizar` char(1) DEFAULT 'S' COMMENT 'Contabilizar paro (S=Si, N=No, A=Por aprobar)',
  `origen` char(1) DEFAULT 'M' COMMENT 'Origen del plan (N=Normal, M=Desde la máquina)',
  `clave` varchar(20) DEFAULT NULL COMMENT 'Clave de Aprobación/Conversión',
  `aprobador` bigint(11) DEFAULT '0' COMMENT 'Usuario que aprobó la conversión',
  `finaliza_sensor` char(1) DEFAULT 'N' COMMENT 'Se finaliza el paro al contar piezas',
  `estado` char(1) DEFAULT 'L' COMMENT 'Estado del paro (P=Preparando, L=Listo, C=En curso, F=Finalizado)',
  `desde_original` datetime DEFAULT NULL,
  `hasta_original` datetime DEFAULT NULL,
  `cambiado_por` bigint(20) DEFAULT '0',
  `cambiado_fecha` datetime DEFAULT NULL,
  `cambiado_causa` bigint(20) DEFAULT '0' COMMENT 'ID de la cancelación',
  `corte` datetime DEFAULT NULL COMMENT 'Fecha y hora del corte',
  `notas` varchar(100) DEFAULT NULL COMMENT 'Detalle del paro',
  `resultados` varchar(100) DEFAULT NULL COMMENT 'Resutado del paro',
  `parte` bigint(20) DEFAULT '0',
  `lote` bigint(20) DEFAULT '0',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del paro',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`desde`,`hasta`),
  KEY `NewIndex2` (`maquina`,`tipo`,`estado`),
  KEY `NewIndex3` (`maquina`,`desde`,`hasta`,`estado`,`estatus`)
) ENGINE=MyISAM AUTO_INCREMENT=47977 DEFAULT CHARSET=latin1 COMMENT='Detalle de paros';

/*Table structure for table `detallerechazos` */

DROP TABLE IF EXISTS `detallerechazos`;

CREATE TABLE `detallerechazos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `planta` bigint(20) DEFAULT '0' COMMENT 'ID de la planta',
  `rechazo` varchar(100) DEFAULT NULL COMMENT 'Texto del rechazo',
  `tipo` bigint(20) DEFAULT '0' COMMENT 'ID tipo de paro',
  `area` bigint(20) DEFAULT '0' COMMENT 'ID del área responsable del paro',
  `equipo` bigint(20) DEFAULT '0' COMMENT 'ID de la máquina',
  `fecha` date DEFAULT NULL COMMENT 'Fecha para reporte',
  `turno` bigint(20) DEFAULT '0' COMMENT 'ID del turno',
  `origen` int(1) DEFAULT '0' COMMENT 'Origen del plan (N=Normal, M=Desde la máquina)',
  `corte` bigint(20) DEFAULT '0' COMMENT 'ID del corte',
  `notas` varchar(100) DEFAULT NULL COMMENT 'Detalle del paro',
  `parte` bigint(20) DEFAULT '0',
  `lote` bigint(20) DEFAULT '0',
  `cantidad` decimal(25,10) DEFAULT '0.0000000000',
  `cantidad_tc` decimal(25,10) DEFAULT '0.0000000000',
  `usuario` bigint(20) DEFAULT '0' COMMENT 'ID del usuario',
  `actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NewIndex2` (`equipo`,`tipo`),
  KEY `NewIndex3` (`equipo`)
) ENGINE=MyISAM AUTO_INCREMENT=47988 DEFAULT CHARSET=latin1;

/*Table structure for table `dias` */

DROP TABLE IF EXISTS `dias`;

CREATE TABLE `dias` (
  `fecha` date NOT NULL COMMENT 'Fecha del día',
  `dia` int(1) NOT NULL,
  PRIMARY KEY (`fecha`,`dia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Tabla de dias';

/*Table structure for table `disponibilidad` */

DROP TABLE IF EXISTS `disponibilidad`;

CREATE TABLE `disponibilidad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `linea` bigint(20) DEFAULT '0' COMMENT 'ID de la linea',
  `maquina` bigint(20) DEFAULT '0' COMMENT 'ID de la máquina',
  `lunes` int(5) DEFAULT NULL COMMENT 'Disponibilidad lunes',
  `martes` int(5) DEFAULT NULL COMMENT 'Disponibilidad martes',
  `miercoles` int(5) DEFAULT NULL COMMENT 'Disponibilidad miércoles',
  `jueves` int(5) DEFAULT NULL COMMENT 'Disponibilidad jueves',
  `viernes` int(5) DEFAULT NULL COMMENT 'Disponibilidad viernes',
  `sabado` int(5) DEFAULT NULL COMMENT 'Disponibilidad sábado',
  `domingo` int(5) DEFAULT NULL COMMENT 'Disponibilidad domingo',
  `estatus` char(1) COLLATE utf8_bin DEFAULT 'A' COMMENT 'Estatus del registro',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=221 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de disponibilidad';

/*Table structure for table `equipos_objetivo` */

DROP TABLE IF EXISTS `equipos_objetivo`;

CREATE TABLE `equipos_objetivo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `parte` bigint(20) DEFAULT '0' COMMENT 'ID del número de parte',
  `equipo` bigint(20) DEFAULT '0' COMMENT 'ID de la ruta',
  `lote` bigint(20) DEFAULT '0' COMMENT 'ID de la Orden o lote',
  `fijo` char(1) DEFAULT 'S' COMMENT 'Objetivo fijo',
  `desde` date DEFAULT NULL COMMENT 'Fecha',
  `hasta` date DEFAULT NULL,
  `turno` bigint(20) DEFAULT '0' COMMENT 'ID del turno',
  `objetivo` decimal(25,10) DEFAULT '0.0000000000' COMMENT 'Piezas por segundo',
  `reinicio` int(2) DEFAULT '0' COMMENT 'Tipo de reinicio (0=No reiniciar, 1=Al llegar, 2=Cambio de producto, 3=Hora, 4=turno, 5=dia, 6=semana, 7=mes, 8=anual)',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`parte`,`equipo`,`fijo`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Objetivos por equipo';

/*Table structure for table `estimados` */

DROP TABLE IF EXISTS `estimados`;

CREATE TABLE `estimados` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `linea` bigint(20) DEFAULT '0' COMMENT 'ID de la línea',
  `maquina` bigint(20) DEFAULT '0' COMMENT 'ID de la máquina',
  `equipo` varbinary(20) DEFAULT '0' COMMENT 'ID del equipo',
  `fijo` char(1) DEFAULT 'S',
  `desde` date DEFAULT NULL COMMENT 'Desde',
  `hasta` date DEFAULT NULL COMMENT 'Mes del año',
  `oee_minimo` decimal(10,5) DEFAULT '0.00000' COMMENT 'Mínimo de OEE',
  `oee` decimal(10,5) DEFAULT '0.00000',
  `oee_maximo` decimal(10,5) DEFAULT '0.00000' COMMENT 'Máximo de OEE',
  `ftq_minimo` decimal(10,5) DEFAULT '0.00000' COMMENT 'Mínimo de FTQ',
  `ftq` decimal(10,5) DEFAULT '0.00000',
  `ftq_maximo` decimal(10,5) DEFAULT '0.00000' COMMENT 'Máximo de FTQ',
  `efi_minimo` decimal(10,5) DEFAULT '0.00000' COMMENT 'Mínimo de Eficiencia',
  `efi` decimal(10,5) DEFAULT '0.00000',
  `efi_maximo` decimal(10,5) DEFAULT '0.00000' COMMENT 'Máximo de Eficiencia',
  `dis_minimo` decimal(10,5) DEFAULT '0.00000' COMMENT 'Mínimo de Disponibilidad',
  `dis` decimal(10,5) DEFAULT '0.00000',
  `dis_maximo` decimal(10,5) DEFAULT '0.00000' COMMENT 'Máximo de Disponibilidad',
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`linea`,`desde`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Estimado de cumplimiento por semana';

/*Table structure for table `fallas_backup` */

DROP TABLE IF EXISTS `fallas_backup`;

CREATE TABLE `fallas_backup` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `id_nuevo` bigint(11) DEFAULT NULL,
  `id_nuevo_ajuastado` bigint(11) DEFAULT NULL,
  `celula` bigint(11) DEFAULT '0' COMMENT 'ID de la celula',
  `maquina` bigint(11) DEFAULT '0' COMMENT 'ID de la máquina',
  `area` bigint(11) DEFAULT '0' COMMENT 'ID del área',
  `referencia` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Referencia',
  `nombre` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nombre de la falla',
  `clasificacion1` bigint(11) DEFAULT NULL COMMENT 'ID de clasificación 1',
  `clasificacion2` bigint(11) DEFAULT NULL COMMENT 'ID de clasificación 2',
  `imagen` varchar(250) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Imágen a utilizar',
  `colorhexa` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Color hexadecimal',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en pantalla',
  `prefijo` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nombre corto',
  `estatus` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Usuario que creó el registro',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Usuario que modificó el registro',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=823 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
  `calendario` bigint(20) DEFAULT NULL COMMENT 'ID del calendario',
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
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1 COMMENT='Catálogo de eventos';

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
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1 COMMENT='Reportes para el negocio';

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Interna - Opciones';

/*Table structure for table `kanban` */

DROP TABLE IF EXISTS `kanban`;

CREATE TABLE `kanban` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `planta` bigint(20) DEFAULT NULL COMMENT 'ID de la planta',
  `linea` bigint(20) DEFAULT NULL COMMENT 'ID de la línea',
  `equipo` bigint(20) DEFAULT NULL COMMENT 'ID del equipo',
  `ruta` bigint(20) DEFAULT NULL COMMENT 'ID de la ruta',
  `operacion` bigint(20) DEFAULT NULL COMMENT 'ID de la operacion',
  `orden` varchar(50) DEFAULT NULL COMMENT 'ID de la O/P',
  `parte` varchar(100) DEFAULT NULL COMMENT 'Número de parte',
  `existencia` decimal(25,6) DEFAULT NULL COMMENT 'Cantidad en Stock',
  `desde` datetime DEFAULT NULL COMMENT 'Fecha y hora de entrada',
  `estatus` int(2) DEFAULT NULL COMMENT 'Estatus del stock',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Detalle de existencias en kanban';

/*Table structure for table `lecturas` */

DROP TABLE IF EXISTS `lecturas`;

CREATE TABLE `lecturas` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'Número automático único',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora automática en que se genera el registro',
  `sensor` bigint(10) DEFAULT NULL COMMENT 'ID del sensor que genera la señal',
  `valor` varchar(255) COLLATE utf16_bin DEFAULT '' COMMENT 'Valor recibido del sensor',
  `estatus` int(2) DEFAULT '0' COMMENT 'Estatus 0=Creado, 1=En proceso, 2=Procesado',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`estatus`),
  KEY `NewIndex2` (`fecha`,`estatus`)
) ENGINE=MyISAM AUTO_INCREMENT=918412 DEFAULT CHARSET=utf16 COLLATE=utf16_bin COMMENT='Tabla histórica de lectura de los sensores';

/*Table structure for table `lecturas_cortes` */

DROP TABLE IF EXISTS `lecturas_cortes`;

CREATE TABLE `lecturas_cortes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `dia` date DEFAULT NULL COMMENT 'Dia del corte',
  `orden` bigint(20) DEFAULT '0' COMMENT 'O/P, Lote',
  `turno` bigint(20) DEFAULT '0' COMMENT 'ID del turno',
  `equipo` bigint(20) DEFAULT '0' COMMENT 'ID del equipo',
  `parte` bigint(20) DEFAULT '0' COMMENT 'ID del número de parte',
  `tc` decimal(25,10) DEFAULT '0.0000000000' COMMENT 'Tiempo ciclo',
  `tripulacion` bigint(20) DEFAULT '0' COMMENT 'ID de la tripulación',
  `produccion` decimal(25,10) DEFAULT '0.0000000000' COMMENT 'Cantidad de eventos producidos',
  `calidad` decimal(25,10) DEFAULT '0.0000000000' COMMENT 'Cantidad de eventos rechazados',
  `buffer` decimal(25,10) DEFAULT '0.0000000000' COMMENT 'Cantidad en buffer',
  `produccion_tc` decimal(25,10) DEFAULT '0.0000000000',
  `calidad_tc` decimal(25,10) DEFAULT '0.0000000000',
  `paro` bigint(20) DEFAULT '0' COMMENT 'ID del paro actual',
  `paro_actual` bigint(20) DEFAULT '0',
  `tiempo_disponible` bigint(10) DEFAULT '0' COMMENT 'Tiempo disponible',
  `bloque_inicia` datetime DEFAULT NULL COMMENT 'Fecha de inicio',
  `bloque_finaliza` datetime DEFAULT NULL COMMENT 'Fecha de finalización',
  `calidad_clasificada` decimal(25,10) DEFAULT '0.0000000000' COMMENT 'Piezas clasificadas',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`equipo`),
  KEY `NewIndex3` (`dia`,`orden`,`turno`,`equipo`,`parte`,`tripulacion`),
  KEY `NewIndex2` (`equipo`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2457 DEFAULT CHARSET=latin1 COMMENT='Acumulado de piezas contadas';

/*Table structure for table `lecturas_resumen` */

DROP TABLE IF EXISTS `lecturas_resumen`;

CREATE TABLE `lecturas_resumen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `planta` bigint(20) DEFAULT NULL COMMENT 'ID de la planta',
  `equipo` bigint(20) DEFAULT '0' COMMENT 'ID del equipo',
  `tipo` int(1) DEFAULT '0' COMMENT 'Tipo de color (0: sin plan, 1: Produccion, 2: bajo rate, 3: en paro)',
  `paro` int(4) DEFAULT '0',
  `bajorate` int(4) DEFAULT '0',
  `sinplan` int(4) DEFAULT '0',
  `produccion` int(4) DEFAULT '0',
  `desde` datetime DEFAULT NULL,
  `hasta` datetime DEFAULT NULL,
  `hora` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `NewIndex2` (`equipo`,`desde`,`hasta`),
  KEY `NewIndex1` (`equipo`,`desde`)
) ENGINE=MyISAM AUTO_INCREMENT=124788 DEFAULT CHARSET=latin1 COMMENT='Histórico últimas 24 horas';

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
) ENGINE=MyISAM AUTO_INCREMENT=6703533 DEFAULT CHARSET=latin1;

/*Table structure for table `lotes` */

DROP TABLE IF EXISTS `lotes`;

CREATE TABLE `lotes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `numero` varchar(100) DEFAULT NULL COMMENT 'Número la orden de producción/proceso',
  `parte` bigint(20) DEFAULT '0' COMMENT 'ID del Número de parte',
  `fecha` datetime DEFAULT NULL COMMENT 'Fecha de entrada del lote',
  `hasta` datetime DEFAULT NULL COMMENT 'Fecha estimada de salida del proceso',
  `calcular_hasta` char(1) DEFAULT 'N' COMMENT 'Calcular el tiempo hasta del lote (N=No calcular, 1=Calcular tiempo de stock, 2=calcular tiempo de proceso)',
  `rechazo` datetime DEFAULT NULL COMMENT 'Fecha de rechazo',
  `inspeccion_id` bigint(20) DEFAULT '0' COMMENT 'Número de inspección',
  `rechazo_id` bigint(20) DEFAULT '0' COMMENT 'Número de rechazo',
  `inspeccion` datetime DEFAULT NULL COMMENT 'Fecha de inspeccion',
  `inspecciones` int(4) DEFAULT '0' COMMENT 'Veces que se inspecciona',
  `rechazos` int(4) DEFAULT '0' COMMENT 'Veces que se rechaza',
  `alarmas` int(4) DEFAULT '0' COMMENT 'Cantidas de alarmas en el lote',
  `reversos` int(4) DEFAULT '0' COMMENT 'Veces que se reversó',
  `proceso` bigint(20) DEFAULT '0' COMMENT 'ID del proceso',
  `equipo` bigint(20) DEFAULT '0' COMMENT 'ID del equipo',
  `ruta` bigint(20) DEFAULT '0' COMMENT 'ID de la ruta',
  `ruta_detalle` bigint(20) DEFAULT '0' COMMENT 'ID del detalle de la ruta',
  `ruta_secuencia` int(6) DEFAULT '0' COMMENT 'Secuencia de la operación',
  `inicia` datetime DEFAULT NULL COMMENT 'Fecha de inicio en el sistema',
  `finaliza` datetime DEFAULT NULL COMMENT 'Fecha de fin en el sistema',
  `estimada` datetime DEFAULT NULL COMMENT 'Fecha estimada de completación',
  `tiempo_estimado` bigint(12) DEFAULT '0' COMMENT 'Tiempo estimado del lote',
  `tiempo` bigint(12) DEFAULT '0' COMMENT 'Tiempo total del lote',
  `estado` int(2) DEFAULT '0' COMMENT 'Estado del lote',
  `inspeccionado_por` bigint(20) DEFAULT '0' COMMENT 'Usuario que inspecciono la última vez',
  `rechazado_por` bigint(20) DEFAULT '0' COMMENT 'Usuario que rechazó la última vez',
  `alarma_tse` char(1) DEFAULT 'N' COMMENT 'Esta alarmada por tiempo de stock excedido',
  `alarma_tse_p` char(1) NOT NULL DEFAULT 'N',
  `alarma_tse_paso` char(1) DEFAULT 'N',
  `alarma_tpe` char(1) DEFAULT 'N' COMMENT 'Esta alarmada por tiempo de proceso excedido',
  `alarma_tpe_p` char(1) NOT NULL DEFAULT 'N',
  `alarma_tpe_paso` char(1) DEFAULT 'N',
  `alarma_plan` char(1) DEFAULT 'N' COMMENT 'Esta alarmada por programación no alcanzada',
  `carga` bigint(20) DEFAULT '0' COMMENT 'ID de la carga (temporal)',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(20) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(20) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`proceso`,`estado`,`estatus`,`creacion`),
  KEY `NewIndex2` (`parte`,`carga`),
  KEY `NewIndex3` (`carga`)
) ENGINE=MyISAM AUTO_INCREMENT=2018 DEFAULT CHARSET=latin1 COMMENT='Lotes';

/*Table structure for table `lotes_cambiados` */

DROP TABLE IF EXISTS `lotes_cambiados`;

CREATE TABLE `lotes_cambiados` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `lote` bigint(20) DEFAULT NULL COMMENT 'ID del lote',
  `fecha` datetime DEFAULT NULL COMMENT 'Fecha de la actualización',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`lote`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='TRIGGER - Lotes cambiados';

/*Table structure for table `lotes_historia` */

DROP TABLE IF EXISTS `lotes_historia`;

CREATE TABLE `lotes_historia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `lote` bigint(20) DEFAULT '0' COMMENT 'ID de lote',
  `parte` bigint(20) DEFAULT '0' COMMENT 'ID del número de parte',
  `ruta` bigint(20) DEFAULT '0' COMMENT 'ID de la ruta',
  `ruta_detalle` bigint(20) DEFAULT '0' COMMENT 'ID del detalle de la ruta',
  `ruta_detalle_anterior` bigint(20) DEFAULT '0' COMMENT 'ID del detalle de la ruta anterior',
  `ruta_secuencia` int(6) DEFAULT '0' COMMENT 'Secuecia de la operación',
  `ruta_secuencia_antes` int(6) DEFAULT '0' COMMENT 'Secuecia de la anterior',
  `proceso` bigint(20) DEFAULT '0' COMMENT 'ID del proceso',
  `proceso_anterior` int(20) DEFAULT '0' COMMENT 'ID del proceso anterior',
  `equipo` bigint(20) DEFAULT '0' COMMENT 'ID del equipo',
  `fecha_entrada` datetime DEFAULT NULL COMMENT 'Fecha de entrada del lote',
  `fecha_stock` datetime DEFAULT NULL COMMENT 'Fecha de enrada al stock',
  `fecha_proceso` datetime DEFAULT NULL COMMENT 'Fecha de entrada al proceso',
  `fecha_salida` datetime DEFAULT NULL COMMENT 'Fecha de salida del proceso',
  `fecha_estimada` datetime DEFAULT NULL COMMENT 'Fecha estimada del proceso (stock + proceso + setup)',
  `tiempo_estimado` bigint(12) DEFAULT '0' COMMENT 'Tiempo estimado en segundos',
  `tiempo_total` bigint(12) DEFAULT '0' COMMENT 'Tiempo total del lote en el proceso',
  `tiempo_espera` bigint(12) DEFAULT '0' COMMENT 'Tiempo del lote en la situación de espera',
  `tiempo_stock` bigint(12) DEFAULT '0' COMMENT 'Tiempo del lote en la situación de stock',
  `tiempo_proceso` bigint(12) DEFAULT '0' COMMENT 'Tiempo del lote en la situación de proceso',
  `alarma_so` char(1) DEFAULT 'N' COMMENT 'Alarmada por Salto de operación?',
  `alarma_so_rep` datetime DEFAULT NULL COMMENT 'Fecha de alarma por salto de operación',
  `inspecciones` int(4) DEFAULT '0' COMMENT 'Inspecciones en el proceso',
  `rechazos` int(4) DEFAULT '0' COMMENT 'Rechazos en el proceso',
  `reversado` char(1) DEFAULT NULL COMMENT 'El proceso fue reversado',
  `reversos` int(4) DEFAULT '0' COMMENT 'reversos del proceso',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`lote`,`proceso`),
  KEY `NewIndex2` (`lote`,`ruta_secuencia`)
) ENGINE=MyISAM AUTO_INCREMENT=37241 DEFAULT CHARSET=latin1 COMMENT='Histórico de lotes';

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

/*Table structure for table `maquinas` */

DROP TABLE IF EXISTS `maquinas`;

CREATE TABLE `maquinas` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `id_wip` bigint(11) DEFAULT NULL,
  `celula` bigint(11) DEFAULT '0' COMMENT 'ID de la célula',
  `referencia` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Referencia',
  `nombre` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nombre de la máquina',
  `tipo` bigint(11) DEFAULT '0' COMMENT 'ID del tipo de máquina',
  `clasificacion1` bigint(11) DEFAULT '0' COMMENT 'ID de la clasificación 1',
  `clasificacion2` bigint(11) DEFAULT '0' COMMENT 'ID de la clasificación 2',
  `imagen` varchar(250) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Imágen a utilizar',
  `colorhexa` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Color hexadecimal',
  `prefijo` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nombre corto',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en pantalla',
  `estatus` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT '0' COMMENT 'Usuario que creó el registro',
  `modificado` bigint(11) DEFAULT '0' COMMENT 'Usuario que modificó el registro',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de máquinas';

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
) ENGINE=MyISAM AUTO_INCREMENT=80852 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=latin1 COMMENT='Mensajes a enviar o llamar';

/*Table structure for table `objetos` */

DROP TABLE IF EXISTS `objetos`;

CREATE TABLE `objetos` (
  `mapa_id` int(11) NOT NULL,
  `id` varchar(50) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `ultima_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mapa_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `paros` */

DROP TABLE IF EXISTS `paros`;

CREATE TABLE `paros` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `paro` bigint(20) DEFAULT '0' COMMENT 'ID del paro',
  `automatico` char(1) DEFAULT NULL COMMENT 'El paro fue automático',
  `equipo` bigint(20) DEFAULT '0' COMMENT 'ID del equipo',
  `turno` bigint(20) DEFAULT '0' COMMENT 'ID del turno',
  `tripulacion` bigint(20) DEFAULT '0' COMMENT 'ID de la tripulación',
  `orden` bigint(20) DEFAULT NULL COMMENT 'ID de la orden de producción',
  `parte` bigint(20) DEFAULT NULL COMMENT 'ID del material',
  `inicia` datetime DEFAULT NULL COMMENT 'Fecha de inicio',
  `finaliza` datetime DEFAULT NULL COMMENT 'Fecha de fin',
  `tiempo_plan` bigint(20) DEFAULT NULL COMMENT 'Tiempo total en segundos (plan)',
  `tiempo_real` bigint(20) DEFAULT NULL COMMENT 'Tiempo total en segundos (real)',
  `adelantado` char(1) DEFAULT NULL COMMENT 'El paro se adelantó',
  `cancelado` char(1) DEFAULT NULL COMMENT 'El paro se canceló',
  `terminado_por` bigint(11) DEFAULT NULL COMMENT 'Usuario que terminó el paro',
  `terminado_causa` bigint(11) DEFAULT NULL COMMENT 'Causa de la cancelación',
  `terminado_fecha` datetime DEFAULT NULL COMMENT 'Fecha de la cancelación',
  `genero_otro` char(2) DEFAULT NULL COMMENT 'Generó otro paro (N/P)',
  `comentarios` varchar(1000) DEFAULT NULL COMMENT 'Comentarios del sistema',
  `atendido` char(1) DEFAULT NULL COMMENT 'El paro fue atendido?',
  `clasificado_por` bigint(20) DEFAULT NULL COMMENT 'Usuario que clasificó el paro',
  `clasificado_fecha` datetime DEFAULT NULL COMMENT 'Fecha de la clasificación',
  `cambiado` char(1) DEFAULT NULL COMMENT 'El paro fue cambiado de N/P a P',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Paros sucedidos';

/*Table structure for table `piezasxminuto` */

DROP TABLE IF EXISTS `piezasxminuto`;

CREATE TABLE `piezasxminuto` (
  `equipo` bigint(20) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `produccion` decimal(20,5) DEFAULT NULL,
  `paro` bigint(4) DEFAULT NULL,
  `hhmm` char(4) DEFAULT NULL,
  KEY `NewIndex1` (`equipo`,`fecha`),
  KEY `NewIndex2` (`equipo`,`hhmm`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Tabla de registros por segundo';

/*Table structure for table `plan_checklists` */

DROP TABLE IF EXISTS `plan_checklists`;

CREATE TABLE `plan_checklists` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  `nombre` varchar(60) DEFAULT NULL COMMENT 'Nombre/Descripción del registro',
  `referencia` varchar(30) DEFAULT NULL COMMENT 'ID para otros sistemas',
  `calendario` bigint(20) DEFAULT '0' COMMENT 'ID del calendario',
  `imagen` varchar(255) DEFAULT NULL COMMENT 'Imagen a mostrar',
  `fecha` datetime DEFAULT NULL COMMENT 'Fecha y hora (fijo)',
  `maximo` int(6) DEFAULT '0',
  `reiniciar_cada` int(2) DEFAULT '0',
  `frecuencia` varchar(2) DEFAULT NULL COMMENT 'Frecuencia del checklist',
  `hora` time DEFAULT NULL COMMENT 'Horario del checklist',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas del registro',
  `checklists` char(1) DEFAULT 'S',
  `anticipacion` char(1) DEFAULT 'N',
  `ejecutado` date DEFAULT NULL COMMENT 'Fecha de ejecucion',
  `tiempo` int(6) DEFAULT '0',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(20) DEFAULT '0' COMMENT 'Creado por',
  `modificado` bigint(20) DEFAULT '0' COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

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

/*Table structure for table `prioridades` */

DROP TABLE IF EXISTS `prioridades`;

CREATE TABLE `prioridades` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `fecha` datetime DEFAULT NULL COMMENT 'Fecha y hora de programación',
  `parte` bigint(20) DEFAULT NULL COMMENT 'Número de parte',
  `orden` int(3) DEFAULT NULL COMMENT 'Prioridad',
  `proceso` bigint(20) DEFAULT NULL COMMENT 'ID del proceso',
  `notas` varchar(300) DEFAULT NULL COMMENT 'Notas varias',
  `estatus` char(1) DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`parte`,`fecha`,`estatus`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;

/*Table structure for table `programacion` */

DROP TABLE IF EXISTS `programacion`;

CREATE TABLE `programacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `carga` bigint(20) DEFAULT NULL COMMENT 'ID de la carga',
  `parte` bigint(20) DEFAULT '0' COMMENT 'ID del número de parte',
  `cantidad` bigint(12) DEFAULT '0' COMMENT 'Cantidad',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Creado por',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Modificado por',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=latin1 COMMENT='Progranación de la producción';

/*Table structure for table `pu_colores` */

DROP TABLE IF EXISTS `pu_colores`;

CREATE TABLE `pu_colores` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'ID del tema',
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Colores';

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
  `oee` char(6) DEFAULT 'NNN',
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
) ENGINE=MyISAM AUTO_INCREMENT=199 DEFAULT CHARSET=latin1 COMMENT='Preferencias de usuario (Gráficos)';

/*Table structure for table `relacion_alertas_operaciones` */

DROP TABLE IF EXISTS `relacion_alertas_operaciones`;

CREATE TABLE `relacion_alertas_operaciones` (
  `alerta` bigint(20) DEFAULT NULL COMMENT 'ID de la alerta',
  `proceso` bigint(20) DEFAULT NULL COMMENT 'ID del registro del catálogo',
  `tipo` int(2) DEFAULT NULL COMMENT 'Catálogo asociado',
  UNIQUE KEY `NewIndex1` (`alerta`,`proceso`,`tipo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `relacion_fallas_operaciones` */

DROP TABLE IF EXISTS `relacion_fallas_operaciones`;

CREATE TABLE `relacion_fallas_operaciones` (
  `falla` bigint(20) DEFAULT NULL COMMENT 'ID de la falla',
  `proceso` bigint(20) DEFAULT NULL COMMENT 'ID del registro del catálogo',
  `tipo` int(2) DEFAULT NULL COMMENT 'Catálogo asociado',
  UNIQUE KEY `NewIndex1` (`falla`,`proceso`,`tipo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `relacion_maquinas_lecturas` */

DROP TABLE IF EXISTS `relacion_maquinas_lecturas`;

CREATE TABLE `relacion_maquinas_lecturas` (
  `equipo` bigint(20) NOT NULL DEFAULT '0' COMMENT 'ID del equipo',
  `orden` bigint(20) DEFAULT '0' COMMENT 'ID de la O/P',
  `parte` bigint(20) DEFAULT '0' COMMENT 'ID del número de parte',
  `tripulacion` bigint(20) DEFAULT '0' COMMENT 'ID de la tripulación',
  `turno` bigint(20) DEFAULT '0' COMMENT 'ID del turno',
  `nparte` varchar(100) DEFAULT NULL,
  `norden` varchar(30) DEFAULT NULL,
  `nequipo` varchar(100) DEFAULT NULL,
  `ntripulacion` varchar(100) DEFAULT NULL COMMENT 'Descipción de la tripulación',
  `nturno` varchar(100) DEFAULT NULL COMMENT 'Descipción del turno',
  `referencia` varchar(30) DEFAULT NULL,
  `rate_teorico` decimal(25,10) DEFAULT '0.0000000000' COMMENT 'Rate teórico',
  `objetivo` decimal(25,10) DEFAULT '0.0000000000' COMMENT 'Objetivo del corte',
  `produccion` decimal(25,10) DEFAULT '0.0000000000' COMMENT 'Cantidad de eventos producidos',
  `calidad` decimal(25,10) DEFAULT '0.0000000000' COMMENT 'Cantidad de eventos rechazados',
  `buffer` decimal(25,10) DEFAULT '0.0000000000' COMMENT 'Cantidad en buffer',
  `produccion_tc` decimal(25,10) DEFAULT '0.0000000000',
  `calidad_tc` decimal(25,10) DEFAULT '0.0000000000',
  `paros` bigint(20) DEFAULT '0' COMMENT 'Segundos de paro acumulado',
  `parosmostrar` bigint(20) DEFAULT '0' COMMENT 'Segundos de paro + Actual',
  `rate` decimal(25,10) DEFAULT '0.0000000000' COMMENT 'Rate actual',
  `rate_efecto` char(1) DEFAULT 'N' COMMENT 'Efecto del rate (B=Bajo, A=Alto, N=Normal)',
  `ftq_efecto` char(1) DEFAULT 'N' COMMENT 'Efecto del FTQ (B=Bajo, A=Alto, N=Normal)',
  `efi_efecto` char(1) DEFAULT 'N' COMMENT 'Efecto del EFI (B=Bajo, A=Alto, N=Normal)',
  `dis_efecto` char(1) DEFAULT 'N' COMMENT 'Efecto del DIS (B=Bajo, A=Alto, N=Normal)',
  `oee_efecto` char(1) DEFAULT 'N' COMMENT 'Efecto del OEE (B=Bajo, A=Alto, N=Normal)',
  `estatus` char(1) DEFAULT 'F' COMMENT 'Estatus del equipo (F=Funcionando, D=Paro)',
  `fecha_desde` datetime DEFAULT NULL COMMENT 'Fecha de inicio',
  `rate_min` decimal(25,10) DEFAULT '0.0000000000',
  `rate_max` decimal(25,10) DEFAULT '0.0000000000',
  `ratemed` varchar(15) DEFAULT NULL COMMENT 'Unidad de medida',
  `efi` decimal(10,3) DEFAULT '0.000',
  `dis` decimal(10,3) DEFAULT '0.000',
  `ftq` decimal(10,3) DEFAULT '0.000',
  `oee` decimal(10,3) DEFAULT '0.000',
  `esperadoefi` decimal(10,3) DEFAULT '0.000',
  `esperadodis` decimal(10,3) DEFAULT '0.000',
  `esperadooee` decimal(10,3) DEFAULT '0.000',
  `esperadoftq` decimal(10,3) DEFAULT '0.000',
  `rate_mal_desde` datetime NOT NULL COMMENT 'Fecha en que inició el bajo/alto rate',
  `rate_tendencia_baja` datetime DEFAULT NULL COMMENT 'Fecha de tendencia a la baja',
  `rate_tendencia_alta` datetime DEFAULT NULL COMMENT 'Fecha de tendencia a la alta',
  `ftq_tendencia_baja` datetime DEFAULT NULL,
  `oee_tendencia_baja` datetime DEFAULT NULL,
  `dis_tendencia_baja` datetime DEFAULT NULL,
  `efi_tendencia_baja` datetime DEFAULT NULL,
  `proximo_paro` bigint(20) DEFAULT '0' COMMENT 'ID del próximo paro planeado',
  `ultima_lectura` datetime DEFAULT NULL COMMENT 'Fecha de la última lectura',
  `parada_desde` datetime DEFAULT NULL COMMENT 'En paro desde',
  `paro_actual` bigint(20) DEFAULT '0' COMMENT 'ID del paro actual',
  `ultima_produccion` datetime DEFAULT NULL COMMENT 'Fecha última producción (o buffer)',
  `ultima_buffer` datetime DEFAULT NULL,
  `oee_imagen` int(11) DEFAULT '0' COMMENT '0=Normal, 1=Subiendo, 2=Bajando',
  `hoyos` char(1) DEFAULT 'N' COMMENT 'Incluye hoyos en la disponibilidad',
  `iniciar_1` char(1) DEFAULT 'N' COMMENT 'Iniciar el contador',
  `iniciar_2` char(1) DEFAULT 'N',
  `iniciar_3` char(1) DEFAULT 'N',
  `iniciar_4` char(1) DEFAULT 'N',
  `iniciar_5` char(1) DEFAULT 'N',
  `iniciar_6` char(1) DEFAULT 'N',
  `iniciar_7` char(1) DEFAULT 'N',
  `iniciar_8` char(1) DEFAULT 'N',
  `iniciar` char(1) DEFAULT 'N',
  `factor_iniciar` varchar(6) DEFAULT NULL,
  `detener` bigint(20) DEFAULT '0' COMMENT 'Usuario que solicitó detener',
  `reanudar` bigint(20) DEFAULT '0' COMMENT 'Usuario que solicitó la cancelación',
  `transcurrido` int(6) DEFAULT '0' COMMENT 'Ultimo tiempo transcurrido',
  `tiempo_corte` int(2) DEFAULT '-1' COMMENT 'Tiempo de corte',
  `tiempo_reinicio` int(2) DEFAULT '-1' COMMENT 'Tiempo de reinicio',
  `fuera_programa` char(1) DEFAULT 'N' COMMENT 'Esta fuera de programa',
  `alarmado_bajo` char(1) DEFAULT 'N' COMMENT 'Equipo ya alarmado bajo rate',
  `alarmado_alto` char(1) DEFAULT 'N' COMMENT 'Equipo ya alarmado alto rate',
  `alarmado_manual` char(1) DEFAULT 'N' COMMENT 'Equipo ya alarmado por paro manual',
  `transcurrido_pasar` int(1) DEFAULT '0',
  `ultimo_rate` decimal(25,10) DEFAULT '0.0000000000',
  `desde_rate` datetime DEFAULT NULL,
  `efi_imagen` int(1) DEFAULT '0',
  `ftq_imagen` int(1) DEFAULT '0',
  `dis_imagen` int(1) DEFAULT '0',
  `planeado` char(1) DEFAULT 'N' COMMENT 'Si hay un paro planeado no cuenta en el consolidado',
  `ultima_reparacion` datetime DEFAULT NULL COMMENT 'Fecha para controlar el umbral',
  `estado_desde` datetime DEFAULT NULL COMMENT 'Fecha que se muestra en la app',
  `detener_tipo` bigint(20) DEFAULT '0',
  `detener_area` bigint(20) DEFAULT '0',
  `detener_notas` varchar(100) DEFAULT NULL,
  `detener_estimado` bigint(10) DEFAULT '0',
  `detener_piezas` char(1) DEFAULT 'N',
  `detener_paro` varchar(50) DEFAULT NULL,
  `detener_resultados` varchar(100) DEFAULT NULL,
  `alarmado_ftq` char(1) DEFAULT 'N',
  `alarmado_dis` char(1) DEFAULT 'N',
  `alarmado_oee` char(1) DEFAULT 'N',
  `alarmado_efi` char(1) DEFAULT 'N',
  `velocidad` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`equipo`),
  KEY `NewIndex1` (`equipo`,`factor_iniciar`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `relacion_partes_equipos` */

DROP TABLE IF EXISTS `relacion_partes_equipos`;

CREATE TABLE `relacion_partes_equipos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `parte` bigint(20) DEFAULT '0' COMMENT 'ID del número de parte',
  `equipo` bigint(20) DEFAULT '0' COMMENT 'ID de la ruta',
  `piezas` decimal(25,10) DEFAULT '0.0000000000' COMMENT 'Piezas por segundo',
  `sesion` char(1) DEFAULT 'N' COMMENT 'Sesión',
  `unidad` varchar(20) DEFAULT NULL COMMENT 'Unidad de medida',
  `tiempo` int(1) DEFAULT '0' COMMENT 'Unidad de tiempo (0=Hora, 1=Minuto, 2=Segundo, 3=Dia)',
  `bajo` decimal(6,2) DEFAULT '0.00' COMMENT 'PCT de bajo rate',
  `alto` decimal(7,2) DEFAULT '0.00' COMMENT 'PCT de sobre rate',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`parte`,`equipo`),
  KEY `NewIndex2` (`parte`,`equipo`,`piezas`)
) ENGINE=MyISAM AUTO_INCREMENT=300 DEFAULT CHARSET=latin1 COMMENT='Relación Equipo/Parte (rate)';

/*Table structure for table `relacion_partes_maquinas` */

DROP TABLE IF EXISTS `relacion_partes_maquinas`;

CREATE TABLE `relacion_partes_maquinas` (
  `parte` bigint(20) DEFAULT NULL COMMENT 'ID del número de parte',
  `maquina` bigint(20) DEFAULT NULL COMMENT 'ID de la ruta',
  KEY `NewIndex1` (`parte`,`maquina`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `relacion_partes_rutas` */

DROP TABLE IF EXISTS `relacion_partes_rutas`;

CREATE TABLE `relacion_partes_rutas` (
  `parte` bigint(20) DEFAULT NULL COMMENT 'ID del número de parte',
  `ruta` bigint(20) DEFAULT NULL COMMENT 'ID de la ruta',
  `defecto` char(1) DEFAULT NULL COMMENT 'Ruta por defecto',
  KEY `NewIndex1` (`parte`,`ruta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Relación entre números de parte y rutas';

/*Table structure for table `relacion_plan_checklists` */

DROP TABLE IF EXISTS `relacion_plan_checklists`;

CREATE TABLE `relacion_plan_checklists` (
  `plan` bigint(20) DEFAULT '0' COMMENT 'ID del plan',
  `checklist` bigint(20) DEFAULT '0' COMMENT 'ID del checklist',
  KEY `Index01` (`plan`,`checklist`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `relacion_procesos_sensores` */

DROP TABLE IF EXISTS `relacion_procesos_sensores`;

CREATE TABLE `relacion_procesos_sensores` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `equipo` bigint(20) DEFAULT '0' COMMENT 'ID del proceso',
  `sensor` int(10) DEFAULT NULL COMMENT 'ID del sensor',
  `tipo` int(1) DEFAULT NULL COMMENT 'Tipo de sensor (0=Producción, 1=Calidad, 2=Otros, 3=Calidad+producción)',
  `ultima_lectura` datetime DEFAULT NULL COMMENT 'Fecha de la última lectura',
  `multiplicador` bigint(20) DEFAULT NULL COMMENT 'Factor de multiplicación',
  `base` bigint(20) DEFAULT NULL COMMENT 'Base del factor ',
  `estatus` char(1) DEFAULT 'A' COMMENT 'Estatus del registro',
  `creacion` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(20) DEFAULT '0' COMMENT 'Creado por',
  `modificado` bigint(20) DEFAULT '0' COMMENT 'Modificado por',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`equipo`,`sensor`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

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

/*Table structure for table `relacion_variables_equipos` */

DROP TABLE IF EXISTS `relacion_variables_equipos`;

CREATE TABLE `relacion_variables_equipos` (
  `variable` bigint(20) DEFAULT '0' COMMENT 'ID de la variable',
  `maquina` bigint(20) DEFAULT '0' COMMENT 'ID del equipo',
  KEY `Index01` (`variable`,`maquina`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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

/*Table structure for table `reportes` */

DROP TABLE IF EXISTS `reportes`;

CREATE TABLE `reportes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID del reporte',
  `numero` bigint(20) DEFAULT '0' COMMENT 'Número de reporte',
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora del reporte',
  `linea` bigint(20) DEFAULT '0' COMMENT 'ID de la célula',
  `maquina` bigint(20) DEFAULT '0' COMMENT 'ID de la máquina',
  `turno` bigint(20) DEFAULT '0' COMMENT 'ID del turno',
  `area` bigint(20) DEFAULT '0' COMMENT 'ID del área',
  `falla` bigint(20) DEFAULT '0' COMMENT 'ID de la falla',
  `detalle` varchar(300) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Detalle de la falla',
  `record_id` bigint(11) DEFAULT '0' COMMENT 'Registro en MMCall',
  `requester` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'Código del requester en MMCall',
  `solicitante` bigint(20) DEFAULT '0' COMMENT 'Usuario solicitante',
  `tecnicoatend` bigint(20) DEFAULT '0' COMMENT 'Técnico que atendió',
  `tecnico` bigint(20) DEFAULT '0' COMMENT 'Técnico que reparó',
  `tipo` bigint(20) DEFAULT '0' COMMENT 'Tipo de mantenimiento',
  `estatus` int(4) DEFAULT '0' COMMENT 'Estatus del reporte',
  `falla_ajustada` bigint(20) DEFAULT '0' COMMENT 'ID de la falla ajustada',
  `inicio_atencion` datetime DEFAULT NULL COMMENT 'Fecha y hora de inicio de la atención',
  `cierre_atencion` datetime DEFAULT NULL COMMENT 'Fecha y hora del cierre de la atención',
  `inicio_reporte` datetime DEFAULT NULL COMMENT 'Fecha y hora de inicio del reporte',
  `alarmado` char(1) CHARACTER SET latin1 DEFAULT 'N' COMMENT 'El reporte fue alarmado?',
  `tiemporeporte` bigint(12) DEFAULT '0' COMMENT 'Tiempo en segundos del reporte',
  `comentarios` varchar(300) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Comentarios del reporte',
  `cierre_reporte` datetime DEFAULT NULL COMMENT 'Fecha y hora del cierre del reporte',
  `contabilizar` char(1) CHARACTER SET latin1 DEFAULT 'S' COMMENT 'Contabilizar el reporte?',
  `confirmado` bigint(20) DEFAULT '0' COMMENT 'Usuario que confirmó la reparación',
  `fecha_reporte` date DEFAULT NULL COMMENT 'Fecha del reporte',
  `tiemporeparacion` bigint(12) DEFAULT '0' COMMENT 'Tiempo total de la falla',
  `tiempoatencion` bigint(12) DEFAULT '0' COMMENT 'Tiempo total de la atención',
  `tiempollegada` bigint(12) DEFAULT '0' COMMENT 'Tiempo de la llegada del tecnico',
  `modificador` bigint(20) DEFAULT '0' COMMENT 'Usuario que modificó',
  `modificado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora del úñtimo cambio',
  `alarmado_atender` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Alarmado en estatus 0',
  `alarmado_atendido` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Alarmado en estatus 10',
  `alarmado_atender_desde` datetime DEFAULT NULL COMMENT 'Fecha en que se alarmó',
  `alarmado_atendido_desde` datetime DEFAULT NULL COMMENT 'Fecha en que se alarmó',
  `alarmado_informe_desde` datetime DEFAULT NULL COMMENT 'Fecha en que se alarmó',
  `generar_audio` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT 'Generar audio por área',
  `repeticiones` int(3) DEFAULT '0' COMMENT 'Número de repeticion',
  `escalado` int(1) DEFAULT '0' COMMENT 'Nivel de escalamiento',
  `mmcall` datetime DEFAULT NULL COMMENT 'Mensaje enviado a MMCall',
  `afecta_oee` char(1) COLLATE utf8_bin DEFAULT 'S',
  `herramental` bigint(20) DEFAULT '0',
  `primer_audio` char(1) COLLATE utf8_bin DEFAULT 'N',
  `audios` datetime DEFAULT NULL,
  `reproducir_audio_externo` int(2) DEFAULT '0',
  `origen` bigint(12) DEFAULT '0' COMMENT 'Origen del reporte (0=Digital, 1=Híbrido, 2=Manual)',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`numero`),
  KEY `NewIndex2` (`fecha`),
  KEY `NewIndex3` (`maquina`,`estatus`),
  KEY `NewIndex4` (`linea`,`estatus`),
  KEY `NewIndex5` (`area`,`estatus`),
  KEY `NewIndex6` (`origen`)
) ENGINE=MyISAM AUTO_INCREMENT=18389 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de reportes de Mantenimiento';

/*Table structure for table `ruta_congelada` */

DROP TABLE IF EXISTS `ruta_congelada`;

CREATE TABLE `ruta_congelada` (
  `lote` bigint(20) DEFAULT '0' COMMENT 'ID del lote',
  `id_detruta` bigint(20) DEFAULT '0' COMMENT 'ID de la ruta',
  `ruta` bigint(20) DEFAULT '0' COMMENT 'ID de la rutaa',
  `secuencia` int(6) DEFAULT '0' COMMENT 'Secuencia',
  `proceso` bigint(20) DEFAULT '0' COMMENT 'ID del proceso',
  KEY `NewIndex1` (`lote`,`secuencia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Ruta congelada';

/*Table structure for table `sentencias` */

DROP TABLE IF EXISTS `sentencias`;

CREATE TABLE `sentencias` (
  `version` varchar(30) DEFAULT NULL COMMENT 'ID de la licencia',
  `orden` int(4) DEFAULT NULL COMMENT 'Orden de la ejecución',
  `sentencia` varchar(5000) DEFAULT NULL COMMENT 'Sentencia a aplicar',
  `estatus` char(1) DEFAULT '0' COMMENT 'Estatus de la licencia (0=Por aplicar, 1=Aplicado, 9=Error)'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Log de versiones';

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

/*Table structure for table `temporal_mmcall` */

DROP TABLE IF EXISTS `temporal_mmcall`;

CREATE TABLE `temporal_mmcall` (
  `record` bigint(20) NOT NULL DEFAULT '0' COMMENT 'ID de la tabla records',
  `boton1` datetime DEFAULT NULL COMMENT 'Fecha botón 1',
  `boton2` datetime DEFAULT NULL COMMENT 'Fecha botón 2',
  `estatus` int(1) NOT NULL DEFAULT '0' COMMENT 'estatus del registro',
  PRIMARY KEY (`record`),
  UNIQUE KEY `Index01` (`record`,`estatus`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COMMENT='Tabla de traducción';

/*Table structure for table `traduccion_literales` */

DROP TABLE IF EXISTS `traduccion_literales`;

CREATE TABLE `traduccion_literales` (
  `planta` bigint(20) DEFAULT '0',
  `idioma` int(4) DEFAULT '0',
  `literal` bigint(20) DEFAULT NULL,
  `traduccion` varchar(300) DEFAULT NULL,
  UNIQUE KEY `Index01` (`planta`,`idioma`,`literal`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `traduccion_when` */

DROP TABLE IF EXISTS `traduccion_when`;

CREATE TABLE `traduccion_when` (
  `campo` int(4) DEFAULT '0',
  `id` varchar(10) DEFAULT NULL COMMENT 'Literal a buscar',
  `idioma` bigint(4) DEFAULT '0' COMMENT 'Idioma',
  `nombre` varchar(50) DEFAULT NULL COMMENT 'Traducción',
  `orden` int(4) DEFAULT '0' COMMENT 'Orden del registro',
  KEY `NewIndex1` (`campo`,`id`,`idioma`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `variables_valores` */

DROP TABLE IF EXISTS `variables_valores`;

CREATE TABLE `variables_valores` (
  `variable` bigint(20) DEFAULT '0' COMMENT 'ID de variable',
  `orden` int(3) DEFAULT '0' COMMENT 'Indice del valor',
  `valor` varchar(50) DEFAULT NULL COMMENT 'Valor',
  `alarmar` char(1) DEFAULT 'N' COMMENT 'Alarmar',
  `defecto` char(1) DEFAULT 'N',
  KEY `NewIndex` (`variable`,`orden`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
