-- PGSQL
-- Write a query to output the top merchant everyday based on the average revenue per user.

WITH summary AS 
(
	SELECT 
		txntime,
		merchant,
		ROUND(AVG(revenue),2) AS avg_rev,
		ROW_NUMBER() OVER(PARTITION BY TXNTIME ORDER BY ROUND(AVG(revenue),2) DESC) AS row_num
	FROM 
		transactions
	GROUP BY 
		txntime, merchant
) 
SELECT 
	txntime,
	merchant,
	avg_rev
FROM 
	summary	
WHERE 
	row_num = 1;