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