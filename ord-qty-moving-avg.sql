-- PostgreSQL
-- Northwind databse: Last 5 days average qty ordered for each product

SELECT 
	T2.PRODUCT_ID,
	T1.ORDER_DATE,
	T2.QUANTITY,
	ROUND( AVG(T2.QUANTITY) 
			OVER(
		    	PARTITION BY T2.PRODUCT_ID 
				ORDER BY order_date
				ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING 
				)
		,2 ) AS avg_last_5_ord_qty
FROM 
	ORDERS AS T1
INNER JOIN 
	ORDER_DETAILS AS T2 ON T1.ORDER_ID = T2.ORDER_ID
ORDER BY 
	T2.PRODUCT_ID;