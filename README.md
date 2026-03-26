# 🍕 Pizza Sales Analysis using SQL
## 📌 Project Overview
- This project presents an end-to-end SQL analysis of a pizza sales dataset using MySQL. It focuses on extracting meaningful business insights through basic, intermediate, and advanced SQL queries.

- The goal is to analyze:

- Sales performance
- Customer preferences
- Product demand
- Revenue contribution
## 🎯 Objectives
- Analyze overall business performance
- Identify top-performing pizzas
- Understand customer ordering patterns
- Evaluate sales distribution by size and category
- Generate actionable business insights
## 🛠️ Tools & Technologies
- SQL (MySQL)
- MySQL Workbench
- Excel (for initial data understanding)
## 📂 Dataset Description
- The dataset contains information about:
- Orders
- Order details
- Pizza types
- Pizza sizes and prices
## 📂 Project Structure
<pre> pizza-sales-sql-basic-to-advanced/
│
├── datasets/
│   └── pizza_sales.csv
│
├── sql_queries/
│   ├── basic_queries.sql
│   ├── intermediate_queries.sql
│   └── advanced_queries.sql
│
├── outputs/
│   ├── total_orders.csv
│   ├── total_revenue.csv
│   ├── top_5_pizzas.csv
│   ├── most_common_size.csv
│   ├── category_quantity.csv
│   ├── top_3_revenue_pizzas.csv
│   └── revenue_contribution.csv
│
└── README.md </pre>
## 🔍 Key Analysis Performed
### 🔹 1. What is the total revenue generated?
```sql 
SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2) AS total_revenue
FROM
    pizzas
        INNER JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id;
```
📁 Output:( https://github.com/tanuvidhilitoriya1310-png/pizza-sales-analytics-project-sql/blob/master/Outputs/Total_revenue_generated.csv )
### 🔹 2. How many total orders were placed?
```sql
select count(*) as total_no_of_orders
from orders;
```
📁 Output:(https://github.com/tanuvidhilitoriya1310-png/pizza-sales-analytics-project-sql/blob/master/Outputs/Total_number_of_orders.csv)
### 🔹 3. Which are the top 5 most ordered pizza types?
```sql
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
```
📁 Output:(https://github.com/tanuvidhilitoriya1310-png/pizza-sales-analytics-project-sql/blob/master/Outputs/Top_5_most_ordered_pizza_type.csv)
### 🔹 4. What is the most commonly ordered pizza size?
```sql
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
```
📁 Output:(https://github.com/tanuvidhilitoriya1310-png/pizza-sales-analytics-project-sql/blob/master/Outputs/Most_Common_Pizza_size_ordered.csv)
### 🔹 5. What is the total quantity ordered for each pizza category?
```sql
SELECT 
    pizza_types.category,
    SUM(order_details.quantity) AS total_quantity
FROM
    pizza_types
        INNER JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        INNER JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY total_quantity DESC;
```
📁 Output:(https://github.com/tanuvidhilitoriya1310-png/pizza-sales-analytics-project-sql/blob/master/Outputs/Total_quantity_of_each_pizza_category_ordered.csv)
### 🔹 6. Which are the top 3 pizza types based on revenue?
```sql
SELECT 
    pizza_types.name AS pizza,
    ROUND(SUM(order_details.quantity * pizzas.price),
            0) AS revenue
FROM
    pizza_types
        INNER JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        INNER JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza
ORDER BY revenue DESC
LIMIT 3;
```
📁 Output:(https://github.com/tanuvidhilitoriya1310-png/pizza-sales-analytics-project-sql/blob/master/Outputs/Top_3_pizza_types_based_on_revenue.csv)
### 🔹 7. What percentage of total revenue does each pizza type contribute?
```sql
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
```
📁 Output:(https://github.com/tanuvidhilitoriya1310-png/pizza-sales-analytics-project-sql/blob/master/Outputs/Percentage_contribution_of_each_pizza_type_to_total_revenue.csv)
## 📈 Key Insights
- Large-sized pizzas are the most preferred among customers
- Pizza sales are evenly distributed across categories
- Peak order times occur during afternoon hours
- Certain categories consistently outperform others in sales
## 📌 SQL Concepts Used
- Basic: SELECT, COUNT, SUM, ORDER BY
- Intermediate: GROUP BY, JOIN, LIMIT
- Advanced: Subqueries, Aggregations, CTEs,Window functions
## 🚀 How to Use This Project
- Import the dataset into MySQL
- Execute queries for analysis
- Export results into CSV files
- Analyze outputs for insights
## 🚀 Conclusion
- This project demonstrates how SQL can be effectively used to analyze structured data and extract valuable business insights. The findings can help improve sales strategies, inventory management, and customer satisfaction.
## 📌 Future Improvements
- Integrate with Power BI for interactive dashboards
- Perform predictive analysis using Python
- Automate reporting using scripts
## 🙌 Author
Vidhi Pathak
Aspiring Data Analyst skilled in SQL, Excel, and Power BI
## ⭐ If you like this project
Give it a ⭐ on GitHub and feel free to connect!