/*
	Question      - Third Unique Song
	Question Link - https://www.interviewquery.com/questions/third-unique-song
*/


DROP TABLE IF EXISTS users;

-- Create the "users" table
CREATE TABLE users (
  id INTEGER,
  name VARCHAR(20)
);

DROP TABLE IF EXISTS song_plays;

-- Create the "song_plays" table
CREATE TABLE song_plays (
  user_id INTEGER,
  song_name VARCHAR(50),
  date_played DATETIME,
);

INSERT INTO users (id, name) VALUES
  (1, 'James Cain'),
  (2, 'Thomas Miller'),
  (3, 'Courtney Stevenson'),
  (4, 'Tammy James'),
  (5, 'Winston Dunn');



-- Inserting song play records for user_id 1
INSERT INTO song_plays (user_id, song_name, date_played) VALUES
  (1, 'Patience', '2021-10-06 00:00:00'),
  (1, 'Paradise City', '2021-10-06 00:05:00'),
  (1, 'November Rain', '2021-10-06 00:10:00'),
  (1, 'November Rain', '2021-10-06 00:15:00');

-- Inserting song play records for user_id 2
INSERT INTO song_plays (user_id, song_name, date_played) VALUES
  (2, 'Paradise City', '2021-10-06 00:15:00'),
  (2, 'November Rain', '2021-10-06 00:20:00'),
  (2, 'November Rain', '2021-10-06 00:25:00'),
  (2, 'November Rain', '2021-10-06 00:35:00'),
  (2, 'Welcome To The Jungle', '2021-10-06 00:30:00'),
  (2, 'Patience', '2021-10-06 00:35:00');

-- Inserting song play records for user_id 3
INSERT INTO song_plays (user_id, song_name, date_played) VALUES
  (3, 'Patience', '2021-10-06 00:35:00');


WITH t1 AS (
  SELECT user_id, song_name, MIN(date_played) min_date_played
  FROM song_plays
  GROUP BY user_id, song_name
), 
t2 AS (
  SELECT t.user_id,
    t.song_name,
    min_date_played AS date_played, 
    RANK() OVER(PARTITION BY t.user_id ORDER BY t.min_date_played) song_rank
  FROM t1 AS t
)
SELECT name, 
    song_name,
    date_played
FROM users AS u 
LEFT JOIN (SELECT user_id, song_name, date_played FROM t2 WHERE song_rank =3) t
ON t.user_id = u.id

