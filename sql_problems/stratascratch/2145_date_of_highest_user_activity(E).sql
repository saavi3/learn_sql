/*
	Question      - Date of Highest User Activity
	Question Link - https://platform.stratascratch.com/coding/2145-date-of-highest-user-activity
*/

-- Create the table

DROP TABLE IF EXISTS user_streaks;

CREATE TABLE user_streaks (
    user_id NVARCHAR(10),
    date_visited DATE
);

-- Insert data into the table
INSERT INTO user_streaks (user_id, date_visited)
VALUES
    ('u001', '2022-08-01'),
    ('u001', '2022-08-01'),
    ('u004', '2022-08-01'),
    ('u005', '2022-08-01'),
    ('u005', '2022-08-01'),
    ('u003', '2022-08-02'),
    ('u004', '2022-08-02'),
    ('u004', '2022-08-02'),
    ('u004', '2022-08-02'),
    ('u004', '2022-08-02'),
    ('u005', '2022-08-02'),
    ('u005', '2022-08-02'),
    ('u001', '2022-08-03'),
    ('u002', '2022-08-03'),
    ('u002', '2022-08-03'),
    ('u004', '2022-08-03'),
    ('u005', '2022-08-03'),
    ('u001', '2022-08-04'),
    ('u004', '2022-08-04'),
    ('u005', '2022-08-04'),
    ('u001', '2022-08-05'),
    ('u004', '2022-08-05'),
    ('u005', '2022-08-05'),
    ('u006', '2022-08-05'),
    ('u004', '2022-08-05'),
    ('u005', '2022-08-05'),
    ('u006', '2022-08-06'),
    ('u006', '2022-08-06'),
    ('u003', '2022-08-06'),
    ('u003', '2022-08-06'),
    ('u003', '2022-08-06'),
    ('u004', '2022-08-06'),
    ('u005', '2022-08-06'),
    ('u006', '2022-08-07'),
    ('u001', '2022-08-07'),
    ('u001', '2022-08-07'),
    ('u001', '2022-08-07'),
    ('u003', '2022-08-07'),
    ('u004', '2022-08-07'),
    ('u005', '2022-08-07'),
    ('u006', '2022-08-08'),
    ('u001', '2022-08-08'),
    ('u002', '2022-08-08'),
    ('u002', '2022-08-08'),
    ('u002', '2022-08-08'),
    ('u003', '2022-08-08'),
    ('u003', '2022-08-08'),
    ('u004', '2022-08-08'),
    ('u005', '2022-08-08'),
    ('u005', '2022-08-08'),
    ('u001', '2022-08-09'),
    ('u003', '2022-08-09'),
    ('u003', '2022-08-09'),
    ('u004', '2022-08-09'),
    ('u005', '2022-08-09'),
    ('u001', '2022-08-10'),
    ('u002', '2022-08-10'),
    ('u003', '2022-08-10'),
    ('u004', '2022-08-10'),
    ('u005', '2022-08-10'),
    ('u001', '2022-08-11'),
    ('u002', '2022-08-11'),
    ('u003', '2022-08-11'),
    ('u004', '2022-08-11'),
    ('u005', '2022-08-11');


WITH t1 AS (
    SELECT DATENAME(DW, date_visited) AS day,
    date_visited,
    COUNT(DISTINCT user_id) AS [number of users],
    RANK() OVER(ORDER BY COUNT(DISTINCT user_id) DESC) AS Rank
FROM user_streaks
WHERE date_visited >= CAST('08-01-2022' AS DATE)
AND date_visited <= CAST('08-07-2022' AS DATE)
GROUP BY date_visited
)
SELECT *
FROM t1
WHERE Rank <= 2

WITH t1 AS (
    SELECT DATENAME(DW, date_visited) AS day,
    date_visited,
    COUNT(DISTINCT user_id) AS [number of users],
    DENSE_RANK() OVER(ORDER BY COUNT(DISTINCT user_id) DESC) AS Rank
FROM user_streaks
WHERE date_visited >= CAST('08-01-2022' AS DATE)
AND date_visited <= CAST('08-07-2022' AS DATE)
GROUP BY date_visited
)
SELECT *
FROM t1
WHERE Rank <= 2

SELECT TOP 2 
    DATENAME(DW, date_visited),
    date_visited,
    COUNT(DISTINCT user_id) AS [number of users]
FROM user_streaks
WHERE date_visited >= CAST('08-01-2022' AS DATE)
AND date_visited <= CAST('08-07-2022' AS DATE)
GROUP BY date_visited
ORDER BY [number of users] DESC