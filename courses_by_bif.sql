SELECT course_name
FROM enrolleds, majorsIns, courses, students
WHERE students.id = majorsIns.student_id
AND majorsIns.dept_name = 'BIF'
AND courses.name = enrolleds.course_name;