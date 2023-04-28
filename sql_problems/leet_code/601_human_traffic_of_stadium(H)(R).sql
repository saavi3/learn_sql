/*
	Question      - 601. Human Traffic of Stadium
	Question Link - https://leetcode.com/problems/human-traffic-of-stadium/description/
*/

DROP TABLE IF EXISTS stadium

CREATE TABLE stadium (
    id INT,
    visit_date DATE,
    people INT
);

INSERT INTO stadium (id, visit_date, people) VALUES
    (1, '2017-01-01', 10),
    (2, '2017-01-02', 109),
    (3, '2017-01-03', 150),
    (4, '2017-01-04', 99),
    (5, '2017-01-05', 145),
    (6, '2017-01-06', 1455),
    (7, '2017-01-07', 199),
    (8, '2017-01-09', 188);

WITH t AS (
SELECT *,
	id - ROW_NUMBER() OVER(ORDER BY ID) gap
FROM stadium
WHERE people >=100
),
t_count AS (
SELECT * , COUNT(*) OVER(PARTITION BY gap) consecutiveCount
FROM t
)
SELECT id, visit_date, people
FROM t_count
WHERE consecutiveCount >= 3