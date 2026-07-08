--Cumulative Revenue Tracking (Running Totals)
--Objective: Calculate the running total of sales over time to track daily business growth.
SELECT order_id, order_date, order_amount,
SUM(order_amount) OVER(
	ORDER BY order_date
) AS cumulative_revenue
FROM sales_orders;
--Summarized by day
SELECT DISTINCT(order_date),
SUM(order_amount) OVER(
	ORDER BY order_date
) AS cumulative_revenue
FROM sales_orders
ORDER BY order_date;

--Segmented Customer Behavior (Partitioning)
--Objective: Find out how much each specific customer is spending over time by resetting the running total for each user. 
SELECT customer_id, order_id, order_date, order_amount,
SUM(order_amount) OVER(
	PARTITION BY customer_id
	ORDER BY order_date
) AS customer_lifetime_spend
FROM sales_orders;

--Competitor & Product Performance (Ranking)
--Objective: Rank product categories by their total sales volume to see which category performs the best. 
SELECT product_category, SUM(order_amount) as total_category_sales,
DENSE_RANK() OVER(
	ORDER BY SUM(order_amount) DESC
) AS revenue_rank
FROM sales_orders
GROUP BY product_category;

--Time-Series Delta Analysis (Value Offsets)
--Objective: Compare the current order amount against the customer's previous order amount to find the variance. 
SELECT order_id, customer_id, order_date, order_amount, 
COALESCE(
	LAG(order_amount) OVER(
		PARTITION BY customer_id
		ORDER BY order_date
	), 0
) AS previous_order_amount,
(order_amount - 
COALESCE(
	LAG(order_amount) OVER(
		PARTITION BY customer_id
		ORDER BY order_date
	), 0)
) AS spend_difference
FROM sales_orders;
