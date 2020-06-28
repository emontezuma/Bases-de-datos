/*
SQLyog Community v12.09 (64 bit)
MySQL - 5.6.13 : Database - fmogul
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fmogul` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `fmogul`;

/*Table structure for table `areas` */

DROP TABLE IF EXISTS `areas`;

CREATE TABLE `areas` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `referencia` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Referencia',
  `nombre` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nombre del área',
  `imagen` varchar(250) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Imágen a utilizar',
  `colorhexa` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Color hexadecimal',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en pantalla',
  `prefijo` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nombre corto',
  `estatus` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Usuario que creó el registro',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Usuario que modificó el registro',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de áreas';

/*Table structure for table `celulas` */

DROP TABLE IF EXISTS `celulas`;

CREATE TABLE `celulas` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `referencia` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Referencia',
  `nombre` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nombre de la celula',
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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de células';

/*Table structure for table `consultas_cab` */

DROP TABLE IF EXISTS `consultas_cab`;

CREATE TABLE `consultas_cab` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `nombre` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Nombre de la consulta',
  `usuario` bigint(11) DEFAULT NULL COMMENT 'ID del usuario',
  `publico` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Es una consulta pública?',
  `fecha` int(2) DEFAULT NULL COMMENT 'Tipo de fecha',
  `desde` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'Fecha desde',
  `hasta` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'Fecha de hasta',
  `horadesde` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT 'Hora desde',
  `horahasta` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT 'Hora hasta',
  `defecto` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Consulta por defecto',
  `filtrocel` bigint(10) DEFAULT '0' COMMENT 'Hay filtro por celula',
  `filtromaq` bigint(10) DEFAULT '0' COMMENT 'Hay filtro por máquina',
  `filtroare` bigint(10) DEFAULT '0' COMMENT 'Hay filtro por área',
  `filtrofal` bigint(10) DEFAULT '0' COMMENT 'Hay filtro por falla',
  `filtromti` bigint(10) DEFAULT '0' COMMENT 'Hay filtro por máquina (Tipo)',
  `filtroma1` bigint(10) DEFAULT '0' COMMENT 'Hay filtro por máquina (AG1)',
  `filtroma2` bigint(10) DEFAULT '0' COMMENT 'Hay filtro por máquina (AG2)',
  `filtrofa1` bigint(10) DEFAULT '0' COMMENT 'Hay filtro por falla (AG2)',
  `filtrofa2` bigint(10) DEFAULT '0' COMMENT 'Hay filtro por falla (AG1)',
  `filtrotec` bigint(10) DEFAULT '0' COMMENT 'Hay filtro por técnico',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=463 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de consultas';

/*Table structure for table `consultas_det` */

DROP TABLE IF EXISTS `consultas_det`;

