# Retail Sales SQL Analysis

**Introduction:** This project analyzes retail sales data to extract insights on customer behavior, sales trends, and category performance.

**Purpose:** Understand sales patterns and perform data cleaning and manipulation using SQL queries.

**Skills Learned:** SQL querying and aggregation, Data cleaning and transformation, SQLite database management, Python scripting for automation

**Project Level:** Intermediate

**Database file:** `retail_sales.db`

## Tables and Schema

### Table: `retail_sales`
| Column | Type | Not Null | Default | Primary Key |
|--------|------|----------|---------|-------------|
| transactions_id | INT | False | None | 1 |
| sale_date | DATE | False | None | 0 |
| sale_time | TIME | False | None | 0 |
| customer_id | INT | False | None | 0 |
| gender | VARCHAR(10) | False | None | 0 |
| age | INT | False | None | 0 |
| category | VARCHAR(35) | False | None | 0 |
| quantity | INT | False | None | 0 |
| price_per_unit | FLOAT | False | None | 0 |
| cogs | FLOAT | False | None | 0 |
| total_sale | FLOAT | False | None | 0 |

## Queries and Data Manipulation

**Task**: Prepare the environment by attaching the database

```sql
ATTACH DATABASE '/Users/elianelapointe/sql/projects/retail_sales/retail_sales.db' AS source_db;
```

*Could not execute query: database source_db is already in use*

**Explanation:**

**Task**: Preview the first 5 rows of the retail_sales table

```sql
SELECT rowid, * FROM source_db.retail_sales LIMIT 5;
```

| rowid | transactions_id | sale_date | sale_time | customer_id | gender | age | category | quantity | price_per_unit | cogs | total_sale |
|----|----|----|----|----|----|----|----|----|----|----|----|
| 1 | 180 | 2022-11-05 | 10:47:00 | 117 | Male | 41 | Clothing | 3 | 300.0 | 129.0 | 900.0 |
| 2 | 522 | 2022-07-09 | 11:00:00 | 52 | Male | 46 | Beauty | 3 | 500.0 | 145.0 | 1500.0 |
| 3 | 559 | 2022-12-12 | 10:48:00 | 5 | Female | 40 | Clothing | 4 | 300.0 | 84.0 | 1200.0 |
| 4 | 1180 | 2022-01-06 | 08:53:00 | 85 | Male | 41 | Clothing | 3 | 300.0 | 129.0 | 900.0 |
| 5 | 1522 | 2022-11-14 | 08:35:00 | 48 | Male | 46 | Beauty | 3 | 500.0 | 235.0 | 1500.0 |

**Explanation:**

**Task**: Understand the code by determining the quantity of rows and customers

```sql
SELECT COUNT(*) AS total_rows, COUNT(DISTINCT customer_id) AS unique_customers FROM source_db.retail_sales;
```

| total_rows | unique_customers |
|----|----|
| 2000 | 155 |

**Explanation:**

**Task**: Determine unique categories

```sql
SELECT DISTINCT category AS unique_categories FROM source_db.retail_sales;
```

| unique_categories |
|----|
| Clothing |
| Beauty |
| Electronics |

**Explanation:**

**Task**: Delete rows that have NULL values

```sql
DELETE FROM source_db.retail_sales WHERE ( transactions_id IS NULL OR sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR gender IS NULL OR age IS NULL OR category IS NULL OR quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL OR total_sale IS NULL );
```

_No output returned._

**Explanation:**

**Task**: Write a SQL query to retrieve all columns for sales made on '2022-11-05, which customer made the largest purchase on that day

```sql
SELECT customer_id, total_sale FROM source_db.retail_sales WHERE sale_date = '2022-11-05' ORDER BY total_sale DESC LIMIT 1;
```

| customer_id | total_sale |
|----|----|
| 140 | 1200.0 |

**Explanation:**

**Task**: Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:

