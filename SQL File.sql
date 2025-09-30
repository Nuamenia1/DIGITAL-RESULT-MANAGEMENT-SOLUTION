
-- create database called Project
create database project;
-- create table called Project
create table Student_list(
admission_no  int primary key,	
first_name	varchar(30),
last_name  varchar(30)
);

-- create table called student profile
create table student_Profile(
student_id varchar(50),
age	int,
gender	varchar(30),
classroom	varchar(30),
sit_number int primary key,

foreign key (student_id) references student_list(admission_no)
);

-- create a table for student demographic
create table student_demographic(
admission_no int primary key,	
first_name	varchar(30),
last_name varchar(30),
age	int,
gender	varchar(30),
classroom	varchar(30),
sit_number int

);




alter table student_demographic
modify column admission_no varchar(30);
select *
from student_demographic;


insert into student_demographic(admission_no, first_name, last_name, age, gender, classroom, sit_number)
select sl.admission_no, sl.first_name, sl.last_name, 
sp.age, sp.gender, sp.classroom, sp.sit_number

from student_list sl
join student_profile sp
on sl.admission_no = sp.student_id;

show create table student_profile;

alter table student_profile
drop foreign key student_profile_ibfk_1;

drop table student_list;
drop table student_profile;


create table course(
course_code	varchar(30) primary key,
course_name varchar(30)

);





create table results(
Serial_no  int primary key,
course_code	varchar(30),
student_id  varchar(30),
first_ca	float,
second_ca	float,
exam	float,
total float,

foreign key (student_id) references student_demographic (admission_no),
foreign key (course_code) references course (course_code)

);



'student_profile', 'CREATE TABLE `student_profile` (\n  `student_id` varchar(50) DEFAULT NULL,\n  `age` int DEFAULT NULL,\n  `gender` varchar(30) DEFAULT NULL,\n  `classroom` varchar(30) DEFAULT NULL,\n  `sit_number` int NOT NULL,\n  PRIMARY KEY (`sit_number`),\n  KEY `student_id` (`student_id`),\n  CONSTRAINT `student_profile_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_list` (`admission_no`)\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'


describe student_demographic;

describe results;

describe course;

select *
from student_demographic;