SELECT TOP 1 CITY, LEN(CITY)
FROM STATION s
WHERE len(CITY) = (SELECT max(len(CITY)) FROM [STATION])
ORDER BY CITY ASC

SELECT TOP 1 CITY, LEN(CITY)
FROM STATION s
WHERE len(CITY) = (SELECT min(len(CITY)) FROM [STATION])
ORDER BY CITY ASC