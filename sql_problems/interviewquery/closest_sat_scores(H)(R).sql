/*
	Question      - 2nd Highest Salary
	Question Link - https://www.interviewquery.com/questions/2nd-highest-salary
*/

DROP TABLE IF EXISTS scores

CREATE TABLE scores (
  id INTEGER,
  student VARCHAR(50),
  score INTEGER
);

-- Inserting data for the "scores" table
INSERT INTO scores (id, student, score) VALUES (1, 'John', 85);
INSERT INTO scores (id, student, score) VALUES (2, 'Alice', 92);
INSERT INTO scores (id, student, score) VALUES (3, 'Bob', 82);
INSERT INTO scores (id, student, score) VALUES (4, 'Sarah', 95);

SELECT TOP 1 s1.student, 
    s2.student,
    ABS(s1.score-s2.score) AS score_diff
FROM scores s1
JOIN scores s2
ON s1.id < s2.id
ORDER BY 3, 1, 2
