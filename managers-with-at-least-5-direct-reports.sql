-- MySQL, Oracle PL/SQL, MSSQL
-- multiple managers
SELECT name FROM Employee WHERE id IN
(SELECT manager_id
 FROM Employee
 GROUP BY manager_id
 HAVING (COUNT(DISTINCT id)) >= 5)

-- single manager
SELECT name FROM Employee WHERE id =
(SELECT manager_id
 FROM Employee
 GROUP BY manager_id
 HAVING (COUNT(DISTINCT id)) >= 5)