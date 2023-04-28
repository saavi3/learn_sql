/*
	Question      - 2nd Highest Salary
	Question Link - https://www.interviewquery.com/questions/2nd-highest-salary
*/

DROP TABLE IF EXISTS employees

-- Create 'employees' table
CREATE TABLE employees (
    id INTEGER NOT NULL,
    first_name VARCHAR(50)  NULL,
    last_name VARCHAR(50)  NULL,
    salary INTEGER  NULL,
    department_id INTEGER  NULL,
);

DROP TABLE IF EXISTS departments

-- Create 'departments' table
CREATE TABLE departments (
    id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL
);

-- Insert sample data into 'departments' table
INSERT INTO departments (id, name)
VALUES 
    (1, 'Engineering'),
    (2, 'Marketing'),
    (3, 'Human Resources'),
    (4, 'Finance'),
    (5, 'IT');

-- Insert sample data into 'employees' table
INSERT INTO employees (id, first_name, last_name, salary, department_id)
VALUES 
    (1, 'John', 'Doe', 50000, 1),
    (2, 'Jane', 'Smith', 60000, 2),
    (3, 'Bob', 'Johnson', 70000, 1),
    (4, 'Alice', 'Williams', 55000, 3),
    (5, 'Tom', 'Brown', 65000, 4),
    (6, 'Lisa', 'Jones', 75000, 2),
    (7, 'Mike', 'Davis', 80000, 5),
    (8, 'Karen', 'Miller', 45000, 1),
	(9, 'Anne', 'Brown', 45000, NULL),
	(10, 'Will', 'Smith', NULL, 5),
	(11, 'Nem', 'Silva', 70000, 1);

WITH t as (
SELECT id, 
	department_id , 
	dense_rank() over (partition by department_id order by salary desc) rnk_salary
FROM employees)
select id, department_id  
from t 
where rnk_salary = 1

WITH t AS (
SELECT TOP 2 salary
FROM employees e
INNER JOIN departments d
ON e.department_id = d.id
WHERE D.name = 'Engineering'
GROUP BY salary
ORDER BY salary DESC)
SELECT TOP 1 *
FROM t
ORDER BY salary ASC
