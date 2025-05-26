
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema projetos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projetos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projetos` DEFAULT CHARACTER SET utf8 ;
USE `projetos` ;

-- -----------------------------------------------------
-- Table `projetos`.`projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetos`.`projeto` (
  `idProjeto` INT NOT NULL,
  `deProjeto` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idProjeto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projetos`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projetos`.`usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `idNome` VARCHAR(45) NULL,
  `idEmail` VARCHAR(45) NULL,
  `idProtocoo` INT NULL,
  `idProjeto` INT NOT NULL,
  PRIMARY KEY (`idUsuario`, `idProjeto`),
  INDEX `fk_usuario_projeto_idx` (`idProjeto` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_projeto`
    FOREIGN KEY (`idProjeto`)
    REFERENCES `projetos`.`projeto` (`idProjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `projetos`.`projeto`
(`idProjeto`, `deProjeto`) VALUES (0, 'Subestação');

INSERT INTO `projetos`.`projeto`
(`idProjeto`, `deProjeto`) VALUES (1, 'Solar');

INSERT INTO `projetos`.`projeto`
(`idProjeto`, `deProjeto`) VALUES (2, 'Padrão de Entrada');
