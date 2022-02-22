-- MYSQL
-- You are given three tables: Students, Friends and Packages. 
-- Students contains two columns: ID and Name. 
-- Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). 
-- Packages contains two columns: ID and Salary (offered salary in $ thousands per month).
-- Write a query to output the names of those students whose best friends 
-- got offered a higher salary than them. Names must be ordered by the 
-- salary amount offered to the best friends. It is guaranteed that no 
--  two students got same salary offer.


SELECT a.name 
FROM students as a 
INNER JOIN friends as b ON a.id = b.id
INNER JOIN packages as c on a.id = c.id
INNER JOIN packages as c2 on b.friend_id = c2.id 
WHERE c.salary < c2.salary order by c2. salary;