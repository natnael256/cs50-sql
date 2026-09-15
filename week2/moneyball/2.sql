-- Your general manager (i.e., the person who makes decisions about player contracts) asks you whether the team should trade
-- a current player for Cal Ripken Jr.,
--  a star player who’s likely nearing his retirement. In 2.sql, write a SQL query to find Cal Ripken Jr.’s salary history.

-- Sort by year in descending order.
-- Your query should return a table with two columns, one for year and one for salary.


SELECT s.year, s.salary
FROM salaries s
JOIN players p on s.player_id = p.id
WHERE p.first_name = 'Cal' AND p.last_name = 'Ripken'
ORDER BY s.year DESC
