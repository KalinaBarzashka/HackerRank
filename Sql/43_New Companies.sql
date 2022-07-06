SELECT c.company_code, c.founder, COUNT(distinct lm.lead_manager_code), COUNT(distinct sm.senior_manager_code), COUNT(distinct m.manager_code), COUNT(distinct e.employee_code) 
FROM COMPANY c 
INNER JOIN Lead_Manager lm ON c.company_code = lm.company_code
INNER JOIN Senior_Manager sm ON lm.lead_manager_code = sm.lead_manager_code
INNER JOIN Manager m ON sm.senior_manager_code = m.senior_manager_code
INNER JOIN Employee e ON m.manager_code = e.manager_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code asc;