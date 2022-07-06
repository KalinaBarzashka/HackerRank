select f.x, f.y
from functions f
inner join functions f1 ON f.x = f1.y and f1.x = f.y
GROUP BY f.x, f.y
HAVING COUNT(f.x) > 1 or f.x < f.y
order by f.x