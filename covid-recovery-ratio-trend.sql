-- PGSQL
-- Database: https://bit.io/bitdotio/csse_covid_19_data/
-- Write a query to check the trend of covid recovery ratio for Brazil


SELECT 
	rec.country_region,
	round(rec.n3_17_20 / nullif(con.n5_17_20, 0)::numeric,2) as recovery_ratio_3_20,
	round(rec.n4_17_20 / nullif(con.n8_17_20, 0)::numeric,2) as recovery_ratio_4_20,
	round(rec.n5_17_20 / nullif(con.n11_17_20, 0)::numeric,2) as recovery_ratio_5_20,
	round(rec.n6_17_20 / nullif(con.n2_17_21, 0)::numeric,2) as recovery_ratio_6_20,
	round(rec.n7_17_20 / nullif(con.n2_17_21, 0)::numeric,2) as recovery_ratio_7_20,
	round(rec.n8_17_20 / nullif(con.n2_17_21, 0)::numeric,2) as recovery_ratio_8_20,
	round(rec.n9_17_20 / nullif(con.n2_17_21, 0)::numeric,2) as recovery_ratio_9_20,
	round(rec.n10_17_20 / nullif(con.n2_17_21, 0)::numeric,2) as recovery_ratio_10_20,
	round(rec.n11_17_20 / nullif(con.n2_17_21, 0)::numeric,2) as recovery_ratio_11_20,
	round(rec.n12_17_20 / nullif(con.n2_17_21, 0)::numeric,2) as recovery_ratio_12_20,
	round(rec.n1_17_21 / nullif(con.n2_17_21, 0)::numeric,2) as recovery_ratio_1_21,
	round(rec.n2_17_21 / nullif(con.n2_17_21, 0)::numeric,2) as recovery_ratio_2_21


FROM 
	"bitdotio/csse_covid_19_data"."time_series_covid19_recovered_global" as rec
INNER JOIN
	"bitdotio/csse_covid_19_data"."time_series_covid19_confirmed_global" as con
ON 
	rec.country_region = con.country_region
WHERE 
	rec.country_region = 'Brazil' ;