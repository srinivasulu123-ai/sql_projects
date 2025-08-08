-- understand our food ordering system - queries
use online_food_del;


-- 1. Find name & price of all food items costing more than 300/-
select itme_name, price 
from menue_item
where price>300;

-- 2 List top 5 cheapest foodi items
select itme_name,price
from menue_item 
order by price asc
limit 5;
select * from restaurant;

-- 3 List all restaurants located in Delhi
select rest_name,city 
from restaurant
where city='Delhi';

-- 4 Show top 3 most expensive menu items
select itme_name,price
from menue_item
order by price desc
limit 3;

-- 5 List order IDs where quantity > 2
select order_id 
from order_details 
where quantity>2;
