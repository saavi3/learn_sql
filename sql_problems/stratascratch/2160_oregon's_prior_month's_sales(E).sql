/*
    Question      - Oregon's Prior Month's Sales
	Question Link - https://platform.stratascratch.com/coding/2160-oregons-prior-months-sales

*/

SELECT SUM(units_sold * cost_in_dollars) AS total_sales
FROM online_orders oo
LEFT JOIN online_customers oc 
ON oo.customer_id = oc.id
WHERE oc.STATE = 'Oregon'
	AND month(oo.DATE) = '4';
