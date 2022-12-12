with orders as (
    SELECT * FROM {{ref ('stg_orders')}}
),

customers as (
    SELECT * FROM {{ref ('stg_customers')}}
),

payments as (
    SELECT * FROM {{ref ('stg_payments')}}
)


SELECT 
    orders.order_id
    ,orders.order_date
    ,customers.customer_id
    ,sum(case when payments.status = 'success' then payments.amount end) as amount

FROM orders
    INNER JOIN customers on customers.customer_id = orders.customer_id
    LEFT JOIN payments on orders.order_id = payments.order_id
GROUP BY 1,2,3