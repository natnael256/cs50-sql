CREATE VIEW "by_district" as
SELECT c.district, SUM(c.families) as families, SUM(c.households) AS households, SUM(c.population) AS population, SUM(c.male) AS male , SUM(c.female) AS female
FROM census c
GROUP BY c.district


