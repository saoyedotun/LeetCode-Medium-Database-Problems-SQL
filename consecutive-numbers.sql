-- MySQL, MSSQL
-- WITH cte AS
-- (SELECT *,
--  LEAD(num, 1) OVER() AS next_value_1,
--  LEAD(num, 2) OVER() AS next_value_2
--  FROM Logs)

WITH cte AS
(SELECT *,
 LEAD(num, 1) OVER(ORDER BY id) AS next_value_1,
 LEAD(num, 2) OVER(ORDER BY id) AS next_value_2
 FROM Logs)

SELECT DISTINCT num AS ConsecutiveNums
FROM cte
WHERE num = next_value_1
  AND num = next_value_2