create database sales_management;
create table customer (
	customer_id int primary key auto_increment,
    customer_name varchar(45),
    customer_age int
);
create table order_product (
	order_id int primary key auto_increment,
    customer_id int,
    order_date date,
    total_price int,
    foreign key (customer_id) references customer(customer_id)
);
create table product (
	product_id int primary key auto_increment,
    product_name varchar(45),
    product_price int
);

create table order_detail (
	order_id int,
    product_id int,
    order_quantity int,
    primary key (order_id, product_id),
    foreign key (order_id) references order_product(order_id),
    foreign key (product_id) references product(product_id)
);
insert into customer(customer_name, customer_age) values ('Minh Quân', 10), ('Ngoc Oanh', 20), ('Hong Ha', 50);
select * from customer;
insert into order_product(customer_id, order_date, total_price) values ( 1, '2006-03-21', null),  ( 2, '2006-03-23', null),  ( 1, '2006-03-16', null);
select * from order_product;
insert into product(product_name, product_price) values ( 'may giat', 3), ( 'tu lanh', 5), ( 'dieu hoa', 7), ( 'quat', 1), ( 'bep dien', 2);
select * from product;
insert into order_detail(order_id, product_id, order_quantity) values (1, 1, 3), (1, 3, 7), (1, 4, 2), (2, 1, 1), (3, 1, 8), (2, 5, 4), (2, 3, 3);
select * from order_detail;

select order_id, order_date, total_price
from order_product;
select customer.customer_name, product.product_name
from order_detail inner join product on ;