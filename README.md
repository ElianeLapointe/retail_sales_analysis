# Retail Sales SQL Analysis

## Project Overview

**Purpose:** Analyze retail sales data to identify trends and optimize business insights.

**Skills Learned:** SQL querying and aggregation, Database manipulation using Python, Data import/export using SQLite and CSV, Report generation with Python scripts

**Difficulty Level:** Intermediate


## SQL Queries and Outputs

### Query 1 Explanation

> SQLite

### Query 1:
```sql
SELECT rowid, *
FROM source_db.retail_sales
LIMIT 5;
```

⚠️ **Error executing query:** no such table: source_db.retail_sales

### Query 2 Explanation

> Understand the code by determining the quantity of rows and customers

### Query 2:
```sql
SELECT COUNT(*) AS total_rows, 
    COUNT(DISTINCT customer_id) AS unique_customers
FROM source_db.retail_sales;
```

⚠️ **Error executing query:** no such table: source_db.retail_sales

### Query 3 Explanation

> Determine unique categories

### Query 3:
```sql
SELECT DISTINCT category AS unique_categories
FROM source_db.retail_sales;
```

⚠️ **Error executing query:** no such table: source_db.retail_sales

### Query 4 Explanation

> Delete rows that have NULL values

### Query 4:
```sql
DELETE FROM source_db.retail_sales
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
```

⚠️ **Error executing query:** no such table: source_db.retail_sales

### Query 5 Explanation

> Write a SQL query to retrieve all columns for sales made on '2022-11-05, which customer made the largest purchase on that day

### Query 5:
```sql
SELECT customer_id, total_sale
FROM source_db.retail_sales
WHERE sale_date = '2022-11-05'
ORDER BY total_sale DESC
LIMIT 1;
```

⚠️ **Error executing query:** no such table: source_db.retail_sales

### Query 6 Explanation

> Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:

### Query 6:
```sql
SELECT *
FROM source_db.retail_sales
WHERE category = 'Clothing'
    AND quantity > 4
    AND strftime('%Y-%m', sale_date) = '2022-11';
```

⚠️ **Error executing query:** no such table: source_db.retail_sales

### Query 7 Explanation

> Write a SQL query to calculate the total sales (total_sale) for each category.:

### Query 7:
```sql
SELECT category, SUM(total_sale) AS total_sales
FROM source_db.retail_sales
GROUP BY category;
```

⚠️ **Error executing query:** no such table: source_db.retail_sales

### Query 8 Explanation

> Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:

### Query 8:
```sql
SELECT ROUND(AVG(age), 2) AS average_age
FROM source_db.retail_sales
WHERE category = 'Beauty';
```

⚠️ **Error executing query:** no such table: source_db.retail_sales

### Query 9 Explanation

> Write a SQL query to find all transactions where the total_sale is greater than 1000.:

### Query 9:
```sql
SELECT *
FROM source_db.retail_sales
WHERE total_sale > 1000;
```

⚠️ **Error executing query:** no such table: source_db.retail_sales

### Query 10 Explanation

> Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:

### Query 10:
```sql
SELECT gender, category, COUNT(transactions_id) AS transaction_count
FROM source_db.retail_sales
GROUP BY gender, category;
```

⚠️ **Error executing query:** no such table: source_db.retail_sales

### Query 11 Explanation

> Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

### Query 11:
```sql
SELECT 
    strftime('%Y', sale_date) AS year,
    strftime('%m', sale_date) AS month,
    AVG(total_sale) AS average_sale
FROM source_db.retail_sales
GROUP BY year, month
ORDER BY average_sale DESC
LIMIT 1;
```

⚠️ **Error executing query:** no such table: source_db.retail_sales

### Query 12 Explanation

> Write a SQL query to find the top 5 customers based on the highest total sales:

### Query 12:
```sql
SELECT customer_id, SUM(total_sale) AS total_spent
FROM source_db.retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;
```

⚠️ **Error executing query:** no such table: source_db.retail_sales

### Query 13 Explanation

> Write a SQL query to find the number of unique customers who purchased items from each category.:

### Query 13:
```sql
WITH hourly_sales AS (
    SELECT *, 
        CASE
            WHEN sale_time < '12:00:00' THEN 'Morning'
            WHEN sale_time >= '12:00:00' AND sale_time < '17:00:00' THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM source_db.retail_sales
) SELECT 
    shift,
    COUNT(*) AS total_sales
FROM hourly_sales
GROUP BY shift;
```

⚠️ **Error executing query:** no such table: source_db.retail_sales


## Reflection and Interpretation

Below, summarize your learnings and explain each query result:


### Reflection for Query 1

_Describe what you discovered, why it makes sense or doesn’t, and what insights you gained._


### Reflection for Query 2

_Describe what you discovered, why it makes sense or doesn’t, and what insights you gained._


### Reflection for Query 3

_Describe what you discovered, why it makes sense or doesn’t, and what insights you gained._


### Reflection for Query 4

_Describe what you discovered, why it makes sense or doesn’t, and what insights you gained._


### Reflection for Query 5

_Describe what you discovered, why it makes sense or doesn’t, and what insights you gained._


### Reflection for Query 6

_Describe what you discovered, why it makes sense or doesn’t, and what insights you gained._


### Reflection for Query 7

_Describe what you discovered, why it makes sense or doesn’t, and what insights you gained._


### Reflection for Query 8

_Describe what you discovered, why it makes sense or doesn’t, and what insights you gained._


### Reflection for Query 9

_Describe what you discovered, why it makes sense or doesn’t, and what insights you gained._


### Reflection for Query 10

_Describe what you discovered, why it makes sense or doesn’t, and what insights you gained._


### Reflection for Query 11

_Describe what you discovered, why it makes sense or doesn’t, and what insights you gained._


### Reflection for Query 12

_Describe what you discovered, why it makes sense or doesn’t, and what insights you gained._


### Reflection for Query 13

_Describe what you discovered, why it makes sense or doesn’t, and what insights you gained._

