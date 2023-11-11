DROP DATABASE if exists college;
CREATE DATABASE IF NOT EXISTS college;

use college;

DROP TABLE IF EXISTS student;

CREATE TABLE IF NOT EXISTS student
(
	student_id INT primary key not null auto_increment,
    name varchar(50) not null
);

ALTER TABLE STUDENT 
	ADD email varchar(255) not null unique,
    add department_id int,
    add   constraint unique (name),
    modify name varchar(255),
    add foreign key fk_student_department (department_id) references department(department_id);

DROP TABLE IF EXISTS student;

DROP TABLE IF EXISTS department;
CREATE TABLE IF NOT EXISTS department
(
	department_id int primary key  auto_increment,
    name varchar(255) not null
    
);


CREATE TABLE IF NOT EXISTS city
(
  city_id int primary key auto_increment,
  name varchar(20) not null
);

ALTER TABLE student
ADD CONSTRAINT fk_student_city
FOREIGN KEY (city_id) REFERENCES city(city_id);
    