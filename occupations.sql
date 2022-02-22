-- MYSQL
-- Generate the following two result sets:
-- Query an alphabetically ordered list of all names in OCCUPATIONS, 
-- immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). 
-- For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).

-- Query the number of ocurrences of each occupation in OCCUPATIONS. 
-- Sort the occurrences in ascending order, and output them in the following format:
-- There are a total of [occupation_count] [occupation]s.

SELECT 
CASE 
    when occupation = 'Doctor' then concat(name,"(D)")
    when occupation = 'Actor' then concat(name,"(A)")
    when occupation = 'Singer' then concat(name,"(S)")
    when occupation = 'Professor' then concat(name,"(P)")
END
FROM occupations ORDER BY name;

SELECT 
CASE 
    when occupation = 'Doctor' then concat("There are a total of ", count(occupation), " doctors.")
    when occupation = 'Actor' then concat("There are a total of ", count(occupation), " actors.")
    when occupation = 'Singer' then concat("There are a total of ", count(occupation), " singers.")
    when occupation = 'Professor' then concat("There are a total of ", count(occupation), " professors.")   
END
FROM occupations GROUP BY occupation
ORDER BY count(occupation),occupation;