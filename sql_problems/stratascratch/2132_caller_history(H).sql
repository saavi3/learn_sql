/*
	Question      - 2132. Caller History
	Question Link - https://platform.stratascratch.com/coding/2132-caller-history?code_type=5&utm_source=youtube&utm_medium=click&utm_campaign=YT+window+function+in+amazon+question
*/

DROP TABLE IF EXISTS caller_history;

CREATE TABLE caller_history (
    caller_id INT,
    recipient_id INT,
    date_called DATETIME
);

INSERT INTO caller_history (caller_id, recipient_id, date_called)
VALUES
    (1, 2, '2022-01-01 09:00:00'),
    (1, 3, '2022-01-01 17:00:00'),
    (1, 4, '2022-01-01 23:00:00'),
    (2, 5, '2022-07-05 09:00:00'),
    (2, 5, '2022-07-05 17:00:00'),
    (2, 3, '2022-07-05 23:00:00'),
    (2, 5, '2022-07-06 17:00:00'),
    (2, 3, '2022-08-01 09:00:00'),
    (2, 3, '2022-08-01 17:00:00'),
    (2, 4, '2022-08-02 09:00:00'),
    (2, 5, '2022-08-02 10:00:00'),
    (2, 4, '2022-08-02 11:00:00');

SELECT * 
FROM caller_history;

WITH t AS (
SELECT caller_id, recipient_id, 
	date_called,
	FIRST_VALUE(recipient_id) OVER (PARTITION BY caller_id, CAST(date_called AS DATE) ORDER BY date_called) AS first_recipient ,
	FIRST_VALUE(recipient_id) OVER (PARTITION BY caller_id, CAST(date_called AS DATE) ORDER BY date_called DESC) AS last_recipient
FROM caller_history)
SELECT DISTINCT caller_id, recipient_id, CAST(date_called AS DATE) date_called
FROM t
WHERE first_recipient = last_recipient
AND recipient_id = last_recipient




