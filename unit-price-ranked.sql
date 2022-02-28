 -- PostgreSQL
 -- Northwind database: Rank unit price per customer using window functions

SELECT 
    T1.CUSTOMER_ID,
	T1.ORDER_DATE,
	T2.UNIT_PRICE, 
-- 	ROW_NUMBER() OVER(PARTITION BY customer_id order by unit_price desc) AS rank_unit_price
-- 	RANK() OVER(PARTITION BY customer_id order by unit_price desc) AS rank_unit_price
--  DENSE_RANK() OVER(PARTITION BY CUSTOMER_ID ORDER BY UNIT_PRICE DESC) AS RANK_UNIT_PRICE
-- 	round((PERCENT_RANK() OVER(PARTITION BY CUSTOMER_ID ORDER BY UNIT_PRICE))::numeric,2) AS RANK_UNIT_PRICE
    NTILE(5) OVER(
                PARTITION BY CUSTOMER_ID ORDER BY UNIT_PRICE
                ) AS RANK_UNIT_PRICE
FROM 
    ORDERS AS T1
INNER JOIN
    ORDER_DETAILS AS T2 ON T1.ORDER_ID = T2.ORDER_ID
ORDER BY 
    T1.CUSTOMER_ID;