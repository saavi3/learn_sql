CREATE TABLE user_activity(date DATE,user_id INT,activity VARCHAR(50));

INSERT INTO user_activity VALUES('2022-02-20',1,'abc');
INSERT INTO user_activity VALUES('2022-02-20',2,'xyz');
INSERT INTO user_activity VALUES('2022-02-22',1,'xyz');
INSERT INTO user_activity VALUES('2022-02-22',3,'klm');
INSERT INTO user_activity VALUES('2022-02-24',1,'abc');
INSERT INTO user_activity VALUES('2022-02-24',2,'abc');
INSERT INTO user_activity VALUES('2022-02-24',3,'abc');


WITH cte AS (
    SELECT *,
        FIRST_VALUE([date]) OVER (PARTITION by user_id ORDER BY [date]) first_activity_date 
    FROM user_activity
),
 cte2 AS (
    SELECT DISTINCT date   
    FROM user_activity
)
SELECT [date], coalesce(unique_user_count, 0)
FROM cte2
LEFT JOIN (
    SELECT first_activity_date, COUNT(DISTINCT user_id) unique_user_count
    FROM cte 
    GROUP BY first_activity_date
) as t3
ON cte2.[date] = t3.first_activity_date




WITH cte AS (
    SELECT user_id,
        min([date]) first_activity_date 
    FROM user_activity
    GROUP BY user_id
),
 cte2 AS (
    SELECT DISTINCT date   
    FROM user_activity
)
SELECT [date], coalesce(unique_user_count, 0)
FROM cte2
LEFT JOIN (
    SELECT first_activity_date, COUNT(DISTINCT user_id) unique_user_count
    FROM cte 
    GROUP BY first_activity_date
) as t3
ON cte2.[date] = t3.first_activity_date