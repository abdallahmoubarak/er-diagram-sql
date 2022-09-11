SELECT *
FROM courses 
WHERE courses.crn IN (
        SELECT majorsIns.student_id 
        FROM majorsIns
        WHERE majorsIns.dept_id = (SELECT id FROM departments WHERE name='BIF')
    )