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


