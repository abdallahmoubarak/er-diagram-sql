SELECT course_name
FROM enrolleds, majorsins, courses, students
WHERE students.id = majorsins.student_id
AND majorsins.dept_name = 'BIF'
AND courses.name = enrolleds.course_crn;