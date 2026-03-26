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
📁 Output: `Outputs/Total_revenue_generated.csv`
📈 Key Insights
Large-sized pizzas are the most preferred among customers
A few pizza types contribute significantly to overall revenue
Peak order times occur during evening hours
Certain categories consistently outperform others in sales
🚀 Conclusion
This project demonstrates how SQL can be effectively used to analyze structured data and extract valuable business insights. The findings can help improve sales strategies, inventory management, and customer satisfaction.
📌 Future Improvements
Integrate with Power BI for interactive dashboards
Perform predictive analysis using Python
Automate reporting using scripts
🙌 Author
Vidhi Pathak
Aspiring Data Analyst skilled in SQL, Excel, and Power BI
⭐ If you like this project
Give it a ⭐ on GitHub and feel free to connect!