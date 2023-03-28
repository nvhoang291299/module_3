create database furama_database;
create table position (
	id_position int primary key auto_increment,
    name_position varchar(45)
);
create table degree (
	id_degree int primary key auto_increment,
    name_degree varchar(45)
);
create table department (
	id_department int primary key auto_increment,
    name_department varchar(45)
);
create table employee (
	id_employee int primary key auto_increment,
    full_name varchar(45),
    date_of_birth date,
    id_card varchar(45),
    salary double,
    number_phone varchar(45),
    email varchar(45),
    address varchar(45),
    id_position int,
    id_degree int,
    id_department int,
    foreign key (id_position) references position (id_position),
    foreign key (id_degree) references degree (id_degree),
    foreign key (id_department) references department (id_department)
);

select * from employee where (full_name like 'h%' or full_name like 't%' or full_name like 'k%') and char_length(full_name) <= 15;

create table customer_type (
	id_customer_type int primary key auto_increment,
    name_customer_type varchar(45)
);

create table customer (
	id_customer int primary key auto_increment,
    id_customer_type int,
    full_name varchar(45),
    date_of_birth date,
    gender bit(1),
    id_card varchar(45),
    number_phone varchar(45),
    email varchar(45),
    address varchar(45)
);
alter table customer add foreign key (id_customer_type) references customer_type(id_customer_type);

create table type_of_service (
	id_type_of_service int primary key auto_increment,
    name_type_of_service varchar(45)
);
create table rental_type (
	id_rental_type int primary key auto_increment,
    name_rental_type varchar(45)
);
create table service (
	id_service int primary key auto_increment,
    name_service varchar(45),
    area int,
    rental_costs double,
    max_people int,
    id_rental_type int,
    id_type_of_service int,
    room_standard varchar(45),
    desc_of_other_amenities varchar(45),
    area_swimming_pool double,
    floors int,
    foreign key (id_rental_type) references rental_type (id_rental_type),
    foreign key (id_type_of_service) references type_of_service (id_type_of_service)
);
create table accompanied_service (
	id_accompanied_service int primary key auto_increment,
    name_accompanied_service varchar(45),
    price double,
    unit varchar(10),
    state varchar(45)
);
create table detailed_contract (
	id_detailed_contract int primary key auto_increment,
    id_contract int,
    id_accompanied_service int,
    quantity int,
    foreign key (id_contract) references contract (id_contract),
    foreign key (id_accompanied_service) references accompanied_service (id_accompanied_service)
);
create table contract (
	id_contract int primary key auto_increment,
    date_start_contract datetime,
    date_end_contract datetime,
    down_payment double,
    id_employee int,
    id_customer int,
    id_service int,
    foreign key (id_employee) references employee (id_employee),
    foreign key (id_customer) references customer (id_customer),
    foreign key (id_service) references service (id_service)
);
insert into customer_type(name_customer_type) values ('diamond'), ('platium'), ('gold'), ('silver'), ('members');
select * from customer_type;
insert into department (name_department) values ('sale-marketing'), ('hành chính'), ('phục vụ'), ('quản lý');
select * from department;
insert into position (id_position, name_position) values (1, 'quản lý'), (2, 'nhân viên');
select * from position;
insert into degree (name_degree) values ('trung cấp'), ('cao đẳng'), ('đại học'), ('sau đại học');
select * from degree;
insert into rental_type(name_rental_type) values ('year'), ('month'), ('day'), ('hour');
select * from rental_type;
insert into type_of_service(name_type_of_service) values ('villa'), ('house'), ('room');
select * from accompanied_service;
select * from service;
insert into customer (id_customer, id_customer_type, full_name, date_of_birth, gender, id_card, number_phone, email, address)
values (1, 5, 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213',	'0945423362', 'thihao07@gmail.com',	'23 Nguyễn Hoàng, Đà Nẵng'),
	   (2, 3, 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị'),
	   (3, 1, 'Trương Đình Nghệ', '1990-02-27', 1,	'488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh'),
	   (4, 1, 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com',	'K453/12 Lê Lợi, Đà Nẵng'),
       (5, 4, 'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com',	'224 Lý Thái Tổ, Gia Lai'),
       (6, 4, 'Tôn Nữ Mộc Châu', '2005-12-06',	0, '732434215',	'0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng'),
       (7, 1, 'Nguyễn Mỹ Kim',	'1984-04-08', 0, '856453123', '0912345698',	'kimcuong84@gmail.com',	'K123/45 Lê Lợi, Hồ Chí Minh'),
       (8, 3, 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com',	'55 Nguyễn Văn Linh, Kon Tum'),
       (9, 1, 'Trần Đại Danh',	'1994-07-01', 1, '432341235', '0643343433',	'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi'),
       (10, 2, 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng');
select * from customer;
insert into contract (id_contract, date_start_contract, date_end_contract, down_payment, id_employee, id_customer, id_service)
values 	(1,'2020-12-08', '2020-12-08', 0, 3, 1,3),
		(2,'2020-07-14', '2020-07-21', 200000, 7, 3, 1),
		(3,'2021-03-15', '2021-03-17', 50000, 3, 4, 2),
		(4,'2021-01-14', '2021-01-18', 100000, 7, 5, 5),
		(5,'2021-07-14', '2021-07-15', 0, 7, 2, 6),
		(6,'2021-06-01', '2021-06-03', 0, 7, 7, 6),
		(7,'2021-09-02', '2021-09-05', 100000, 7, 4, 4),
		(8,'2021-06-17', '2021-06-18', 150000, 3, 4, 1),
		(9,'2020-11-19', '2020-11-19', 0, 3, 4, 3),
		(10,'2021-04-12', '2021-04-14', 0, 10, 3, 5),
		(11,'2021-04-25', '2021-04-25', 0, 2, 2,	1),
		(12,'2021-05-25', '2021-05-27', 0, 7, 10, 1);
select * from contract;

insert into detailed_contract(id_detailed_contract, id_contract, id_accompanied_service , quantity)
values 	(1,2,4,5),
		(2,2,5,8),
        (3,2,6,15),
        (4,3,1,1),
        (5,3,2,11),
        (6,1,3,1),
        (7,1,2,2),
        (8,12,2,2);
select * from detailed_contract;