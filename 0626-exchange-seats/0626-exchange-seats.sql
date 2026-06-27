select s1.id,

case
    when (s1.id % 2 = 0) then
        (
            select student from Seat s2
            where s2.id = s1.id-1
        )
    when s1.id = (select max(id) from Seat) And s1.id % 2 <> 0 then
        (
            select student from Seat s2
            where s2.id = s1.id
        )
    else
        (
            select student from Seat s2
            where s2.id = s1.id+1
        )
    end as student 
from Seat s1;