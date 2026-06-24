# Write your MySQL query statement below
SELECT name , bonus from Bonus
right join Employee
on Bonus.empId = Employee.empId
where bonus < 1000 or bonus is NULL;