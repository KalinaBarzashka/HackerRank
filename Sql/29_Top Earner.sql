DECLARE @maxTotalErn int;
SET @maxTotalErn = (select MAX(months*salary) from Employee);

DECLARE @employeesCount int;
SET @employeesCount = (select Count(*) from Employee where (months*salary) = @maxTotalErn);

SELECT @maxTotalErn, @employeesCount;