CREATE TABLE `consultas_det` (
  `consulta` bigint(11) DEFAULT NULL COMMENT 'ID de la consulta',
  `tabla` int(6) DEFAULT NULL COMMENT 'ID de la tabla',
  `valor` bigint(11) DEFAULT NULL COMMENT 'ID del valor',
  KEY `NewIndex1` (`consulta`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Detalle de la consulta';

/*Table structure for table `detalleparos` */

DROP TABLE IF EXISTS `detalleparos`;

CREATE TABLE `detalleparos` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `paro` bigint(11) DEFAULT NULL COMMENT 'ID del paro',
  `tipo` int(2) DEFAULT NULL COMMENT 'Tipo de paro (0=planeado, 1=No planeado)',
  `maquina` bigint(11) DEFAULT NULL COMMENT 'ID de la máquina',
  `fecha` date DEFAULT NULL COMMENT 'Fecha para reporte',
  `desde` time DEFAULT NULL COMMENT 'Fecha de inicio',
  `hasta` time DEFAULT NULL COMMENT 'Fecha de fin',
  `tiempo` bigint(16) DEFAULT NULL COMMENT 'Tiempo real del paro',
  `turno` bigint(11) DEFAULT NULL COMMENT 'ID del turno',
  `inicio` bigint(11) DEFAULT NULL COMMENT 'Usuario que inició',
  `finalizo` bigint(11) DEFAULT NULL COMMENT 'Usuario que finalizó',
  `contabilizar` char(1) DEFAULT NULL COMMENT 'Contabilizar paro (S/N)',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`desde`,`hasta`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COMMENT='Detalle de paros';

/*Table structure for table `dias` */

DROP TABLE IF EXISTS `dias`;

CREATE TABLE `dias` (
  `fecha` date NOT NULL COMMENT 'Fecha del día',
  PRIMARY KEY (`fecha`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Tabla de dias';

/*Table structure for table `disponibilidad` */

DROP TABLE IF EXISTS `disponibilidad`;

CREATE TABLE `disponibilidad` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `maquina` bigint(11) DEFAULT NULL COMMENT 'ID de la máquina',
  `lunes` bigint(6) DEFAULT NULL COMMENT 'Disponibilidad lunes',
  `martes` bigint(6) DEFAULT NULL COMMENT 'Disponibilidad martes',
  `miercoles` bigint(6) DEFAULT NULL COMMENT 'Disponibilidad miércoles',
  `jueves` bigint(6) DEFAULT NULL COMMENT 'Disponibilidad jueves',
  `viernes` bigint(6) DEFAULT NULL COMMENT 'Disponibilidad viernes',
  `sabado` bigint(6) DEFAULT NULL COMMENT 'Disponibilidad sábado',
  `domingo` bigint(6) DEFAULT NULL COMMENT 'Disponibilidad domingo',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de disponibilidad';

/*Table structure for table `fallas` */

DROP TABLE IF EXISTS `fallas`;

CREATE TABLE `fallas` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
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
) ENGINE=MyISAM AUTO_INCREMENT=823 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de fallas';

/*Table structure for table `generales` */

DROP TABLE IF EXISTS `generales`;

CREATE TABLE `generales` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `tabla` bigint(5) DEFAULT NULL COMMENT 'ID de la tabla',
  `referencia` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Referencia',
  `nombre` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nombre del registro',
  `imagen` varchar(250) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Imágen a utilizar',
  `colorhexa` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Color hexadecimal',
  `prefijo` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nombre corto',
  `estatus` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Usuario que creó el registro',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Usuario que modificó el registro',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tablas generales';

/*Table structure for table `maquinas` */

DROP TABLE IF EXISTS `maquinas`;

CREATE TABLE `maquinas` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
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
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de máquinas';

/*Table structure for table `mensajes` */

DROP TABLE IF EXISTS `mensajes`;

CREATE TABLE `mensajes` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del reporte',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora del mensaje',
  `celula` bigint(11) DEFAULT NULL COMMENT 'ID de la célula',
  `maquina` bigint(11) DEFAULT NULL COMMENT 'ID de la máquina',
  `area` bigint(11) DEFAULT NULL COMMENT 'ID del área',
  `falla` bigint(11) DEFAULT NULL COMMENT 'ID de la falla',
  `detalle` varchar(200) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Detalle del mensaje',
  `record_id` bigint(11) DEFAULT NULL COMMENT 'Registro en MMCall',
  `solicitante` bigint(11) DEFAULT NULL COMMENT 'Usuario solicitante',
  `parte` bigint(11) DEFAULT NULL COMMENT 'Número de parte',
  `pager` bigint(4) DEFAULT NULL COMMENT 'Número de pager',
  `estatus` int(2) DEFAULT '0' COMMENT 'Estatus del reporte',
  `modificador` bigint(11) DEFAULT NULL COMMENT 'Usuario que modificó',
  `modificado` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora del úñtimo cambio',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12123 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `pagerssmed` */

DROP TABLE IF EXISTS `pagerssmed`;

CREATE TABLE `pagerssmed` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `pager` bigint(11) DEFAULT NULL COMMENT 'ID del pager en MMCall',
  `nombre` varchar(30) DEFAULT NULL COMMENT 'Nombre asignado al pager (MMCall)',
  `secuencia` int(4) DEFAULT NULL COMMENT 'Secuencia en la pantalla',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='Tabla de pagers activos para SMED';

/*Table structure for table `parametros` */

DROP TABLE IF EXISTS `parametros`;

CREATE TABLE `parametros` (
  `cliente` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'ID de cliente',
  `planta` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'Nombre de la planta',
  `grupo` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT 'Nombre de grupo',
  `clave` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'Clave de cronos para uso de la aplicación',
  `serial` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'Número de serial',
  `version` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT 'Versión',
  `tiempo_reporte` bigint(6) DEFAULT NULL COMMENT 'Tiempo máximo para reporte (segundos)',
  `tiempo_cierre_turno` bigint(6) DEFAULT NULL COMMENT 'Tiempo cambio de turno (segundos)',
  `mttr` bigint(16) DEFAULT NULL COMMENT 'MTTR esperado',
  `mtbf` bigint(16) DEFAULT NULL COMMENT 'MTBF esperado',
  `textomttr` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT 'Texto para MTTR',
  `textomtbf` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT 'Texto para MTBF',
  `valorpareto` int(3) DEFAULT NULL COMMENT 'Valor para pareto',
  `textopareto` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT 'Texto para pareto',
  `textoreparando` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'Texto a mostrar cuando se está reparando',
  `textoespera` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'Texto a mostrar en la espera',
  `marquesina` varchar(5000) COLLATE utf8_bin DEFAULT NULL,
  `carpetaimagenes` char(1) COLLATE utf8_bin DEFAULT NULL,
  `duracion` int(4) DEFAULT NULL,
  `setup` varchar(35) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabka de parámetros';

/*Table structure for table `paros` */

DROP TABLE IF EXISTS `paros`;

CREATE TABLE `paros` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `referencia` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Referencia',
  `nombre` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nombre del área',
  `imagen` varchar(250) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Imágen a utilizar',
  `colorhexa` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Color hexadecimal',
  `secuencia` int(6) DEFAULT NULL COMMENT 'Secuencia en pantalla',
  `prefijo` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nombre corto',
  `notas` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT 'Notas a mostrar',
  `inicia` time DEFAULT NULL COMMENT 'Hora de inicio',
  `termina` time DEFAULT NULL COMMENT 'Hora fin',
  `unavez` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Paro de una sóla vez',
  `tiempo` bigint(16) DEFAULT NULL COMMENT 'Tiempo planeado del paro',
  `estatus` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Usuario que creó el registro',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Usuario que modificó el registro',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de paros';

/*Table structure for table `partes` */

DROP TABLE IF EXISTS `partes`;

CREATE TABLE `partes` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `referencia` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Número de parte',
  `estatus` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Usuario que creó el registro',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Usuario que modificó el registro',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de numeros de parte';

/*Table structure for table `partexmaquina` */

DROP TABLE IF EXISTS `partexmaquina`;

CREATE TABLE `partexmaquina` (
  `parte` bigint(11) DEFAULT NULL COMMENT 'ID del número de parte',
  `maquina` bigint(11) DEFAULT NULL COMMENT 'ID de la máquina',
  KEY `NewIndex1` (`parte`,`maquina`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Relación Parte x Máquina';

/*Table structure for table `permisos` */

DROP TABLE IF EXISTS `permisos`;

CREATE TABLE `permisos` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `nombre` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT 'Nombre del rol',
  `administrador` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Rol de administrador',
  `llamada` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Puede generar llamadas',
  `atencion` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Puede atender llamadas',
  `smed` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Puede generar SMED',
  `panel` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Puede ver panel',
  `graficas` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Puede ver gráficas',
  `catalogos` char(12) COLLATE utf8_bin DEFAULT NULL,
  `reportes` char(12) COLLATE utf8_bin DEFAULT NULL,
  `configuracion` char(12) COLLATE utf8_bin DEFAULT NULL,
  `estatus` char(1) COLLATE utf8_bin DEFAULT NULL,
  `creacion` timestamp NULL DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `creado` bigint(11) DEFAULT NULL,
  `modificado` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de permisos por roles';

/*Table structure for table `politicas` */

DROP TABLE IF EXISTS `politicas`;

CREATE TABLE `politicas` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `imagen` varchar(250) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Imágen a utilizar',
  `colorhexa` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Color hexadecimal',
  `nombre` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nombre corto',
  `deunsolouso` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'De un sólo uso',
  `obligatoria` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Se requiere contraseña?',
  `vence` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT 'La contraseña vence?',
  `diasvencimiento` bigint(7) DEFAULT NULL COMMENT 'Días para vencerse',
  `aviso` bigint(7) DEFAULT NULL COMMENT 'Días de anticipación para avisar',
  `complejidad` char(6) COLLATE utf8_bin DEFAULT NULL COMMENT 'Complejidad de la contraseña (1-2=largo,3=especiales,4=numeros,5=mayus/minus)',
  `usadas` int(2) DEFAULT NULL COMMENT 'Últimas contraseñas usadas',
  `caducidad` int(3) DEFAULT NULL COMMENT 'Días de gracia',
  `estatus` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Usuario que creó el registro',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Usuario que modificó el registro',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de políticas';

/*Table structure for table `preferencias` */

DROP TABLE IF EXISTS `preferencias`;

CREATE TABLE `preferencias` (
  `usuario` bigint(11) DEFAULT NULL COMMENT 'ID de usuario',
  `grafica` bigint(11) DEFAULT NULL COMMENT 'Número de gráfica',
  `texto` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Título de la gráfica',
  `maximo` int(4) DEFAULT NULL COMMENT 'Máximo de barras',
  `maximopct` int(3) DEFAULT NULL COMMENT 'Máximo en PCT',
  `vermesanterior` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Ver mes anterior (S/N)',
  `veranyoanterior` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Ves año anterior',
  `compararmesanyo` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Ver mismo mes año anterior',
  `verytd` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Ver YTD',
  `vermtd` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Ver MTD',
  `agrupar` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Agrupar las últimas barras',
  `textox` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Texto en la X',
  `textoy` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Texto en la Y',
  `textoz` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Texto en la Z',
  `dias` int(4) DEFAULT '0' COMMENT 'Días atrás',
  `font1` int(2) DEFAULT '0' COMMENT 'Título',
  `font2` int(2) DEFAULT NULL COMMENT 'Titulo en eje',
  `font3` int(2) DEFAULT NULL COMMENT 'Escala',
  `font4` int(2) DEFAULT NULL COMMENT 'Etiqueta en barras',
  `font5` int(2) DEFAULT NULL COMMENT 'Etiqueta en barras',
  `font6` int(2) DEFAULT NULL COMMENT 'Data labels',
  `ancho` int(5) DEFAULT NULL COMMENT 'Ancho de la gráfica',
  `alto` int(5) DEFAULT NULL COMMENT 'Alto de la gráfica',
  `margenizq` int(6) DEFAULT NULL COMMENT 'Margen Izquierdo',
  `margender` int(6) DEFAULT NULL COMMENT 'Maegen derecho',
  `margentop` int(6) DEFAULT NULL COMMENT 'Margen arriba',
  `margenbot` int(6) DEFAULT NULL COMMENT 'Margen abajo',
  `rotar` int(3) DEFAULT NULL COMMENT 'Grados a rotar el texto',
  `filtrarhist` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Aplicar filtro al histórico',
  KEY `NewIndex1` (`usuario`,`grafica`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de preferencias por gráfica';

/*Table structure for table `reportes` */

DROP TABLE IF EXISTS `reportes`;

CREATE TABLE `reportes` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del reporte',
  `numero` bigint(11) DEFAULT NULL COMMENT 'Número de reporte',
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora del reporte',
  `celula` bigint(11) DEFAULT NULL COMMENT 'ID de la célula',
  `maquina` bigint(11) DEFAULT NULL COMMENT 'ID de la máquina',
  `turno` bigint(11) DEFAULT NULL COMMENT 'ID del turno',
  `area` bigint(11) DEFAULT NULL COMMENT 'ID del área',
  `falla` bigint(11) DEFAULT NULL COMMENT 'ID de la falla',
  `detalle` varchar(200) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Detalle de la falla',
  `record_id` bigint(11) DEFAULT NULL COMMENT 'Registro en MMCall',
  `requester` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'Código del requester en MMCall',
  `solicitante` bigint(11) DEFAULT NULL COMMENT 'Usuario solicitante',
  `tecnicoatend` bigint(11) DEFAULT NULL,
  `tecnico` bigint(11) DEFAULT NULL COMMENT 'Técnico',
  `tipo` bigint(4) DEFAULT NULL COMMENT 'Tipo de mantenimiento',
  `estatus` int(4) DEFAULT '0' COMMENT 'Estatus del reporte',
  `falla_ajustada` bigint(11) DEFAULT NULL COMMENT 'ID de la falla ajustada',
  `inicio_atencion` datetime DEFAULT NULL COMMENT 'Fecha y hora de inicio de la atención',
  `cierre_atencion` datetime DEFAULT NULL COMMENT 'Fecha y hora del cierre de la atención',
  `inicio_reporte` datetime DEFAULT NULL COMMENT 'Fecha y hora de inicio del reporte',
  `alarmado` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT 'El reporte fue alarmado?',
  `tiempo` bigint(11) DEFAULT '0' COMMENT 'Tiempo en segundos del reporte',
  `comentarios` varchar(200) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Comentarios del reporte',
  `cierre_reporte` datetime DEFAULT NULL COMMENT 'Fecha y hora del cierre del reporte',
  `contabilizar` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Contabilizar el reporte?',
  `fecha_reporte` date DEFAULT NULL COMMENT 'Fecha del reporte',
  `tiempototal` bigint(11) DEFAULT '0' COMMENT 'Tiempo total de la falla',
  `tiempoatencion` bigint(11) DEFAULT '0' COMMENT 'Tiempo total de la atención',
  `modificador` bigint(11) DEFAULT NULL COMMENT 'Usuario que modificó',
  `modificado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora del úñtimo cambio',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`numero`),
  KEY `NewIndex2` (`fecha`),
  KEY `NewIndex3` (`maquina`,`estatus`),
  KEY `NewIndex4` (`celula`,`estatus`),
  KEY `NewIndex5` (`area`,`estatus`)
) ENGINE=MyISAM AUTO_INCREMENT=16943 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de reportes';

/*Table structure for table `reproductor` */

DROP TABLE IF EXISTS `reproductor`;

CREATE TABLE `reproductor` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `grafica` bigint(11) DEFAULT NULL COMMENT 'Número de la gráfica',
  `orden` int(4) DEFAULT NULL COMMENT 'Orden de la vista',
  `duracion` int(4) DEFAULT NULL COMMENT 'Duración en segundo',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=265 DEFAULT CHARSET=latin1 COMMENT='Reproductor';

/*Table structure for table `tablas` */

DROP TABLE IF EXISTS `tablas`;

CREATE TABLE `tablas` (
  `tabla` bigint(11) DEFAULT NULL COMMENT 'ID de la tabla',
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'Descripción de la tabla'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Nombre de tablas';

/*Table structure for table `turnos` */

DROP TABLE IF EXISTS `turnos`;

CREATE TABLE `turnos` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `referencia` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Referencia',
  `inicia` time DEFAULT NULL COMMENT 'Hora de inicio',
  `termina` time DEFAULT NULL COMMENT 'Hora de Fin',
  `cambiodia` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Pasa de un día a otro (S/N)',
  `especial` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Turno especial (S/N)',
  `diurno` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Turno diario (S/N)',
  `hora_inicio` time DEFAULT NULL COMMENT 'Hora de inicio',
  `hora_fin` time DEFAULT NULL COMMENT 'Hora de fin',
  `mover` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Mover? S=Si, N=No',
  `secuencia` int(2) DEFAULT NULL COMMENT 'Secuencia del turno',
  `estatus` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Usuario que creó el registro',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Usuario que modificó el registro',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de turnos';

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del registro',
  `referencia` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Referencia',
  `contrasena` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Contraseña',
  `nombre` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nombres del usuario',
  `rol` bigint(11) DEFAULT NULL COMMENT 'ID del rol',
  `departamento` bigint(11) DEFAULT NULL COMMENT 'ID del departamento',
  `puesto` bigint(11) DEFAULT NULL COMMENT 'ID del puesto',
  `localidad` bigint(11) DEFAULT NULL COMMENT 'ID de la localidad',
  `planta` bigint(11) DEFAULT NULL COMMENT 'ID de la planta',
  `compania` bigint(11) DEFAULT NULL COMMENT 'ID de la compañia',
  `imagen` varchar(250) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Imágen a utilizar',
  `colorhexa` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Color hexadecimal',
  `prefijo` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nombre corto',
  `ultimoingreso` datetime DEFAULT NULL COMMENT 'Fecha del ultimo ingreso',
  `ultmasalida` datetime DEFAULT NULL COMMENT 'Fecha salida',
  `caducado` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Contraseñ caducada',
  `politica` bigint(11) DEFAULT NULL COMMENT 'ID política de usuario',
  `ultimocambio` date DEFAULT NULL COMMENT 'Fecha del último cambio de contraseña',
  `email` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Cuenta de correos personal',
  `emailcorporativo` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Cuenta de correos corporativo',
  `inicializada` char(1) COLLATE utf8_bin DEFAULT NULL,
  `contrasena1` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Acceso a maestros',
  `contrasena2` char(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Tiene acceso a atender solicitudes',
  `contrasena3` char(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Tiene acceso a SMED',
  `contrasena4` char(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Tiene acceso a llamadas',
  `contrasena5` char(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Tiene acceso a configurar',
  `estatus` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Estatus del registro',
  `creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de creación',
  `modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificación',
  `creado` bigint(11) DEFAULT NULL COMMENT 'Usuario que creó el registro',
  `modificado` bigint(11) DEFAULT NULL COMMENT 'Usuario que modificó el registro',
  `admin` char(1) COLLATE utf8_bin DEFAULT NULL,
  `tecnico` char(1) COLLATE utf8_bin DEFAULT NULL,
  `vermaquina` char(1) COLLATE utf8_bin DEFAULT NULL,
  `verfalla` char(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`referencia`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tabla de usuarios';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
