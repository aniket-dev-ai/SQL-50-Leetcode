# Write your MySQL query statement below
Select e2.name from Employee e1 
inner join Employee e2
on e2.id = e1.managerId 
group by e1.managerId  
having count(e1.managerId )>4;