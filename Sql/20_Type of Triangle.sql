SELECT CASE
    WHEN (t.a + t.b <= t.c) THEN 'Not A Triangle'
    WHEN (t.a = t.b AND t.a = t.c AND t.b = t.c) THEN 'Equilateral'
    WHEN (t.a = t.b OR t.a = t.c OR t.b = t.c) THEN 'Isosceles'
    ELSE 'Scalene'
 END
FROM TRIANGLES t