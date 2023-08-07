/*
	Question      - Empty Neighborhoods
	Question Link - https://www.interviewquery.com/questions/empty-neighborhoods
*/

--Solution1
SELECT DISTINCT n.name
FROM neighborhoods AS n
LEFT JOIN users AS u
ON n.id = u.neighborhood_id
WHERE u.neighborhood_id IS NULL


--Solution2
SELECT n.name
FROM neighborhoods AS n
LEFT JOIN users AS u
ON n.id = u.neighborhood_id
GROUP BY n.name
HAVING COUNT(u.id) = 0