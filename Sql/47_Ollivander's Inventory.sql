select w.id, wp.age, w.coins_needed, w.power
from Wands w
inner join Wands_Property wp ON w.code = wp.code
where wp.is_evil = 0 and w.coins_needed = (select min(a.coins_needed) 
                                          from Wands a 
                                          inner join Wands_Property b ON a.code = b.code
                                          where wp.age = b.age and w.power = a.power)
order by w.power desc, wp.age desc;