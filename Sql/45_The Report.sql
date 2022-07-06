DECLARE @output TABLE (name varchar(20), grade int, marks INT);
DECLARE @formattedOutput TABLE (name varchar(20), grade int, marks INT);

INSERT INTO @output
SELECT s.name, (SELECT g.grade from grades g where g.min_mark <= s.marks and g.max_mark >= s.marks) as finalGrade, s.marks
FROM students s

update @output
SET name = null
where grade < 8

SELECT name, grade, marks FROM @output
WHERE grade >= 8
ORDER BY grade desc, name asc

SELECT name, grade, marks FROM @output
WHERE grade < 8
ORDER BY grade desc, marks asc
