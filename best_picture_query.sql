SELECT name,earnings_rank
FROM movies
WHERE id IN (SELECT movie_id
             FROM oscars
             WHERE type='Best-Picture')
ORDER BY earnings_rank
LIMIT 1