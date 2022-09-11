-- -----------------------------------------------------
-- Schema movies_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `movies_db` DEFAULT CHARACTER SET utf8 ;
USE `movies_db` ;

-- -----------------------------------------------------
-- Table `movies_db`.`persons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies_db`.`persons` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `dob` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies_db`.`movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies_db`.`movies` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  `rating` INT NULL,
  `runtime` TIME NULL,
  `genre` VARCHAR(255) NULL,
  `earnings_rank` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies_db`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies_db`.`actors` (
  `actor_id` INT NOT NULL,
  `movies_id` INT NOT NULL,
  PRIMARY KEY (`actor_id`, `movies_id`),
  CONSTRAINT `fk_persons_has_movies_persons`
    FOREIGN KEY (`actor_id`)
    REFERENCES `movies_db`.`persons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_persons_has_movies_movies1`
    FOREIGN KEY (`movies_id`)
    REFERENCES `movies_db`.`movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies_db`.`directors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies_db`.`directors` (
  `director_id` INT NOT NULL,
  `movies_id` INT NOT NULL,
  PRIMARY KEY (`director_id`, `movies_id`),
  CONSTRAINT `fk_persons_has_movies_persons1`
    FOREIGN KEY (`director_id`)
    REFERENCES `movies_db`.`persons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_persons_has_movies_movies2`
    FOREIGN KEY (`movies_id`)
    REFERENCES `movies_db`.`movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies_db`.`oscars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies_db`.`oscars` (
  `movies_id` INT NOT NULL,
  `persons_id` INT NOT NULL,
  `type` VARCHAR(255) NULL,
  `year` YEAR NULL,
  PRIMARY KEY (`persons_id`, `movies_id`),
  CONSTRAINT `fk_movies_has_persons_movies1`
    FOREIGN KEY (`movies_id`)
    REFERENCES `movies_db`.`movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movies_has_persons_persons1`
    FOREIGN KEY (`persons_id`)
    REFERENCES `movies_db`.`persons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

