-- MYSQL
-- Generate the following two result sets:
-- Query an alphabetically ordered list of all names in OCCUPATIONS, 
-- immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). 
-- For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).

-- Query the number of ocurrences of each occupation in OCCUPATIONS. 
-- Sort the occurrences in ascending order, and output them in the following format:
-- There are a total of [occupation_count] [occupation]s.

select 
case 
    when occupation = 'Doctor' then concat(name,"(D)")
    when occupation = 'Actor' then concat(name,"(A)")
    when occupation = 'Singer' then concat(name,"(S)")
    when occupation = 'Professor' then concat(name,"(P)")
end
from occupations order by name;

select 
case
    when occupation = 'Doctor' then concat("There are a total of ", count(occupation), " doctors.")
    when occupation = 'Actor' then concat("There are a total of ", count(occupation), " actors.")
    when occupation = 'Singer' then concat("There are a total of ", count(occupation), " singers.")
    when occupation = 'Professor' then concat("There are a total of ", count(occupation), " professors.")   
end
from occupations group by occupation
order by count(occupation),occupation;