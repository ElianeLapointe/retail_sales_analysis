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

**Sample Output:**

(1, 180, '2022-11-05', '10:47:00', 117, 'Male', 41, 'Clothing', 3, 300.0, 129.0, 900.0)
(2, 522, '2022-07-09', '11:00:00', 52, 'Male', 46, 'Beauty', 3, 500.0, 145.0, 1500.0)
(3, 559, '2022-12-12', '10:48:00', 5, 'Female', 40, 'Clothing', 4, 300.0, 84.0, 1200.0)
(4, 1180, '2022-01-06', '08:53:00', 85, 'Male', 41, 'Clothing', 3, 300.0, 129.0, 900.0)
(5, 1522, '2022-11-14', '08:35:00', 48, 'Male', 46, 'Beauty', 3, 500.0, 235.0, 1500.0)


### Query 2 Explanation

> Understand the code by determining the quantity of rows and customers

### Query 2:
```sql
SELECT COUNT(*) AS total_rows, 
    COUNT(DISTINCT customer_id) AS unique_customers
FROM source_db.retail_sales;
```

**Sample Output:**

(2000, 155)


### Query 3 Explanation

> Determine unique categories

### Query 3:
```sql
SELECT DISTINCT category AS unique_categories
FROM source_db.retail_sales;
```

**Sample Output:**

('Clothing',)
('Beauty',)
('Electronics',)


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

_No output returned._

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

**Sample Output:**

(140, 1200.0)


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

_No output returned._

### Query 7 Explanation

> Write a SQL query to calculate the total sales (total_sale) for each category.:

### Query 7:
```sql
SELECT category, SUM(total_sale) AS total_sales
FROM source_db.retail_sales
GROUP BY category;
```

**Sample Output:**

('Beauty', 286840.0)
('Clothing', 311070.0)
('Electronics', 313810.0)


### Query 8 Explanation

> Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:

### Query 8:
```sql
SELECT ROUND(AVG(age), 2) AS average_age
FROM source_db.retail_sales
WHERE category = 'Beauty';
```

**Sample Output:**

(40.34,)


### Query 9 Explanation

> Write a SQL query to find all transactions where the total_sale is greater than 1000.:

### Query 9:
```sql
SELECT *
FROM source_db.retail_sales
WHERE total_sale > 1000;
```

**Sample Output:**

(522, '2022-07-09', '11:00:00', 52, 'Male', 46, 'Beauty', 3, 500.0, 145.0, 1500.0)
(559, '2022-12-12', '10:48:00', 5, 'Female', 40, 'Clothing', 4, 300.0, 84.0, 1200.0)
(1522, '2022-11-14', '08:35:00', 48, 'Male', 46, 'Beauty', 3, 500.0, 235.0, 1500.0)
(1559, '2022-08-20', '07:40:00', 49, 'Female', 40, 'Clothing', 4, 300.0, 144.0, 1200.0)
(421, '2022-04-08', '08:43:00', 66, 'Female', 37, 'Clothing', 3, 500.0, 235.0, 1500.0)


### Query 10 Explanation

> Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:

### Query 10:
```sql
SELECT gender, category, COUNT(transactions_id) AS transaction_count
FROM source_db.retail_sales
GROUP BY gender, category;
```

**Sample Output:**

('Female', 'Beauty', 332)
('Female', 'Clothing', 348)
('Female', 'Electronics', 340)
('Male', 'Beauty', 282)
('Male', 'Clothing', 354)


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

**Sample Output:**

('2023', '02', 535.531914893617)


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

**Sample Output:**

(3, 38440.0)
(1, 30750.0)
(5, 30405.0)
(2, 25295.0)
(4, 23580.0)


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

**Sample Output:**

('Afternoon', 164)
('Evening', 1275)
('Morning', 561)



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

