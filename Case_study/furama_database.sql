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

-- Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from employee;
select * from employee where full_name like '% h%' or full_name like '% t%' or full_name like '% k%' and length(full_name) <= 15;
-- Hiển thị khách hàng nằm trong độ tuổi từ 18 đến 50 và ở Đà Nẵng hoặc Quảng Trị
select *, year(curdate()) - year(date_of_birth) as age from customer 
where year(curdate()) - year(date_of_birth) < 50 and year(curdate()) - year(date_of_birth) > 18 
and address like '% Đà Nẵng' or address like '% Quảng Trị';
select  year(curdate()) - year(date_of_birth) from customer;
-- Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select customer.id_customer, full_name, name_customer_type, count(contract.id_customer) as number_of_bookings from customer 
inner join customer_type 
on customer.id_customer_type = customer_type.id_customer_type 
inner join contract 
on customer.id_customer = contract.id_customer
where customer_type.name_customer_type = 'diamond'
group by customer.id_customer
order by count(contract.id_customer);

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
select customer.id_customer, 
customer.full_name, 
customer_type.name_customer_type, 
contract.id_contract, 
service.name_service, 
contract.date_start_contract,
contract.date_end_contract,
service.rental_costs + ifnull(sum(detailed_contract.quantity * accompanied_service.price),0) as total_price 
from customer
left join customer_type on customer.id_customer_type = customer_type.id_customer_type
left join contract on contract.id_customer = customer.id_customer
left join service on contract.id_service = service.id_service
left join detailed_contract on detailed_contract.id_contract = contract.id_contract
left join accompanied_service on accompanied_service.id_accompanied_service = detailed_contract.id_accompanied_service
group by customer.id_customer, contract.id_contract;
-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select service.id_service, service.name_service, service.area, service.rental_costs, type_of_service.name_type_of_service 
from service
inner join type_of_service on service.id_type_of_service = type_of_service.id_type_of_service
inner join contract on contract.id_service = service.id_service
where contract.id_service not in (select id_service from contract where month(date_start_contract) in (1,2,3) and year(date_start_contract) = '2021')
group by service.id_service;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021
select service.id_service, service.name_service, service.area, service.max_people, service.rental_costs, type_of_service.name_type_of_service 
from service
inner join type_of_service on service.id_type_of_service = type_of_service.id_type_of_service
inner join contract on contract.id_service = service.id_service
where contract.id_service in (select id_service from contract where year(date_start_contract) like '2020')
and contract.id_service not in (select id_service from contract where year(date_start_contract) like '2021')
group by service.id_service;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.

-- cach 1: 
select full_name from customer 
union
select full_name from customer;
 
-- cach 2:
select full_name from customer group by full_name;

