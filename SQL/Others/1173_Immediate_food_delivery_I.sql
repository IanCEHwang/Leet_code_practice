select
    round(sum( if(order_date = customer_pref_delivery_date , 1 , 0)) / count(order_date) * 100 , 2) as immediate_percentage
from delivery
