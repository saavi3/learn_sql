
DROP TABLE IF EXISTS number_pairs
CREATE TABLE number_pairs
(   A INT, 
    B INT
);

INSERT INTO number_pairs VALUES(1,2);
INSERT INTO number_pairs VALUES(3,2);
INSERT INTO number_pairs VALUES(2,4);
INSERT INTO number_pairs VALUES(2,1);
INSERT INTO number_pairs VALUES(5,6);
INSERT INTO number_pairs VALUES(4,2);



WITH cte AS (
    SELECT t1.* 
    FROM number_pairs t1
    JOIN number_pairs t2
    ON t1.a = t2.b
    AND t1.b = t2.a
)
SELECT *
FROM number_pairs t3
LEFT JOIN (SELECT * FROM cte WHERE A < B) t4
ON t3.A = t4.A
    AND t3.B = t4.B
WHERE t4.A IS NULL

SELECT * 
FROM number_pairs t1
LEFT JOIN number_pairs t2
ON t1.a = t2.b
AND t1.b = t2.a
WHERE (t1.a - t2.a) < 0 OR t2.a IS NULL

SELECT * 
FROM number_pairs