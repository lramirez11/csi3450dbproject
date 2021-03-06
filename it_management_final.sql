-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema IT_Management
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `IT_Management` ;

-- -----------------------------------------------------
-- Schema IT_Management
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `IT_Management` DEFAULT CHARACTER SET utf8 ;
USE `IT_Management` ;

-- -----------------------------------------------------
-- Table `IT_Management`.`EMPLOYEE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IT_Management`.`EMPLOYEE` ;

CREATE TABLE IF NOT EXISTS `IT_Management`.`EMPLOYEE` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `FNAME` VARCHAR(45) NULL,
  `LNAME` VARCHAR(45) NULL,
  `DOB` DATETIME NULL,
  `PHONE` VARCHAR(10) NULL,
  `EMAIL` VARCHAR(45) NULL,
  `HIREDATE` DATETIME NULL,
  `STATE` VARCHAR(2) NULL,
  `CITY` VARCHAR(45) NULL,
  `ZIP` VARCHAR(9) NULL,
  `ADDRESS` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IT_Management`.`DEPARTMENT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IT_Management`.`DEPARTMENT` ;

CREATE TABLE IF NOT EXISTS `IT_Management`.`DEPARTMENT` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NULL,
  `EMPLOYEE_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `NAME_UNIQUE` (`NAME` ASC) VISIBLE,
  INDEX `FK_EMPLOYEE_DEPARTMENT_ID` (`EMPLOYEE_ID` ASC) VISIBLE,
  CONSTRAINT `FK_EMPLOYEE_DEPARTMENT_ID`
    FOREIGN KEY (`EMPLOYEE_ID`)
    REFERENCES `IT_Management`.`EMPLOYEE` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IT_Management`.`JOB`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IT_Management`.`JOB` ;

CREATE TABLE IF NOT EXISTS `IT_Management`.`JOB` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TITLE` VARCHAR(45) NULL,
  `PERMISSION_LEVEL` VARCHAR(45) NULL,
  `EMPLOYEE_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FK_EMPLOYEE_JOB_ID` (`EMPLOYEE_ID` ASC) VISIBLE,
  CONSTRAINT `FK_EMPLOYEE_JOB_ID`
    FOREIGN KEY (`EMPLOYEE_ID`)
    REFERENCES `IT_Management`.`EMPLOYEE` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IT_Management`.`VENDOR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IT_Management`.`VENDOR` ;

CREATE TABLE IF NOT EXISTS `IT_Management`.`VENDOR` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NULL,
  `PHONE` VARCHAR(10) NULL,
  `EMAIL` VARCHAR(45) NULL,
  `STATE` VARCHAR(2) NULL,
  `CITY` VARCHAR(45) NULL,
  `ZIP` VARCHAR(9) NULL,
  `ADDRESS` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IT_Management`.`SOFTWARE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IT_Management`.`SOFTWARE` ;

CREATE TABLE IF NOT EXISTS `IT_Management`.`SOFTWARE` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NULL,
  `COST` VARCHAR(45) NULL,
  `EMPLOYEE_ID` INT NOT NULL,
  `VENDOR_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FK_EMPLOYEE_SOFTWARE_ID` (`EMPLOYEE_ID` ASC) VISIBLE,
  INDEX `FK_VENDOR_SOFTWARE_ID` (`VENDOR_ID` ASC) VISIBLE,
  CONSTRAINT `FK_EMPLOYEE_SOFTWARE_ID`
    FOREIGN KEY (`EMPLOYEE_ID`)
    REFERENCES `IT_Management`.`EMPLOYEE` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_VENDOR_SOFTWARE_ID`
    FOREIGN KEY (`VENDOR_ID`)
    REFERENCES `IT_Management`.`VENDOR` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IT_Management`.`HARDWARE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IT_Management`.`HARDWARE` ;

CREATE TABLE IF NOT EXISTS `IT_Management`.`HARDWARE` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `SN` VARCHAR(45) NULL,
  `MODEL` VARCHAR(45) NULL,
  `RAM` VARCHAR(45) NULL,
  `OS` VARCHAR(45) NULL,
  `COST` VARCHAR(45) NULL,
  `TYPE` VARCHAR(45) NULL,
  `EMPLOYEE_ID` INT NOT NULL,
  `VENDOR_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FK_EMPLOYEE_HARDWARE_ID` (`EMPLOYEE_ID` ASC) VISIBLE,
  INDEX `FK_VENDOR_HARDWARE_ID` (`VENDOR_ID` ASC) VISIBLE,
  CONSTRAINT `FK_EMPLOYEE_HARDWARE_ID`
    FOREIGN KEY (`EMPLOYEE_ID`)
    REFERENCES `IT_Management`.`EMPLOYEE` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_VENDOR_HARDWARE_ID`
    FOREIGN KEY (`VENDOR_ID`)
    REFERENCES `IT_Management`.`VENDOR` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IT_Management`.`WARRANTY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IT_Management`.`WARRANTY` ;

CREATE TABLE IF NOT EXISTS `IT_Management`.`WARRANTY` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `EXPIRDATE` DATETIME NULL,
  `STARTDATE` DATETIME NULL,
  `HARDWARE_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FK_HARDWARE_WARRANTY_ID` (`HARDWARE_ID` ASC) VISIBLE,
  CONSTRAINT `FK_HARDWARE_WARRANTY_ID`
    FOREIGN KEY (`HARDWARE_ID`)
    REFERENCES `IT_Management`.`HARDWARE` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
