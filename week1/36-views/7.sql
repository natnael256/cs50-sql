-- In 7.sql, write a SQL query to list the English titles of the 5 brightest prints by Hiroshige, from most to least bright.
--  Compare them to this list on Wikipedia to see if your results match the print’s aesthetics.


SELECT v.english_title
--SELECT v.english_title,v.brightness
FROM views v
WHERE v.artist = 'Hiroshige'
ORDER BY v.brightness DESC
LIMIt 5
