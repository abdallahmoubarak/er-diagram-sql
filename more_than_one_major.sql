SELECT name, COUNT(*)
FROM departments
WHERE id IN(SELECT dept_id
FROM majorsins)
GROUP BY name
HAVING COUNT(*)>1