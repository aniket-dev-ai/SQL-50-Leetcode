SELECT 
query_name , ROUND(AVG(rating/position),2) as quality,
IFNULL(Round((
    select count(*) from Queries q2 where q1.query_name = q2.query_name and q2.rating < 3
    order by query_name
)/count(q1.rating) * 100 , 2),0) as poor_query_percentage 
from 
Queries q1
GROUP BY query_name;