/*
LEAD(return_value ,offset ,[default]) 
OVER (
    [PARTITION BY partition_expression, ... ]
    ORDER BY sort_expression [ASC | DESC], ...
)

return_value
The return value of the following row based on a specified offset. 
The return value must evaluate to a single value and cannot be another window function.

offset
offset is the number of rows forward from the current row from which to access data. 
The offset can be an expression, subquery, or column that evaluates to a positive integer.

The default value of offset is 1 if you don’t specify it explicitly.

 default
The function returns default if offset goes beyond the scope of the partition. If not specified, it defaults to NULL.

 PARTITION BY clause
The PARTITION BY clause distributes rows of the result set into partitions to which the LEAD() function is applied.

If you do not specify the PARTITION BY clause, the function treats the whole result set as a single partition.

 ORDER BY clause
The ORDER BY clause specify logical order of the rows in each partition to which the LEAD() function is applied.
*/

DROP TABLE IF EXISTS Logs;

CREATE TABLE Logs (
    id INT PRIMARY KEY,
    num INT NOT NULL
);

INSERT INTO Logs (id, num) VALUES (1, 1);
INSERT INTO Logs (id, num) VALUES (2, 1);
INSERT INTO Logs (id, num) VALUES (3, 1);
INSERT INTO Logs (id, num) VALUES (4, 2);
INSERT INTO Logs (id, num) VALUES (5, 1);
INSERT INTO Logs (id, num) VALUES (6, 2);
INSERT INTO Logs (id, num) VALUES (7, 2);

SELECT *, 
    LEAD(num) OVER (ORDER BY id),
    LEAD(num, 2) OVER (ORDER BY id)  
FROM Logs 

SELECT *, 
    LEAD(num) OVER (PARTITION BY num ORDER BY id)  
FROM Logs 