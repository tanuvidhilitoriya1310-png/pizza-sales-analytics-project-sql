/*
==================================================
BASIC LEVEL QUERIES
==================================================
*/

-- Q1. Retrieve the total number of orders placed.
select count(*) as total_no_of_orders
from orders;

-- Q2. Calculate the total revenue generated from pizza sales.
SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2) AS total_revenue
FROM
    pizzas
        INNER JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id;
    
-- Q3. Identify the highest-priced pizza.
SELECT 
    pizza_types.name AS pizza, pizzas.price AS highest_price
FROM
    pizzas
        INNER JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
ORDER BY highest_price DESC
LIMIT 1;

-- Q4. Identify the most common pizza size ordered.
SELECT 
    pizzas.size AS size,
    COUNT(order_details.order_id_details) AS order_count
FROM
    pizzas
        INNER JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY size
ORDER BY order_count DESC
LIMIT 1;

-- Q5. List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pizza_types.name,
    SUM(order_details.quantity) AS most_ordered_quantity
FROM
    pizza_types
        INNER JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        INNER JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY most_ordered_quantity DESC
LIMIT 5;