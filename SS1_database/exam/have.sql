create database demo_ss6;
use demo_ss6;
create table products (
	id int primary key auto_increment,
    product_code int,
    product_name varchar(50),
    product_price double,
    product_amount int,
    product_description varchar(100),
    product_status bit
);
insert into products(product_code, product_name, product_price, product_amount, product_description, product_status) values (1, 'pen', 1000, 2, 'black', 1),
(2, 'pen', 1000, 3, 'blue', 0),
(3, 'pencil', 1000, 4, 'wood', 1),
(2, 'notebook', 10000, 8, '80 paper', 1),
(5, 'ruler', 5000, 1, '20cm', 0);
-- indexes 
explain select product_code, product_name, product_price from products where product_code = 2;
create unique index u_index_products
on products (product_code);
explain select product_code, product_name, product_price from products where product_code = 2;
explain select product_code, product_name, product_price from products where product_name = 'pen' or product_price = '1000';
create index index_products 
on products (product_name, product_price);
explain select product_code, product_name, product_price from products where product_name = 'pen' or product_price = '1000';
-- view
create view view_product (product_code, product_name, product_price, product_status) as
select product_code, product_name, product_price, product_status
from products;
create or replace view view_product as
select product_code, product_name, product_price, product_amount, product_description, product_status
from products
where product_name = 'pen';
select * from view_product;
drop view view_product;
 -- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
 delimiter //
	create procedure get_product()
    begin
    select * from products;
    end
 // delimiter ;
 call get_product();
 -- Tạo store procedure thêm một sản phẩm mới
 delimiter //
	create procedure add_product()
    begin
    insert into products(product_code, 
    product_name, 
    product_price, 
    product_amount, 
    product_description, 
    product_status)
    value (7, 'book', 15000, 1, 'math', 1);
    end
 // delimiter ;
 call add_product();
 -- Tạo store procedure sửa thông tin sản phẩm theo id
 delimiter //
	create procedure edit_product()
    begin
    set sql_safe_updates = 0;
    update products
    set product_description = '120 paper'
    where id = 4;
    set sql_safe_updates = 1;
    end
 // delimiter ;
 call edit_product();
-- Tạo store procedure xoá sản phẩm theo id
 delimiter //
	create procedure delete_product()
    begin
    set sql_safe_updates = 0;
    delete from products
    where id = 4;
    set sql_safe_updates = 1;
    end
 // delimiter ;
 call delete_product();