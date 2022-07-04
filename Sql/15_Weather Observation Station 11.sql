SELECT DISTINCT CITY
FROM STATION
WHERE RIGHT(CITY, 1) not in ('a', 'e', 'o', 'i', 'u') or LEFT(CITY, 1) not in ('a', 'e', 'o', 'i', 'u')