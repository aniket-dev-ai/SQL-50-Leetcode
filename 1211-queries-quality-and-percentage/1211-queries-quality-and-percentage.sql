select query_name,
ROUND(
    avg(
        rating / position) , 2) as quality ,
Round(
        (
            select count(rating) 
            from Queries where rating < 3 
            and q.query_name = query_name
        )
        /count(rating) * 100 , 2)
         as poor_query_percentage 
from Queries q
group by query_name;