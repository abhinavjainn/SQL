--PGSQL
-- Find out percentage change in year or on year revenue each month since start of 2016

WITH results AS(

	SELECT 
		mnth,
		ROUND(
			((revenue - LAG(revenue,12) OVER(ORDER BY mnth))
				/
				LAG(revenue,12) OVER(ORDER BY mnth))*100
			,2) AS yoy_pct_rev_change
	FROM 
		monthly_revenue
)

SELECT 
	* 
FROM 
	results 
WHERE 
	mnth >= '2016-01-01';
