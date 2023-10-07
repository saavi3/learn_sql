/*
	Question      -  Managers with at Least 5 Direct Reports
	Question Link - https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/
*/

DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    id int PRIMARY KEY,
    name varchar(50),
    department varchar(50),
    managerId int
);

INSERT INTO Employee (id, name, department, managerId)
VALUES
    (101, 'John', 'A', NULL),
    (102, 'Dan', 'A', 101),
    (103, 'James', 'A', 101),
    (104, 'Amy', 'A', 101),
    (105, 'Anne', 'A', 101),
    (106, 'Ron', 'B', 101),
    (107, 'John2', 'A', NULL),
    (108, 'Dan', 'A', 100),
    (109, 'James', 'A', 100),
    (110, 'Amy', 'A', 107),
    (111, 'Anne', 'A', 107),
    (112, 'Ron', 'B', 107);





WITH t1 AS (
  SELECT managerId, 
    COUNT(id) reporting_count
  FROM Employee
  WHERE managerId IS NOT NULL
  GROUP BY managerId
  HAVING COUNT(id) >= 5
)
SELECT e.name AS name
FROM t1 AS t
LEFT JOIN Employee AS e
ON t.managerId = e.id
WHERE e.name IS NOT NULL


SELECT *
--e.name 
FROM Employee e
WHERE 
    (SELECT *
     FROM Employee 
     WHERE managerId = e.id) >= 5

SELECT e.name, COUNT(e.id)
FROM Employee e
inner join Employee e2
on e2.managerId = e.id
group by e.name

SELECT e.name FROM Employee e
WHERE (SELECT COUNT(managerId) FROM Employee WHERE managerId = e.id) >= 5