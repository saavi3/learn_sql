/*
	Question      - Employee Bonus
	Question Link - https://leetcode.com/problems/employee-bonus/
*/

SELECT e.name,
    b.bonus AS bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL

SELECT e.name,
    b.bonus AS bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b.empId
WHERE iFNULL(b.bonus,0) < 1000 