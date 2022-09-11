SELECT student_id, COUNT(dept_id)
FROM majorsins
GROUP BY student_id