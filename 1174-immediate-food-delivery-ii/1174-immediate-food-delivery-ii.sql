SELECT
    ROUND(
        AVG(order_date = customer_pref_delivery_date) * 100,
        2
    ) AS immediate_percentage
FROM Delivery d
JOIN (
    SELECT customer_id, MIN(order_date) AS order_date
    FROM Delivery
    GROUP BY customer_id
) t
USING(customer_id, order_date);