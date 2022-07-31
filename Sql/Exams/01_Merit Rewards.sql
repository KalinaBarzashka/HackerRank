SET NOCOUNT ON;

select ei.employee_id, ei.name
from employee_information ei
inner join last_quarter_bonus lqb ON ei.employee_id = lqb.employee_id
where ei.division = 'HR' and lqb.bonus = 5000

go