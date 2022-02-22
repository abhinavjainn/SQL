-- PGSQL
-- Display a summary if ratings in the table FILM


SELECT
sum(CASE rating
		when 'R' then 1 else 0
	END) as rated_R,
sum(CASE rating
		when 'PG' then 1 else 0
	END) as rated_PG,
sum(CASE rating
		when 'PG-13' then 1 else 0
	END) as rated_PG13
FROM film;