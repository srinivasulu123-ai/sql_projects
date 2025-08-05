-- CREATE ONLINE_FOOD_DEL DATABASE

CREATE DATABASE ONLINE_FOOD_DEL;

USE ONLINE_FOOD_DEL;
-- CREATE TABLES(cust--resmenue--order--order_det)
create table customers
(customer_id int primary key,
customer_name varchar(60),
email varchar(60),
city varchar(60),
signup_date date
);
create table restaurant
(restaurant_id int primary key,
rest_name varchar(60),
city varchar(60),
reg_date date);
-- create menue_item table
create table menue_item
(item_id int primary key,
restaurant_id int,
itme_name varchar(60),
price decimal(10,2),
constraint fk_menue_rest
foreign key(restaurant_id)
references restaurant(restaurant_id)
);
create table orders
(order_id int primary key,
customer_id int,
restaurant_id  int,
order_date date,
constraint fk_order_cust
foreign key(customer_id)
references customers(customer_id),
foreign key(restaurant_id)
references restaurant(restaurant_id)
);
create table order_details
(order_detail_id int primary key,
order_id int,
item_id int,
quantity int,
foreign key(order_id)
references orders(order_id),
foreign key(item_id)
references menue_item(item_id)
);
 