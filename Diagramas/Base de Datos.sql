-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`coord_almacen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`coord_almacen` (
  `idcoord_almacen` INT NOT NULL AUTO_INCREMENT,
  `doc_identidad` INT(10) NOT NULL,
  `nombre_ca` VARCHAR(45) NOT NULL,
  `apellidos_ca` VARCHAR(45) NOT NULL,
  `email_ca` VARCHAR(60) NULL,
  `telefono_ca` INT(10) NOT NULL,
  `cargo_ca` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcoord_almacen`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vendedor` (
  `idvendedor` INT NOT NULL AUTO_INCREMENT,
  `fecha_vinculacion` DATE NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idvendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proveedor` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `nit_proveedor` INT(16) NOT NULL,
  `nombre_proveedor` VARCHAR(45) NOT NULL,
  `direccion_proveedor` VARCHAR(45) NOT NULL,
  `telefono_proveedor` INT(10) NOT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `fecha_inicio` DATE NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`persona` (
  `idpersona` INT NOT NULL AUTO_INCREMENT,
  `tipo_doc_persona` VARCHAR(2) NOT NULL,
  `doc_persona` INT(10) NOT NULL,
  `nombres_persona` VARCHAR(45) NOT NULL,
  `apellidos_persona` VARCHAR(45) NOT NULL,
  `direccion_persona` VARCHAR(45) NOT NULL,
  `telefono_persona` INT(10) NOT NULL,
  `email_persona` VARCHAR(45) NULL,
  `genero_persona` VARCHAR(10) NOT NULL,
  `vendedor_idvendedor` INT NOT NULL,
  `coord_almacen_idcoord_almacen` INT NOT NULL,
  `Proveedor_idProveedor` INT NOT NULL,
  `cliente_idcliente` INT NOT NULL,
  PRIMARY KEY (`idpersona`),
  INDEX `fk_persona_vendedor1_idx` (`vendedor_idvendedor` ASC) VISIBLE,
  INDEX `fk_persona_coord_almacen1_idx` (`coord_almacen_idcoord_almacen` ASC) VISIBLE,
  INDEX `fk_persona_Proveedor1_idx` (`Proveedor_idProveedor` ASC) VISIBLE,
  INDEX `fk_persona_cliente1_idx` (`cliente_idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_persona_vendedor1`
    FOREIGN KEY (`vendedor_idvendedor`)
    REFERENCES `mydb`.`vendedor` (`idvendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_coord_almacen1`
    FOREIGN KEY (`coord_almacen_idcoord_almacen`)
    REFERENCES `mydb`.`coord_almacen` (`idcoord_almacen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_Proveedor1`
    FOREIGN KEY (`Proveedor_idProveedor`)
    REFERENCES `mydb`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `mydb`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`productos` (
  `idproductos` INT NOT NULL AUTO_INCREMENT,
  `tipo_producto` VARCHAR(45) NULL,
  `nombre_producto` VARCHAR(45) NULL,
  `descripcion_producto` VARCHAR(45) NULL,
  `precio_producto` DECIMAL NOT NULL,
  `ubicacion_producto` VARCHAR(45) NOT NULL,
  `fabricacion_producto` VARCHAR(45) NOT NULL,
  `cantidad_producto` INT NULL,
  PRIMARY KEY (`idproductos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente_has_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente_has_productos` (
  `cliente_idcliente` INT NOT NULL,
  `productos_idproductos` INT NOT NULL,
  PRIMARY KEY (`cliente_idcliente`, `productos_idproductos`),
  INDEX `fk_cliente_has_productos_productos1_idx` (`productos_idproductos` ASC) VISIBLE,
  INDEX `fk_cliente_has_productos_cliente1_idx` (`cliente_idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_has_productos_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `mydb`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_productos_productos1`
    FOREIGN KEY (`productos_idproductos`)
    REFERENCES `mydb`.`productos` (`idproductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
