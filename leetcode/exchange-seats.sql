
-- Soluton 1, 251 ms

SELECT 
    id,
    CASE WHEN id % 2 != 0 AND id < (SELECT MAX(id) FROM seat) THEN lead_student
         WHEN id % 2 != 0 AND id = (SELECT MAX(id) FROM seat) THEN student
         ELSE lag_student
    END student
FROM (
    SELECT 
        id,
        LAG(student) OVER (ORDER BY id) AS lag_student,
        LEAD(student) OVER (ORDER BY id) AS lead_student,
        student
    FROM 
        seat
) base
;

-- Solution 2, 601 ms
SELECT
    id,
    CASE WHEN MOD(id, 2) = 0 THEN prev_student 
         WHEN next_id IS NOT NULL THEN next_student
         ELSE student
    END AS student
FROM (
    SELECT
        id,
        student,
        LAG(student, 1) OVER(ORDER BY id ASC) prev_student,
        LEAD(student, 1) OVER(ORDER BY id ASC) next_student,
        LEAD(id, 1) OVER(ORDER BY id ASC) next_id
    FROM
        Seat
) T
;

-- Solution 3, 590ms

SELECT
    CASE WHEN MOD(id, 2) = 0 THEN id - 1
         WHEN id < (SELECT MAX(id) FROM Seat) THEN id + 1
         ELSE id
    END AS id,
    student
FROM
     Seat
ORDER BY 
    id ASC
;