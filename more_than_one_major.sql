SELECT dept_id, count(*)
FROM majorsins
GROUP BY dept_id
HAVING count(*) > 1