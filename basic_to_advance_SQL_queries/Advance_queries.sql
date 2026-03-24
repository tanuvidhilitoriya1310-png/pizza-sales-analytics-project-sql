/*
=================================================================================
ADVANCE LEVEL QUERIES
=================================================================================
*/

-- Q1. Calculate the percentage contribution of each pizza type to total revenue.
SELECT 
    pizza_types.category AS pizza_type,
    CONCAT(ROUND((SUM(order_details.quantity * pizzas.price) / (SELECT 
                            SUM(order_details.quantity * pizzas.price)
                        FROM
                            order_details
                                INNER JOIN
                            pizzas ON order_details.pizza_id = pizzas.pizza_id) * 100),
                    2),
            '%') AS total_revenue
FROM
    pizza_types
        INNER JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        INNER JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_type
ORDER BY total_revenue DESC; 

-- Q2. Analyze the cumulative revenue generated over time.
select dates,revenue,sum(revenue) over(order by dates) as cum_revenue
from
(SELECT 
    orders.order_date AS dates,
    ROUND(SUM(order_details.quantity * pizzas.price),
            0) AS revenue
FROM
    orders
        INNER JOIN
    order_details  ON orders.order_id = order_details.order_id
        INNER JOIN
    pizzas ON  pizzas.pizza_id = order_details.pizza_id 
GROUP BY dates ) as pizza_sales
;

-- Q3. Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select pizza_category,pizza,revenue,3_top_most_ordered_pizza from
(select pizza_category,pizza,revenue,rank() over(partition by pizza_category order by revenue desc) as 3_top_most_ordered_pizza
from
(SELECT 
    pizza_types.category AS pizza_category,pizza_types.name as pizza,
    ROUND(SUM(order_details.quantity * pizzas.price),
            0) AS revenue
FROM
    pizza_types
        INNER JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        INNER JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_category,pizza
ORDER BY revenue DESC) as pizzas_orders) as b
where 3_top_most_ordered_pizza <= 3;