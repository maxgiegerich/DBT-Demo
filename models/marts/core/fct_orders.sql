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
    ,customers.customer_id
    ,payments.amount as amount

FROM orders
    INNER JOIN customers on customers.customer_id = orders.customer_id
    LEFT JOIN payments on orders.order_id = payments.order_id
