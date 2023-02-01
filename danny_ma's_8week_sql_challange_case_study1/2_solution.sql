SELECT * FROM [dannys_diner].[sales] 
SELECT * FROM [dannys_diner].[members]
SELECT * FROM [dannys_diner].[menu]

--1. What is the total amount each customer spent at the restaurant?
SELECT s.customer_id , sum(m.price) total_amount
FROM [dannys_diner].[sales] s
LEFT JOIN [dannys_diner].[menu] m
ON s.product_id  = m.product_id
GROUP BY s.customer_id 

--2. How many days has each customer visited the restaurant?
SELECT customer_id, COUNT(distinct order_date) days_visited
FROM [dannys_diner].[sales]
GROUP BY customer_id


--3. What was the first item from the menu purchased by each customer?

--method1
SELECT s.customer_id, min(s.product_id) product_id
FROM [dannys_diner].[sales] s
INNER JOIN (SELECT customer_id, min(order_date) order_date
			FROM [dannys_diner].[sales] 
			GROUP BY customer_id) sales_firstdate
ON s.customer_id = sales_firstdate.customer_id
AND s.order_date = sales_firstdate.order_date
GROUP BY s.customer_id 

--method2
WITH t as (
	SELECT customer_id, 
		product_id,
		ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date, product_id) AS roworder
	FROM [dannys_diner].[sales]
)
SELECT customer_id, 
	product_id 
FROM t
WHERE roworder = 1


--4. What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT TOP 1 *
FROM (SELECT product_id, 
		COUNT(*) purchased_times
	  FROM [dannys_diner].[sales] 
GROUP BY product_id) purchased_times
ORDER BY purchased_times DESC

SELECT TOP 1 *
FROM (
SELECT product_id, 
	COUNT(*) OVER (PARTITION BY product_id) purchased_times
FROM [dannys_diner].[sales]
) purchased_times
ORDER BY purchased_times DESC


--5. Which item was the most popular for each customer?
WITH t AS (
SELECT customer_id, 
	product_id,
	ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY purchased_times DESC) roworder
FROM (SELECT customer_id, 
		product_id, 
		COUNT(*) purchased_times 
	  FROM [dannys_diner].[sales] 
	  GROUP BY customer_id, product_id) purchased_times_data)
SELECT *
FROM t
WHERE roworder = 1

--6. Which item was purchased first by the customer after they became a member?
SELECT * 
FROM [dannys_diner].[sales] s
INNER JOIN [dannys_diner].[members] m 
ON s.customer_id = m.customer_id

--7. Which item was purchased just before the customer became a member?
--8. What is the total items and amount spent for each member before they became a member?
--9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
--10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
