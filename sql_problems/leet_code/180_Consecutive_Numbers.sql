/*
	Question      - 180. Consecutive Numbers
	Question Link - https://leetcode.com/problems/consecutive-numbers/
*/

DROP TABLE IF EXISTS Logs;

CREATE TABLE Logs (
    id INT PRIMARY KEY,
    num INT NOT NULL
);

INSERT INTO Logs (id, num) VALUES (1, 1);
INSERT INTO Logs (id, num) VALUES (2, 1);
INSERT INTO Logs (id, num) VALUES (3, 1);
INSERT INTO Logs (id, num) VALUES (4, 2);
INSERT INTO Logs (id, num) VALUES (5, 1);
INSERT INTO Logs (id, num) VALUES (6, 2);
INSERT INTO Logs (id, num) VALUES (7, 2);


WITH cte AS (
SELECT num,
       LEAD(num, 1) OVER (ORDER BY id) AS one_num_forward,
       LEAD(num, 2) OVER (ORDER BY id) AS two_num_forward
  FROM Logs
)

SELECT DISTINCT num AS ConsecutiveNums
  FROM cte
  WHERE num = one_num_forward
  AND num = two_num_forward