{{
    config(
        materialized='table'
    )
}}
select
    customers.id,
    customers.first_name,
    customers.last_name,
    customer_orders.first_order_date,
    customer_orders.most_recent_order_date,
    coalesce(customer_orders.number_of_orders, 0) as number_of_orders
from raw.jaffle_shop.customers
left join {{ ref('customer_orders') }} using (id)