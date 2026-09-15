-- In 10.sql, write a SQL query to answer a question of your choice about the prints. The query should
-- Make use of AS to rename a column
-- Involve at least one condition, using WHERE
-- Sort by at least one column, using ORDER BY

SELECT v.english_title as "Prints that start with A"
FROM views v
WHERE v.brightness > (SELECT AVG(v.brightness) FROM views v)
AND Lower(v.english_title) LIKE LOWER('A%')
ORDER BY v.english_title

