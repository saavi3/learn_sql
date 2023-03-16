/*
	Question      - 262. Trips and Users
	Question Link - https://leetcode.com/problems/trips-and-users/description/
*/

DROP TABLE IF EXISTS trips;

CREATE TABLE trips (
  id INT PRIMARY KEY,
  client_id INT,
  driver_id INT,
  city_id INT,
  status VARCHAR(20),
  request_at DATE
);

INSERT INTO trips (id, client_id, driver_id, city_id, status, request_at) VALUES
  (1, 1, 10, 1, 'completed', '2013-10-01'),
  (2, 2, 11, 1, 'cancelled_by_driver', '2013-10-01'),
  (3, 3, 12, 6, 'completed', '2013-10-01'),
  (4, 4, 13, 6, 'cancelled_by_client', '2013-10-01'),
  (5, 1, 10, 1, 'completed', '2013-10-02'),
  (6, 2, 11, 6, 'completed', '2013-10-02'),
  (7, 3, 12, 6, 'completed', '2013-10-02'),
  (8, 2, 12, 12, 'completed', '2013-10-03'),
  (9, 3, 10, 12, 'completed', '2013-10-03'),
  (10, 4, 13, 12, 'cancelled_by_driver', '2013-10-03');

  DROP TABLE IF EXISTS users;

  CREATE TABLE users (
  users_id INT PRIMARY KEY,
  banned VARCHAR(3),
  role VARCHAR(10)
);

INSERT INTO users (users_id, banned, role) VALUES
  (1, 'No', 'client'),
  (2, 'Yes', 'client'),
  (3, 'No', 'client'),
  (4, 'No', 'client'),
  (10, 'No', 'driver'),
  (11, 'No', 'driver'),
  (12, 'No', 'driver'),
  (13, 'No', 'driver');

--Method1
SELECT request_at, 
       CAST(SUM(CASE 
            WHEN status LIKE 'cancelled%' THEN 1.0
            ELSE 0.0
            END) / NULLIF(COUNT(id),0) AS DECIMAL(10,2))
FROM trips t
INNER JOIN users c ON t.client_id = c.users_id
INNER JOIN users d ON t.driver_id = d.users_id
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
AND c.banned = 'No'
AND d.banned = 'No'
GROUP BY request_at;
