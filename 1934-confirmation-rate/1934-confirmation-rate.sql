SELECT 
    s.user_id, 
    COALESCE(ROUND(AVG(c.action = 'confirmed'),2),0) AS confirmation_rate
FROM  Signups s  left Join Confirmations c
on c.user_id = s.user_id
GROUP BY s.user_id order by s.time_stamp ;
