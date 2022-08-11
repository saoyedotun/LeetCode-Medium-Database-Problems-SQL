-- MySQL, Oracle PL/SQL, MSSQL
SELECT Department, Employee, Salary FROM
    (
        SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary,
               RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS salary_rank
        FROM Employee e
                 JOIN Department d ON e.departmentId = d.id
    ) lookup
WHERE salary_rank = 1

-- MySQL, Oracle PL/SQL
SELECT Department.name AS Department, Employee.name AS Employee, salary AS Salary
FROM Employee
         JOIN Department ON Employee.departmentId = Department.id
WHERE (departmentId, Salary) IN
      (SELECT departmentId, MAX(salary)
       FROM Employee
       GROUP BY departmentId)