select
    id,
    min(order_date) as first_order_date,
    max(order_date) as most_recent_order_date,
    count(user_id) as number_of_orders
from --raw.jaffle_shop.orders
{{ source('raw', 'orders') }}
group by 1