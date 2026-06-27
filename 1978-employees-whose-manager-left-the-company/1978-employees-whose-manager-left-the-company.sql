# Write your MySQL query statement below
select 
employee_id from Employees e1
where salary < 30000 and e1.manager_id is not null
and (
    select count(*) 
    from Employees e2 
    where e2.employee_id = e1.manager_id 
    ) = 0
order by e1.employee_id;