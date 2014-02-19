SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`genders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`genders` (
  `idgender` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idgender`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cities` (
  `idcity` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcity`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NULL,
  `lastname` VARCHAR(255) NULL,
  `photo` VARCHAR(255) NULL,
  `description` TEXT NULL,
  `bdate` DATE NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` TIMESTAMP NULL DEFAULT NULL,
  `genders_idgender` INT NOT NULL,
  `cities_idcity` INT NOT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_users_genders_idx` (`genders_idgender` ASC),
  INDEX `fk_users_cities1_idx` (`cities_idcity` ASC),
  CONSTRAINT `fk_users_genders`
    FOREIGN KEY (`genders_idgender`)
    REFERENCES `mydb`.`genders` (`idgender`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_cities1`
    FOREIGN KEY (`cities_idcity`)
    REFERENCES `mydb`.`cities` (`idcity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pets` (
  `idpet` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpet`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`languages` (
  `idlanguage` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idlanguage`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users_has_pets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users_has_pets` (
  `users_iduser` INT NOT NULL,
  `pets_idpet` INT NOT NULL,
  PRIMARY KEY (`users_iduser`, `pets_idpet`),
  INDEX `fk_users_has_pets_pets1_idx` (`pets_idpet` ASC),
  INDEX `fk_users_has_pets_users1_idx` (`users_iduser` ASC),
  CONSTRAINT `fk_users_has_pets_users1`
    FOREIGN KEY (`users_iduser`)
    REFERENCES `mydb`.`users` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_pets_pets1`
    FOREIGN KEY (`pets_idpet`)
    REFERENCES `mydb`.`pets` (`idpet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users_has_languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users_has_languages` (
  `users_iduser` INT NOT NULL,
  `languages_idlanguage` INT NOT NULL,
  PRIMARY KEY (`users_iduser`, `languages_idlanguage`),
  INDEX `fk_users_has_languages_languages1_idx` (`languages_idlanguage` ASC),
  INDEX `fk_users_has_languages_users1_idx` (`users_iduser` ASC),
  CONSTRAINT `fk_users_has_languages_users1`
    FOREIGN KEY (`users_iduser`)
    REFERENCES `mydb`.`users` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_languages_languages1`
    FOREIGN KEY (`languages_idlanguage`)
    REFERENCES `mydb`.`languages` (`idlanguage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
