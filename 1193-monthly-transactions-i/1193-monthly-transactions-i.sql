select
date_format(trans_date , '%Y-%m') as month ,
country ,
count(amount) as trans_count,
sum(state = 'approved') AS approved_count,
sum(amount) as trans_total_amount,
SUM(CASE
            WHEN state = 'approved' THEN amount
            ELSE 0
        END) AS approved_total_amount
from Transactions t2
group by month , country