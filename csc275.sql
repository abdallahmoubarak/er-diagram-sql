SELECT COUNT(*) as num_students
FROM enrolleds
WHERE course_crn = "CSC275" AND student_id IN (
    SELECT id 
    FROM students
    WHERE id IN (
        SELECT student_id
        FROM majorsins
        WHERE dept_id = (
            SELECT id
            FROM departments
            WHERE name = "CS"
        )
    )
)