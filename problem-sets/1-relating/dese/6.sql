SELECT s.name
FROM schools s
JOIN graduation_rates gs on s.id = gs.school_id
WHERE gs.graduated = 100
