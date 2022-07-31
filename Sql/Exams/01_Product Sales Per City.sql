SET NOCOUNT ON;

select c.city_name, p.product_name, 
    ROUND(SUM(ii.line_total_price), 2) as total_amount
from invoice i
inner join customer cus ON i.customer_id = cus.id
inner join city c ON cus.city_id = c.id
inner join invoice_item ii ON i.id = ii.invoice_id
inner join product p ON ii.product_id = p.id
group by c.city_name, p.product_name
order by total_amount desc, c.city_name asc, p.product_name asc

go