-- cach 3:
select distinct full_name from customer;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(date_start_contract) as month_2021 , count(id_customer) as amount
from contract
where year(date_start_contract) = 2021
group by month(date_start_contract)
order by month(date_start_contract);

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select contract.id_contract, date_start_contract, date_end_contract, down_payment, ifnull(sum(detailed_contract.quantity),0) as amount 
from contract
left join detailed_contract on detailed_contract.id_contract = contract.id_contract
group by contract.id_contract;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select * 
from accompanied_service
inner join detailed_contract on accompanied_service.id_accompanied_service = detailed_contract.id_accompanied_service
inner join contract on contract.id_contract = detailed_contract.id_contract
inner join customer on customer.id_customer = contract.id_customer
inner join customer_type on customer_type.id_customer_type = customer.id_customer_type
where customer_type.name_customer_type like 'diamond' and customer.address like '% Vinh' or customer.address like '% Quảng Ngãi';
 
 -- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
 -- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
 select contract.id_contract, employee.full_name, customer.full_name, customer.number_phone, service.name_service, contract.down_payment, ifnull(sum(detailed_contract.quantity),0) as amount
 from contract
 left join detailed_contract on detailed_contract.id_contract = contract.id_contract
 left join employee on contract.id_employee = employee.id_employee 
 left join customer on contract.id_customer = customer.id_customer
 left join service on contract.id_service = service.id_service
 where 
 month(contract.date_start_contract) in (10,11,12) and year(contract.date_start_contract) = 2020 and 
 contract.id_contract not in (select id_contract from contract where month(date_start_contract) in (1,2,3,4,5,6) and year(date_start_contract) = '2021');
 
 -- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau)
 select accompanied_service.id_accompanied_service, accompanied_service.name_accompanied_service, accompanied_service.price,  sum(detailed_contract.quantity) as amount 
 from accompanied_service
 inner join detailed_contract on detailed_contract.id_accompanied_service = accompanied_service.id_accompanied_service
 group by accompanied_service.id_accompanied_service
 having max(amount);
 
 -- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
 -- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
 select contract.id_contract, type_of_service.name_type_of_service, accompanied_service.name_accompanied_service, count(detailed_contract.id_accompanied_service) as amount
 from contract
 inner join detailed_contract on detailed_contract.id_contract = contract.id_contract
 inner join accompanied_service on accompanied_service.id_accompanied_service = detailed_contract.id_accompanied_service
 inner join service on service.id_service = contract.id_service
 inner join type_of_service on type_of_service.id_type_of_service = service.id_type_of_service
 group by accompanied_service.id_accompanied_service
 having amount = 1;
 
 -- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
 -- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
 select employee.id_employee, employee.full_name, degree.name_degree, position.name_position, employee.number_phone, employee.address
 from employee
 inner join contract on employee.id_employee = contract.id_employee
 inner join position on employee.id_position = position.id_position
 inner join degree on degree.id_degree = employee.id_degree
 where count(contract.id_employee) <= 3
 group by employee.id_employee;
 
 # 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
 set sql_safe_updates = 0;
 delete from employee
 where employee.id_employee not in (select id_employee from contract where year(date_start_contract) between 2019 and 2021);
 set sql_safe_updates = 1; 

 # 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
 # chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
set sql_safe_updates = 0;
update customer
set id_customer_type = 1
where customer.id_customer in (
select id_customer from (
select customer.id_customer, service.rental_costs + ifnull(sum(detailed_contract.quantity * accompanied_service.price),0) as total_price
from customer
left join customer_type on customer.id_customer_type = customer_type.id_customer_type
left join contract on contract.id_customer = customer.id_customer
left join service on contract.id_service = service.id_service
left join detailed_contract on detailed_contract.id_contract = contract.id_contract
left join accompanied_service on accompanied_service.id_accompanied_service = detailed_contract.id_accompanied_service
group by customer.id_customer, contract.id_contract
having total_price > 10000000)as lists);
set sql_safe_updates = 1;
select * from customer;
 # 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
 set sql_safe_updates = 0;
 delete from detailed_contract
 where id_contract in (select id_contract from contract
 where year(date_start_contract) < 2021);
#  delete from contract
#  where id_contract not in (select id_contract from detailed_contract);
 delete from customer
 where id_customer not in (select id_customer from contract where year(date_start_contract) < 2021);
  set sql_safe_updates = 1;
  
  select * from customer;
 # 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
 set sql_safe_updates = 0;
 update accompanied_service
 set accompanied_service.price = price * 2
 where id_accompanied_service in (
 select id_accompanied_service from (
 select accompanied_service.id_accompanied_service 
 from accompanied_service
 inner join detailed_contract on detailed_contract.id_accompanied_service = accompanied_service.id_accompanied_service
 inner join contract on contract.id_contract = detailed_contract.id_contract
 where year(date_start_contract) = 2020 and quantity > 10) as id);
 set sql_safe_updates = 1;

 #  20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
 select id_employee as id, full_name, email, number_phone, date_of_birth, address
 from employee
 union all
 select id_customer as id, full_name, email, number_phone, date_of_birth, address
 from customer;