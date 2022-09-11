SELECT COUNT(*) 
FROM majorsins
WHERE majorsins.dept_id = (SELECT id FROM departments WHERE name = 'CS');