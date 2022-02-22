
-- MYQL
-- You are given a table, Functions, containing two columns: X and Y.
-- Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.
-- Write a query to output all such symmetric pairs in ascending order 
-- by the value of X. List the rows such that X1 ≤ Y1.

SELECT a1.x, 
	   a1.y 
FROM functions as a1 
INNER JOIN functions as a2 on a1.x = a2.y and a1.y = a2.x
GROUP BY a1.x, a1.y 
HAVING count(a1.x) > 1 or a1.x < a1.y;