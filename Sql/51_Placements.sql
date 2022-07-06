select s.name
from students s
inner join packages p ON s.ID = p.ID
inner join friends f ON s.ID = f.ID
where p.salary < (select fs.salary from packages fs where fs.ID = f.Friend_ID)
order by (select fs.salary from packages fs where fs.ID = f.Friend_ID)