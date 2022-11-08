-- Crear base de datos
CREATE DATABASE IF NOT EXISTS KnowEmUP;
USE KnowEmUP;

-- Crear tabla
CREATE TABLE IF NOT EXISTS `users`
(
    `studentID`   varchar(7)  NOT NULL,
    `progress_id` varchar(25) NOT NULL,
    `username`    varchar(25) NOT NULL,
    `fname`       varchar(50) NOT NULL,
    `lname`       varchar(50) NOT NULL,
    `email`       varchar(50) NOT NULL,
    `password`    varchar(50) NOT NULL,
    `faculty`     varchar(50) NOT NULL,
    `carreer`     varchar(50) NOT NULL,
    `semester`    INT(2)      NOT NULL,
    `gender`      varchar(50) NOT NULL,
    PRIMARY KEY (`studentID`, `progress_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


-- Crear tabla profesores
CREATE TABLE IF NOT EXISTS `teachers`
(
    `teacherID` int(7)      NOT NULL,
    `fname`     varchar(50) NOT NULL,
    `lname`     varchar(50) NOT NULL,
    `email`     varchar(50) NOT NULL,
    PRIMARY KEY (`teacherID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


-- Crear tabla de materias
CREATE TABLE IF NOT EXISTS `subjects`
(
    `id`          int(7)      NOT NULL,
    `name`        varchar(50) NOT NULL,
    `semester`    INT(2)      NOT NULL,
    `teacherID`   int(7)      NOT NULL,
    `teacherName` varchar(50) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`teacherID`) REFERENCES teachers (`teacherID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


-- Crear tabla de que guarde las materias que ha tomado ese usuario
CREATE TABLE IF NOT EXISTS `user_subjects`
(
    `studentID`    varchar(7)  NOT NULL,
    `progress_id`  varchar(25) NOT NULL,
    `subjectID`    int(7)      NOT NULL,
    `subjectName`  varchar(50) NOT NULL,
    `semester`     INT(2)      NOT NULL,
    `teacherID`    int(7)      NOT NULL,
    `teacherName`  varchar(50) NOT NULL,
    `final_grade`  DOUBLE      NOT NULL,
    `review_grade` DOUBLE      NOT NULL,
    FOREIGN KEY (`studentID`) REFERENCES users (`studentID`),
    FOREIGN KEY (`subjectID`) REFERENCES subjects (`id`),
    FOREIGN KEY (`teacherID`) REFERENCES teachers (`teacherID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- Crear una tabla que guarde las calificaciones de los estudiantes a cada maestro
CREATE TABLE IF NOT EXISTS `teacher_grades`
(
    `teacherID` int(7)     NOT NULL,
    `studentID` varchar(7) NOT NULL,
    `grade`     DOUBLE     NOT NULL,
    FOREIGN KEY (`teacherID`) REFERENCES teachers (`teacherID`),
    FOREIGN KEY (`studentID`) REFERENCES users (`studentID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- Crear una tabla que guarde las calificaciones de los estudiantes de cada materia
CREATE TABLE IF NOT EXISTS `subject_grades`
(
    `subjectID` int(7)     NOT NULL,
    `studentID` varchar(7) NOT NULL,
    `grade`     DOUBLE     NOT NULL,
    FOREIGN KEY (`subjectID`) REFERENCES subjects (`id`),
    FOREIGN KEY (`studentID`) REFERENCES users (`studentID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;