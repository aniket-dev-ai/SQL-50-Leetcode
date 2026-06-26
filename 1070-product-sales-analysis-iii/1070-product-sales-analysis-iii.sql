# Write your MySQL query statement below
select product_id , year as first_year , s.quantity , s.price  from Sales s
join (
    select
        product_id ,
        min(year) as year
    from Sales 
group by product_id) t
using (product_id , year)