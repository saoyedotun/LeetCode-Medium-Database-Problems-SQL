-- MySQL
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N = N - 1;
RETURN (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET N
    );
END

-- MSSQL
CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
RETURN (
    /* Write your T-SQL query statement below. */
    SELECT salary AS getNthHighestSalary
    FROM
        (SELECT DISTINCT salary,
                         DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
         FROM Employee) lookup
    WHERE salary_rank = @N
);
END