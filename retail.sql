-- 1.Which product categories generate the highest revenue, and how do they trend over time (monthly/quarterly)?
-- (Helps identify top-performing categories and seasonality)

SELECT 
	category,
	DATEFROMPARTS(YEAR(transaction_date), MONTH(transaction_date), 1) AS month_start,
	SUM(total_spent) AS revenue
FROM retail_orders
GROUP BY category,DATEFROMPARTS(YEAR(transaction_date), MONTH(transaction_date), 1)
ORDER BY category,month_start

-- 2.Which items contribute most to sales within each category (Pareto / 80-20 analysis)?
-- (Business can focus on the core products driving most revenue)

WITH item_rev AS (
  SELECT category, item, SUM(total_spent) AS rev
  FROM retail_orders
  GROUP BY category, item
),
category_tot AS (
  SELECT category, SUM(rev) AS cat_rev FROM item_rev GROUP BY category
)
SELECT i.category, i.item, i.rev,
       i.rev / c.cat_rev AS pct_of_category
FROM item_rev i
JOIN category_tot c ON i.category = c.category
ORDER BY i.category, i.rev DESC

-- 3.Do discounts increase revenue, or do they only shift customer purchases without increasing overall spend?
-- (Impact of discounts on revenue & margins)
SELECT
  discount_applied,
  COUNT(DISTINCT transaction_id) AS transactions,
  SUM(total_spent) AS revenue,
  SUM(quantity) AS total_quantity,
  AVG(total_spent) AS avg_ticket
FROM retail_orders
GROUP BY discount_applied;

-- 4.Which locations generate the highest revenue, and how do customer buying patterns differ by region?
-- (Useful for regional strategy & marketing)

SELECT location,category,
	SUM(total_spent) AS revenue,
	COUNT(DISTINCT transaction_id) AS transactions 
FROM retail_orders
GROUP BY location,category
ORDER BY category,location,revenue DESC;

-- 5.How does payment method (cash, card, wallet) influence customer spending behavior?
-- (Can inform offers & partnerships with payment providers)

SELECT customer_id,payment_method,
	SUM(total_spent) AS total_spent
FROM retail_orders
GROUP BY customer_id,payment_method
ORDER BY customer_id,payment_method

-- 6.Who are the top customers by revenue, and what categories do they prefer?
-- (Basic customer segmentation (VIP / high-value customers)

SELECT TOP 10 customer_id,
	SUM(total_spent) AS revenue,
	COUNT(DISTINCT transaction_id) AS transactions
FROM retail_orders
GROUP BY customer_id
ORDER BY revenue DESC;

-- 7.What is the average basket size (items per transaction), and how does it vary with/without discounts?
-- (Shows how discounts impact quantity vs value)

WITH trx AS (
  SELECT transaction_id, discount_applied,
         SUM(quantity) AS items_per_trx,
         SUM(total_spent) AS trx_value
  FROM retail_orders
  GROUP BY transaction_id, discount_applied
)
SELECT discount_applied,
       AVG(items_per_trx) AS avg_items_per_trx,
       AVG(trx_value) AS avg_trx_value,
       COUNT(*) AS transactions
FROM trx
GROUP BY discount_applied;
