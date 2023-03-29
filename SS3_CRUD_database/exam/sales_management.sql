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
insert into order_detail(order_id, product_id, order_quantity) values (1, 1, 3), (1, 3, 7), (1, 4, 2), (2, 1, 1), (3, 1, 8), (2, 5, 4), (2, 7, 3);
select * from order_detail;
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select order_id, order_date, total_price
from order_product;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer.customer_name, product.product_name
from customer
inner join order_product on customer.customer_id = order_product.customer_id
inner join order_detail on order_detail.order_id = order_product.order_id
inner join product on order_detail.product_id = product.product_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customer.customer_name
from customer
left join order_product on customer.customer_id = order_product.customer_id
where order_product.order_id is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice)
select order_product.order_id, order_product.order_date, sum(order_detail.order_quantity*product.product_price) as total_price from order_product
inner join customer on customer.customer_id = order_product.customer_id
inner join order_detail on order_detail.order_id = order_product.order_id
inner join product on order_detail.product_id = product.product_id
group by order_product.order_id;