```sql
SELECT * FROM source_db.retail_sales WHERE category = 'Clothing' AND quantity > 4 AND strftime('%Y-%m', sale_date) = '2022-11';
```

_No output returned._

**Explanation:**

**Task**: Write a SQL query to calculate the total sales (total_sale) for each category.:

```sql
SELECT category, SUM(total_sale) AS total_sales FROM source_db.retail_sales GROUP BY category;
```

| category | total_sales |
|----|----|
| Beauty | 286840.0 |
| Clothing | 311070.0 |
| Electronics | 313810.0 |

**Explanation:**

**Task**: Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:

```sql
SELECT ROUND(AVG(age), 2) AS average_age FROM source_db.retail_sales WHERE category = 'Beauty';
```

| average_age |
|----|
| 40.34 |

**Explanation:**

**Task**: Write a SQL query to find all transactions where the total_sale is greater than 1000.:

```sql
SELECT * FROM source_db.retail_sales WHERE total_sale > 1000;
```

| transactions_id | sale_date | sale_time | customer_id | gender | age | category | quantity | price_per_unit | cogs | total_sale |
|----|----|----|----|----|----|----|----|----|----|----|
| 522 | 2022-07-09 | 11:00:00 | 52 | Male | 46 | Beauty | 3 | 500.0 | 145.0 | 1500.0 |
| 559 | 2022-12-12 | 10:48:00 | 5 | Female | 40 | Clothing | 4 | 300.0 | 84.0 | 1200.0 |
| 1522 | 2022-11-14 | 08:35:00 | 48 | Male | 46 | Beauty | 3 | 500.0 | 235.0 | 1500.0 |
| 1559 | 2022-08-20 | 07:40:00 | 49 | Female | 40 | Clothing | 4 | 300.0 | 144.0 | 1200.0 |
| 421 | 2022-04-08 | 08:43:00 | 66 | Female | 37 | Clothing | 3 | 500.0 | 235.0 | 1500.0 |

**Explanation:**

**Task**: Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:

```sql
SELECT gender, category, COUNT(transactions_id) AS transaction_count FROM source_db.retail_sales GROUP BY gender, category;
```

| gender | category | transaction_count |
|----|----|----|
| Female | Beauty | 332 |
| Female | Clothing | 348 |
| Female | Electronics | 340 |
| Male | Beauty | 282 |
| Male | Clothing | 354 |

**Explanation:**

**Task**: Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

```sql
SELECT strftime('%Y', sale_date) AS year, strftime('%m', sale_date) AS month, AVG(total_sale) AS average_sale FROM source_db.retail_sales GROUP BY year, month ORDER BY average_sale DESC LIMIT 1;
```

| year | month | average_sale |
|----|----|----|
| 2023 | 02 | 535.531914893617 |

**Explanation:**

**Task**: Write a SQL query to find the top 5 customers based on the highest total sales:

```sql
SELECT customer_id, SUM(total_sale) AS total_spent FROM source_db.retail_sales GROUP BY customer_id ORDER BY total_spent DESC LIMIT 5;
```

| customer_id | total_spent |
|----|----|
| 3 | 38440.0 |
| 1 | 30750.0 |
| 5 | 30405.0 |
| 2 | 25295.0 |
| 4 | 23580.0 |

**Explanation:**

**Task**: Write a SQL query to find the number of unique customers who purchased items from each category.:

```sql
WITH hourly_sales AS ( SELECT *, CASE WHEN sale_time < '12:00:00' THEN 'Morning' WHEN sale_time >= '12:00:00' AND sale_time < '17:00:00' THEN 'Afternoon' ELSE 'Evening' END AS shift FROM source_db.retail_sales ) SELECT shift, COUNT(*) AS total_sales FROM hourly_sales GROUP BY shift;
```

| shift | total_sales |
|----|----|
| Afternoon | 164 |
| Evening | 1275 |
| Morning | 561 |

**Explanation:**

## Overall Project Reflections

_Summarize what you learned, challenges faced, and key takeaways from the project._
