SELECT DISTINCT CITY
FROM STATION
WHERE RIGHT(CITY, 1) not in ('a', 'e', 'o', 'i', 'u') AND LEFT(CITY, 1) not in ('a', 'e', 'o', 'i', 'u')