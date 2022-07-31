SET NOCOUNT ON;

select c.customer_name, cast(SUM(total_price) as DECIMAL(10,6)) as amount_spent
from customer c
inner join invoice i ON c.id = i.customer_id
group by c.customer_name
having SUM(total_price) <= 0.25 * (select AVG(total_price) from invoice)
order by SUM(total_price) desc

go