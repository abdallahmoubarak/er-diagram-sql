-- MySQL Script generated by MySQL Workbench
-- Sun Sep 11 21:59:34 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema university_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema university_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university_db` DEFAULT CHARACTER SET utf8 ;
USE `university_db` ;

-- -----------------------------------------------------
-- Table `university_db`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`rooms` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `capacity` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`courses` (
  `crn` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `start_time` DATETIME NULL,
  `end_time` DATETIME NULL,
  `room_id` INT NOT NULL,
  PRIMARY KEY (`crn`),
  INDEX `fk_courses_rooms1_idx` (`room_id` ASC) VISIBLE,
  CONSTRAINT `fk_courses_rooms1`
    FOREIGN KEY (`room_id`)
    REFERENCES `university_db`.`rooms` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`departments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `office` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`majorsIns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`majorsIns` (
  `student_id` INT NOT NULL,
  `dept_id` INT NOT NULL,
  PRIMARY KEY (`student_id`, `dept_id`),
  INDEX `fk_students_has_departments_departments1_idx` (`dept_id` ASC) VISIBLE,
  INDEX `fk_students_has_departments_students_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_students_has_departments_students`
    FOREIGN KEY (`student_id`)
    REFERENCES `university_db`.`students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_has_departments_departments1`
    FOREIGN KEY (`dept_id`)
    REFERENCES `university_db`.`departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university_db`.`enrolleds`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university_db`.`enrolleds` (
  `student_id` INT NOT NULL,
  `course_crn` INT NOT NULL,
  `credit_status` VARCHAR(255) NULL,
  PRIMARY KEY (`student_id`, `course_crn`),
  INDEX `fk_students_has_courses_courses1_idx` (`course_crn` ASC) VISIBLE,
  INDEX `fk_students_has_courses_students1_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_students_has_courses_students1`
    FOREIGN KEY (`student_id`)
    REFERENCES `university_db`.`students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_has_courses_courses1`
    FOREIGN KEY (`course_crn`)
    REFERENCES `university_db`.`courses` (`crn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
