create database `student_database`;
create table students(
	id int primary key auto_increment not null,
    name_student varchar(45) not null,
    age int,
    country varchar(45)
);
insert into students(name_student, age, country) values ('Nguyen Viet Hoang', 23, 'vietnam');
insert into students(name_student, age, country) values ('Hoang Huynh Duc', 23, 'vietnam');
insert into students(name_student, age, country) values ('Doan Thanh Haii', 25, 'vietnam');
set sql_safe_updates = 0;
update students
set name_student = 'Hoang Huynh Duc' 
where id = 3;
delete from students
where id = 4;
set sql_safe_updates = 1;
select * from students;
create table teachers(
	id int primary key auto_increment not null,
    name_teacher varchar(45) not null,
    age int,
    country varchar(45)
);
insert into teachers(id, name_teacher, age, country) values (1, 'Nguyen Viet Hoang', 23, 'vietnam');
insert into teachers(name_teacher, age, country) values ('Hai dep trai', 23, 'vietnam');
select * from teachers;
create table classroom(
	id int primary key auto_increment not null,
    name_class varchar(45) not null
);
insert into classroom(name_class) values ('c1222g1');
select * from classroom, students, teachers;