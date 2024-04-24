-- MySQL Workbench Synchronization
-- Generated: 2024-04-24 03:47
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: v3ct0r

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `repositorio_incos` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `repositorio_incos`.`administrativos` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user` VARCHAR(31) NULL DEFAULT NULL,
  `pass` VARCHAR(61) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `usuario_UNIQUE` (`user` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `repositorio_incos`.`administrativos_informacion` (
  `administrativos_id` INT(10) UNSIGNED NOT NULL,
  `nombres` VARCHAR(45) NOT NULL,
  `apellido_paterno` VARCHAR(45) NULL DEFAULT NULL,
  `apellido_materno` VARCHAR(45) NULL DEFAULT NULL,
  `telefonos` VARCHAR(45) NULL DEFAULT NULL,
  INDEX `fk_administrativos_informacion_administrativos_idx` (`administrativos_id` ASC),
  CONSTRAINT `fk_administrativos_informacion_administrativos`
    FOREIGN KEY (`administrativos_id`)
    REFERENCES `repositorio_incos`.`administrativos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `repositorio_incos`.`estudiantes` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `carreras_sid` VARCHAR(31) NULL DEFAULT NULL,
  `nombres` VARCHAR(63) NOT NULL,
  `apellido_paterno` VARCHAR(31) NULL DEFAULT NULL,
  `apellido_materno` VARCHAR(31) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_estudiantes_carreras1_idx` (`carreras_sid` ASC),
  CONSTRAINT `fk_estudiantes_carreras1`
    FOREIGN KEY (`carreras_sid`)
    REFERENCES `repositorio_incos`.`carreras` (`sid`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `repositorio_incos`.`tutores` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(63) NOT NULL,
  `apellido_paterno` VARCHAR(31) NULL DEFAULT NULL,
  `apellido_materno` VARCHAR(31) NULL DEFAULT NULL,
  `nivel_educativo` VARCHAR(127) NOT NULL,
  `especializacion` VARCHAR(127) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `repositorio_incos`.`tipo_proyectos` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `tipo_UNIQUE` (`tipo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `repositorio_incos`.`proyectos` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `carreras_sid` VARCHAR(31) NOT NULL COMMENT  /* comment truncated */ /*Podria darse el caso de que un mismo estudiante tenga varias carreras a lo largo de su vida en la institucion y realize varios proyectos*/,
  `tipo_proyectos_id` INT(10) UNSIGNED NOT NULL,
  `tutores_id` INT(10) UNSIGNED NOT NULL,
  `estudiantes_id` INT(10) UNSIGNED NOT NULL,
  `titulo` VARCHAR(127) NOT NULL,
  `anio_defensa` SMALLINT(4) UNSIGNED NOT NULL,
  `descripcion` VARCHAR(2047) NOT NULL,
  `resumen` TEXT NOT NULL,
  `pdf` LONGBLOB NOT NULL COMMENT  /* comment truncated */ /*Archivo PDF del Proyecto*/,
  `activo` ENUM("si", "no") NOT NULL DEFAULT 'si' COMMENT  /* comment truncated */ /*Para identificar si esta borrado logicamente o no*/,
  `auditoria_administrativos_id` INT(10) UNSIGNED NOT NULL,
  `auditoria_fecha_hora` DATETIME NOT NULL DEFAULT NOW(),
  `auditoria_accion` ENUM("agregar", "modificar", "borrar") NOT NULL DEFAULT 'agregar',
  `auditoria_descripcion` VARCHAR(255) NOT NULL DEFAULT 'Nuevo registro',
  PRIMARY KEY (`id`, `carreras_sid`, `tipo_proyectos_id`, `tutores_id`, `estudiantes_id`, `auditoria_administrativos_id`),
  INDEX `fk_proyectos_tipo_proyectos1_idx` (`tipo_proyectos_id` ASC),
  INDEX `fk_proyectos_tutores1_idx` (`tutores_id` ASC),
  INDEX `fk_proyectos_estudiantes1_idx` (`estudiantes_id` ASC),
  INDEX `fk_proyectos_carreras1_idx` (`carreras_sid` ASC),
  INDEX `fk_proyectos_administrativos1_idx` (`auditoria_administrativos_id` ASC),
  CONSTRAINT `fk_proyectos_tipo_proyectos1`
    FOREIGN KEY (`tipo_proyectos_id`)
    REFERENCES `repositorio_incos`.`tipo_proyectos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proyectos_tutores1`
    FOREIGN KEY (`tutores_id`)
    REFERENCES `repositorio_incos`.`tutores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proyectos_estudiantes1`
    FOREIGN KEY (`estudiantes_id`)
    REFERENCES `repositorio_incos`.`estudiantes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proyectos_carreras1`
    FOREIGN KEY (`carreras_sid`)
    REFERENCES `repositorio_incos`.`carreras` (`sid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proyectos_administrativos1`
    FOREIGN KEY (`auditoria_administrativos_id`)
    REFERENCES `repositorio_incos`.`administrativos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT =  /* comment truncated */ /*esta tabla es el pilar Central del proyecto, el cual dispone de TRIGGERS*/;

CREATE TABLE IF NOT EXISTS `repositorio_incos`.`carreras` (
  `sid` VARCHAR(31) NOT NULL COMMENT  /* comment truncated */ /*Codigo unico de la carrera*/,
  `nombre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE INDEX `sid_UNIQUE` (`sid` ASC),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `repositorio_incos`.`proyecto_auditorias` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `proyectos_id` INT(10) UNSIGNED NOT NULL,
  `auditoria_administrativos_id` INT(10) UNSIGNED NOT NULL,
  `auditoria_fecha_hora` DATETIME NOT NULL,
  `auditoria_accion` ENUM("agregar", "modificar", "borrar") NOT NULL,
  `auditoria_descripcion` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`, `proyectos_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_proyectos_auditoria_administrativos1_idx` (`auditoria_administrativos_id` ASC),
  INDEX `fk_proyectos_proyectos_id_idx` (`proyectos_id` ASC),
  CONSTRAINT `fk_proyectos_auditoria_administrativos1`
    FOREIGN KEY (`auditoria_administrativos_id`)
    REFERENCES `repositorio_incos`.`administrativos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proyectos_proyectos_id`
    FOREIGN KEY (`proyectos_id`)
    REFERENCES `repositorio_incos`.`proyectos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Placeholder table for view `repositorio_incos`.`reporte_auditorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `repositorio_incos`.`reporte_auditorias` (`'proyectos_id'` INT, `'usuario'` INT, `'accion'` INT, `'fecha'` INT, `'proyecto_titulo'` INT, `'auditoria_descripcion'` INT);

-- -----------------------------------------------------
-- Placeholder table for view `repositorio_incos`.`reporte_proyecto_auditorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `repositorio_incos`.`reporte_proyecto_auditorias` (`id` INT, `proyectos_id` INT, `auditoria_administrativos_id` INT, `auditoria_fecha_hora` INT, `auditoria_accion` INT, `auditoria_descripcion` INT, `proyectos_titulo` INT, `administrativos_usuario` INT);

-- -----------------------------------------------------
-- Placeholder table for view `repositorio_incos`.`reporte_proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `repositorio_incos`.`reporte_proyectos` (`id` INT, `carreras_sid` INT, `tipo_proyectos_id` INT, `tutores_id` INT, `estudiantes_id` INT, `titulo` INT, `anio_defensa` INT, `descripcion` INT, `resumen` INT, `carrera` INT, `tipo_proyecto` INT, `tutor` INT, `estudiante` INT);


USE `repositorio_incos`;

-- -----------------------------------------------------
-- View `repositorio_incos`.`reporte_auditorias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `repositorio_incos`.`reporte_auditorias`;
USE `repositorio_incos`;
-- Esta Vista Deberia estar oculta y solo ser llamada para generar reportes
-- cols = proyectos_id,usuario,accion,fecha,proyecto_titulo,auditoria_descripcion
CREATE  OR REPLACE VIEW `reporte_auditorias` AS
SELECT 
    pa.proyectos_id AS 'proyectos_id',
	a.`user`AS 'usuario'  ,
    pa.auditoria_accion AS 'accion' ,
    pa.auditoria_fecha_hora AS 'fecha',
    p.titulo AS 'proyecto_titulo' , 
    pa.auditoria_descripcion as 'auditoria_descripcion'
FROM proyecto_auditorias AS pa
INNER JOIN administrativos AS a ON a.id = pa.auditoria_administrativos_id
INNER JOIN proyectos AS p ON p.id = pa.proyectos_id
LIMIT 100;


USE `repositorio_incos`;

-- -----------------------------------------------------
-- View `repositorio_incos`.`reporte_proyecto_auditorias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `repositorio_incos`.`reporte_proyecto_auditorias`;
USE `repositorio_incos`;
CREATE  OR REPLACE VIEW `reporte_proyecto_auditorias` AS
SELECT pa.*
	, p.titulo AS proyectos_titulo
    , a.`user` AS administrativos_usuario
FROM proyecto_auditorias AS pa
INNER JOIN administrativos AS a ON a.id = pa.auditoria_administrativos_id
INNER JOIN proyectos AS p ON p.id = pa.proyectos_id;


USE `repositorio_incos`;

-- -----------------------------------------------------
-- View `repositorio_incos`.`reporte_proyectos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `repositorio_incos`.`reporte_proyectos`;
USE `repositorio_incos`;
CREATE  OR REPLACE VIEW `reporte_proyectos` AS
-- Este reporte sera usado tambien para las Busquedas con proyectos activos y asi no se toma en cuenta el PDF para ser mas rapido
SELECT
	p.id , p.carreras_sid , p.tipo_proyectos_id , p.tutores_id, p.estudiantes_id
	, p.titulo
	, p.anio_defensa
	, p.descripcion
	, p.resumen
	, c.nombre   AS carrera
	, tp.tipo    AS tipo_proyecto
	, CONCAT(t.apellido_paterno," ",t.apellido_materno," ",t.nombres)  AS tutor
    , CONCAT(e.apellido_paterno," ",e.apellido_materno," ",e.nombres)  AS estudiante
FROM proyectos AS p
INNER JOIN carreras       AS c  ON  c.sid = p.carreras_sid
INNER JOIN tipo_proyectos AS tp ON tp.id  = p.tipo_proyectos_id
INNER JOIN tutores        AS t  ON  t.id  = p.tutores_id
INNER JOIN estudiantes    AS e  ON  e.id  = p.estudiantes_id
WHERE p.activo = true
-- Columnas para usarlos y crear un Modelo,Pojo,Dto, etc
-- id, carreras_sid, tipo_proyectos_id, tutores_id, estudiantes_id, titulo, anio_defensa, descripcion, resumen, carrera, tipo_proyecto, tutor, estudiante;

DELIMITER $$

USE `repositorio_incos`$$
CREATE DEFINER = CURRENT_USER TRIGGER `repositorio_incos`.`proyectos_AFTER_INSERT` AFTER INSERT ON `proyectos` FOR EACH ROW
BEGIN
    -- Insertar un registro en la tabla proyectos_auditoria
    IF NEW.auditoria_administrativos_id IS NOT NULL THEN        
        -- Insertar un registro en la tabla proyecto_auditorias
        INSERT INTO proyecto_auditorias
               (proyectos_id, auditoria_administrativos_id   , auditoria_fecha_hora, auditoria_accion, auditoria_descripcion)
        VALUES (NEW.id     , NEW.auditoria_administrativos_id,   NOW()             , 'agregar'     , NEW.auditoria_descripcion);
    END IF;
END$$

USE `repositorio_incos`$$
CREATE DEFINER = CURRENT_USER TRIGGER `repositorio_incos`.`proyectos_BEFORE_UPDATE` BEFORE UPDATE ON `proyectos` FOR EACH ROW
BEGIN
    -- Verificar si se proporciona un valor para auditoria_descripcion
    IF NEW.auditoria_descripcion IS NULL THEN
        -- Generar un error y cancelar la acción de actualización si no se proporciona un valor para auditoria_descripcion
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La descripción de auditoría es obligatoria para actualizar un proyecto.';
    ELSE
		-- Determinar la acción de auditoría según el cambio en activo
        CASE
            WHEN OLD.activo = 'si' AND NEW.activo = 'no' THEN
                SET @accion = 'borrar';
            ELSE
                SET @accion = 'modificar';
        END CASE;
        -- Insertar un registro en la tabla proyecto_auditorias
        INSERT INTO proyecto_auditorias
               (proyectos_id, auditoria_administrativos_id   , auditoria_fecha_hora, auditoria_accion, auditoria_descripcion)
        VALUES (OLD.id     , NEW.auditoria_administrativos_id,   NOW()             , @accion     , NEW.auditoria_descripcion);
    END IF;
END$$

USE `repositorio_incos`$$
CREATE DEFINER = CURRENT_USER TRIGGER `repositorio_incos`.`proyectos_BEFORE_DELETE` BEFORE DELETE ON `proyectos` FOR EACH ROW
BEGIN
    -- Generar un error personalizado y cancelar la acción de eliminación
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede eliminar fisicamente el proyecto. Acción cancelada.';
END$$


DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
