SELECT
    [Doctor],
    [Professor],
    [Singer],
    [Actor]
FROM
    (SELECT
         ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) row_num,
         [Name],
         [Occupation] 
     FROM 
         Occupations
    ) as res
PIVOT
    ( MIN([Name]) FOR [occupation] IN ([Doctor],[Professor],[Singer],[Actor]) ) as output;