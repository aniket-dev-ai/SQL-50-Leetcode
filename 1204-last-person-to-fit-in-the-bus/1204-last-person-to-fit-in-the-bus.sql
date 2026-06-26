SELECT person_name
FROM (
    SELECT 
        person_name,
        SUM(weight) OVER (ORDER BY turn) AS cum_wt
    FROM Queue
) t
WHERE cum_wt = (
    SELECT MAX(cum_wt) 
    FROM (
        SELECT SUM(weight) OVER (ORDER BY turn) AS cum_wt
        FROM Queue
    ) t2
    WHERE cum_wt <= 1000
);