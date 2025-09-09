use online_food_del;

-- 1.count how many orders each customer has placed

select c.customer_name ,count(o.order_id)from
customers c join orders o 
on c.customer_id=o.customer_id
group by c.customer_name;


-- 2.show total revenue earned from each city
select sum(m.price*od.quantity)as total_revenue,r.city
from restaurant r
join menue_item m on r.restaurant_id=m.restaurant_id
join order_detail od on od.item_id=m.item_id
join orders o on o.order_id=od.order_id
group by r.city;


-- 3.find the total number of times each food item was ordered
SELECT
    mi.itme_name,sum(od.quantity) AS total_orders
FROM
    order_detail AS od
JOIN
    menue_item AS mi
    ON od.item_id = mi.item_id
GROUP BY
    mi.itme_name
ORDER BY
    total_orders DESC;
  
  -- 4.calculate the average order value for each customer city
  
  
SELECT
    c.city,
    AVG(order_totals.total_amount) AS average_order_value
FROM
    customers AS c
JOIN
    orders AS o
    ON c.customer_id = o.customer_id
JOIN
    (SELECT
        od.order_id,
        SUM(od.quantity * mi.price) AS total_amount
    FROM
        order_detail AS od
    JOIN
        menue_item AS mi
        ON od.item_id = mi.item_id
    GROUP BY
        od.order_id) AS order_totals
    ON o.order_id = order_totals.order_id
GROUP BY
    c.city
ORDER BY
    c.city;


-- 5.find how many different food items were orderd per restuarant

select  r.rest_name,count(Distinct od.item_id) as number_of_different_items_ordered
from restaurant r
JOIN orders o ON r.restaurant_id = o.restaurant_id
JOIN order_detail od ON o.order_id = od.order_id
GROUP BY r.rest_name
ORDER BY number_of_different_items_ordered DESC;




  