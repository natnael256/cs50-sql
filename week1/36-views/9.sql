-- In 9.sql, write a SQL query to find the English title and artist of the print with the highest brightness.

-- SELECT v.english_title, v.artist
-- FROM views v
-- WHERE v.brightness

SELECT v.english_title, v.artist
from views v
WHERE v.brightness == (SELECT MAX(v.brightness) FROM views v)
