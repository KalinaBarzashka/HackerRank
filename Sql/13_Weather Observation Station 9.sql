SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY, 1) not in ('a', 'e', 'o', 'i', 'u')