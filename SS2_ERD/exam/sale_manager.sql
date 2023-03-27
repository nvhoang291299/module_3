create database sales_manager;
create table customer (
	customer_id int primary key auto_increment,
    customer_name varchar(45),
    customer_age int
);
insert into customer(customer_name, customer_age) values ('hoang', 23);
select * from customer;
create table order_product (
	order_id int primary key auto_increment,
    customer_id int,
    order_date date,
    total_price int,
    foreign key (customer_id) references customer(customer_id)
);
insert into order_product(customer_id, order_date, total_price) values ( 1, curdate(), 15000);
select * from order_product;
create table product (
	product_id int primary key auto_increment,
    product_name varchar(45),
    product_price int
);
insert into product(product_name, product_price) values ( 'pencil', 15000);
select * from product;
create table order_detail (
	order_id int,
    product_id int,
    order_quantity int,
    primary key (order_id, product_id),
    foreign key (order_id) references order_product(order_id),
    foreign key (product_id) references product(product_id)
);
insert into order_detail(order_id, product_id, order_quantity) values (3,1,2);
select * from order_detail;