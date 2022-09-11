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