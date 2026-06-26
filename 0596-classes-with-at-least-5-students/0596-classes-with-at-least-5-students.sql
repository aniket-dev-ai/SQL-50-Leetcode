# Write your MySQL query statement below
select class from Courses 
    join
    (
        select 
        class , 
        count(student) as st 
        from 
            Courses 
            group by class 
            having st >= 5
    ) t
using(class) group by class