use online_food_del;

alter table order_details
rename to order_detail;

-- 1. show all orders along with the restaurant name which they were placed
select o.order_id,r.rest_name
from orders o
join restaurant r
on o.restaurant_id=r.restaurant_id;

-- 2.show customer names and order dates for orders placed in january 2023

select c.customer_name,o.order_id
from customers c
join orders o
on c.customer_id=o.customer_id
where o.order_date between '2023-01-01' AND '2023-01-31';

-- 3.List all customers along with their city who placed an order on or after '2023-01-01'

select c.customer_name,
c.city,
c.customer_id
from customers c
join orders o
on c.customer_id=o.customer_id
where o.order_date>='2023-01-01';

-- 4. Show restaurant names and order IDs for orders placed from restaurants in Mumbai

select r.rest_name,
o.order_id
from restaurant r
join orders o
on r.restaurant_id=o.restaurant_id
where r.city='Mumbai';

-- 5.Customers who have ordered from a specific restaurant - (any name of your choice)

SELECT DISTINCT
    c.customer_id,
    c.customer_name
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
JOIN
    restaurant r ON o.restaurant_id = r.restaurant_id
WHERE
    r.rest_name = 'Big Diner';
