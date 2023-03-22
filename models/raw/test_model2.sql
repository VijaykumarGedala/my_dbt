with customer_orders as (
    select
        id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(user_id) as number_of_orders
    from raw.jaffle_shop.orders
    group by 1
)

select
    customers.id,
    customers.first_name,
    customers.last_name,
    customer_orders.first_order_date,
    customer_orders.most_recent_order_date,
    coalesce(customer_orders.number_of_orders, 0) as number_of_orders
from raw.jaffle_shop.customers
left join customer_orders using (id)