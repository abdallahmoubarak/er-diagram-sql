SELECT students.name
FROM students
WHERE students.id NOT IN (SELECT enrolleds.student_id FROM enrolleds)