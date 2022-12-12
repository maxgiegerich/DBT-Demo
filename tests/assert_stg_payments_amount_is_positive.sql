with payments as (
        select * from {{ ref('stg_payments')}}
)

SELECT order_id,
sum(amount) total_amount

from payments
group by 1
having total_amount < 0