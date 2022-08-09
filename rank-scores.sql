-- MySQL, MSSQL
SELECT score, DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank'
FROM Scores

SELECT score, score_rank AS 'rank'
FROM
    (
        SELECT id, score,
               DENSE_RANK() OVER (ORDER BY score DESC) score_rank
        FROM Scores
    ) lookup

SELECT s1.score,
       (SELECT COUNT(DISTINCT score) FROM Scores s2 WHERE s2.Score >= s1.Score) AS 'rank'
FROM Scores s1
ORDER BY s1.score DESC