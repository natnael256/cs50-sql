-- In 8.sql, write a SQL query to list the English titles of the 5 prints with the least contrast by Hokusai, from least to highest contrast.
-- Compare them to this list on Wikipedia to see if your results match the print’s aesthetics.


SELECT v.english_title
FROM views v
WHERE v.artist = 'Hokusai'
ORDER BY v.contrast
LIMIT 5

