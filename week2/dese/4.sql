SELECT s.city, COUNT(s.id) as count
FROM schools s
WHERE s.type LIKE '%Public School%'
AND s.name NOT LIKE '%non-op%'
GROUP BY s.city
ORDER BY count DESC, s.city ASC
LIMIT 10
