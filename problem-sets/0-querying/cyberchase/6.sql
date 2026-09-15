/*
SELECT e.title FROM episodes e
WHERE e.episode_in_season = 6
and e.air_date between '2007-01-01' and '2008-12-31'
*/
SELECT e.title FROM episodes e
WHERE e.season = '6'
and e.air_date like '2007%'


