SELECT co.CONTINENT, FLOOR(AVG(ci.POPULATION)) FROM COUNTRY co INNER JOIN CITY ci ON co.CODE = ci.COUNTRYCODE GROUP BY co.CONTINENT