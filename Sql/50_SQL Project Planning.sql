SELECT res1.start_date, MIN(res2.end_date)
FROM (
    SELECT START_DATE
    FROM PROJECTS
    WHERE START_DATE NOT IN (SELECT END_DATE FROM PROJECTS)) res1 
join (
SELECT END_DATE
    FROM PROJECTS
    WHERE END_DATE NOT IN (SELECT START_DATE FROM PROJECTS)) res2
ON res1.start_date < res2.end_date
GROUP BY res1.start_date
ORDER BY datediff(dd, res1.start_date, min(res2.end_date)), res1.start_date