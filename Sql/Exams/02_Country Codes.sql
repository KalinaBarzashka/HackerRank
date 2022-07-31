SET NOCOUNT ON;

select c.customer_id, c.name, concat('+', trim(cc.country_code), trim(c.phone_number))
from customers c
inner join country_codes cc ON c.country = cc.country
order by c.customer_id

go