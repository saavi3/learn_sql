DROP TABLE IF EXISTS student

CREATE TABLE student (
    student_id INT,
    student_name NVARCHAR(255)
);


DROP TABLE IF EXISTS gpa_history

CREATE TABLE gpa_history (
    student_id INT,
    class_id INT,
    school_year INT,
    gpa DECIMAL(4, 2),
    is_required BIT,

);

INSERT INTO Student (student_id, student_name)
VALUES
    (1, 'John Smith'),
    (2, 'Jane Doe'),
    (3, 'Michael Johnson')


INSERT INTO gpa_history (student_id, class_id, school_year, gpa, is_required)
VALUES
    (1, 101, 2022, 3.75, 1),
    (1, 102, 2022, 3.90, 1),
    (1, 103, 2023, 3.60, 0),
    (1, 101, 2023, 3.75, 1),
    (1, 102, 2023, 3.90, 1),
    (1, 103, 2024, 3.85, 1),
    (2, 101, 2022, 3.40, 1),
    (3, 102, 2022, 3.85, 1),
    (2, 103, 2023, 3.70, 0),
    (2, 101, 2023, 3.90, 1),
    (3, 102, 2023, 3.85, 1),
    (2, 103, 2024, 3.70, 1)
  
WITH t1 AS (  
    SELECT student_id, 
        school_year, 
        AVG(gpa) avg_gpa
    FROM gpa_history
    WHERE is_required = 1
    GROUP BY student_id, school_year
),
t2 AS (
    SELECT t1.*, 
        DENSE_RANK() OVER (PARTITION BY school_year ORDER BY avg_gpa DESC) rank
    FROM t1
)
SELECT COALESCE(s.student_name, 'GRADUATE'), rank,
    t.school_year, 
    t.avg_gpa
FROM t2 t
LEFT JOIN Student s
ON t.student_id =s.student_id
--WHERE rank <= 2