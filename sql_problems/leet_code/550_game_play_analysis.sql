/*
	Question      - 550. Game Play Analysis IV
	Question Link - https://leetcode.com/problems/game-play-analysis-iv/
*/
DROP TABLE IF EXISTS Activity

CREATE TABLE Activity (
    player_id int,
    device_id int,
    event_date date,
    games_played int
);

INSERT INTO Activity (player_id, device_id, event_date, games_played)
VALUES
    (1, 101, '2023-08-01', 5),
    (1, 101, '2023-08-02', 3),
    (2, 102, '2023-08-03', 7),
    (2, 102, '2023-08-10', 4),
    (3, 103, '2023-08-01', 2),
    (3, 103, '2023-08-05', 6),
    (3, 103, '2023-08-06', 8),
    (4, 103, '2023-08-05', 6),
    (4, 123, '2023-08-06', 8);

SELECT *
FROM Activity


WITH t1 AS (
	SELECT player_id, DATEADD(DAY, 1, MIN(event_date)) AS nextday_to_first_event_date
	FROM Activity
	GROUP BY player_id
),
t2 AS (
	SELECT CAST(COUNT(DISTINCT a.player_id) AS DECIMAL(10,2)) AS palyer_count
	FROM Activity a
    INNER JOIN t1 
    ON a.player_id = t1.player_id
    AND a.event_date = t1.nextday_to_first_event_date
)
SELECT CAST(
        palyer_count/ 
        (SELECT COUNT(DISTINCT player_id) FROM Activity) AS DECIMAL(10,2)) 
FROM t2


