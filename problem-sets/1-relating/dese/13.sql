-- Which cities have at least 3 school districts, and what is their average per-pupil expenditure, highest to lowest

-- City| count(districts) | avg (per-pupil)


SELECT s.city , COUNT(DISTINCT s.district_id) as "district count", ROUND(AVG( DISTINCT e.per_pupil_expenditure), 2) as "Average per-pupil"
FROM schools s
JOIN districts d on s.district_id = d.id
JOIN expenditures e on d.id = e.district_id
GROUP BY s.city
HAVING COUNT(DISTINCT s.district_id) >= 3
ORDER BY e.per_pupil_expenditure DESC
