-- MySQL, Oracle PL/SQL, MSSQL
-- Using Joins
SELECT DISTINCT a.num AS ConsecutiveNums
FROM Logs a
         JOIN Logs b ON a.id = b.id + 1 AND a.num = b.num
         JOIN Logs c ON a.id = c.id + 2 AND a.num = c.num

-- MySQL, MSSQL
-- Using With & Window Functions
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