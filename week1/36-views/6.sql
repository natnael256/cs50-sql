-- In 6.sql, write a SQL query to find the average entropy of prints by Hiroshige, rounded to two decimal places. Call the resulting column “Hiroshige Average Entropy”.

SELECT ROUND(AVG(v.entropy), 2) as "Hiroshig Average Entropu"
FROM views v
WHERE v.artist = 'Hiroshige';


