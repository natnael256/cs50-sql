
-- It’s a bit of a slow day in the office. Though Satchel no longer plays, in 5.sql, write a SQL query to find all teams that Satchel Paige played for.

-- Your query should return a table with a single column, one for the name of the teams.


SELECT t.name
FROM teams t
JOIN performances per ON t.id = per.team_id
WHERE per.player_id = (
    SELECT id FROM players p
    WHERE CONCAT( p.first_name, ' ', p.last_name) = 'Satchel Paige'
)



-- SELECT * FROM players p WHERE CONCAT( p.first_name, ' ', p.last_name) = 'Satchel Paige'
