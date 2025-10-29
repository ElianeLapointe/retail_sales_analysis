-- SQLite
ATTACH DATABASE '/Users/elianelapointe/sql/projects/retail_sales/p1_retail_db.db' AS source_db;

SELECT rowid, *
FROM retail_sales
LIMIT 5;

-- Understand the code by determining the quantity of rows and customers
SELECT COUNT(*) AS total_rows, 
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales;

-- Determine unique categories
SELECT DISTINCT category AS unique_categories
FROM retail_sales;

-- Delete rows that have NULL values 
DELETE FROM retail_sales
WHERE (
    transactions_id IS NULL OR
    sale_date IS NULL OR
    sale_time IS NULL OR
    customer_id IS NULL OR
    gender IS NULL OR
    age IS NULL OR
    category IS NULL OR
    quantity IS NULL OR
    price_per_unit IS NULL OR
    cogs IS NULL OR
    total_sale IS NULL
);

-- Write a SQL query to retrieve all columns for sales made on '2022-11-05, which customer made the largest purchase on that day
SELECT customer_id, total_sale
FROM retail_sales
WHERE sale_date = '2022-11-05'
ORDER BY total_sale DESC
LIMIT 1;

-- Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
    AND quantity > 4
    AND strftime('%Y-%m', sale_date) = '2022-11';

-- Write a SQL query to calculate the total sales (total_sale) for each category.:
SELECT category, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category;

-- Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
SELECT ROUND(AVG(age), 2) AS average_age
FROM retail_sales
WHERE category = 'Beauty';

-- Write a SQL query to find all transactions where the total_sale is greater than 1000.:
SELECT *
FROM retail_sales
WHERE total_sale > 1000;

-- Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
SELECT gender, category, COUNT(transactions_id) AS transaction_count
FROM retail_sales
GROUP BY gender, category;


-- Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
SELECT 
    strftime('%Y', sale_date) AS year,
    strftime('%m', sale_date) AS month,
    AVG(total_sale) AS average_sale
FROM retail_sales
GROUP BY year, month
ORDER BY average_sale DESC
LIMIT 1;

-- Write a SQL query to find the top 5 customers based on the highest total sales:
SELECT customer_id, SUM(total_sale) AS total_spent
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;

--Write a SQL query to find the number of unique customers who purchased items from each category.:
WITH hourly_sales AS (
    SELECT *, 
        CASE
            WHEN sale_time < '12:00:00' THEN 'Morning'
            WHEN sale_time >= '12:00:00' AND sale_time < '17:00:00' THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM retail_sales
) SELECT 
    shift,
    COUNT(*) AS total_sales
FROM hourly_sales
GROUP BY shift;

