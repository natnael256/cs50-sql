-- June Vacancies
-- In june_vacancies.sql, write a SQL statement to create a view named june_vacancies.
-- This view should contain all listings and the number of days in June of 2023 that they remained vacant.
-- Ensure the view contains the following columns:

-- id, which is the id of the listing from the listings table.
-- property_type, from the listings table.
-- host_name, from the listings table.
-- days_vacant, which is the number of days in June of 2023, that the given listing was marked as available.


CREATE VIEW "june_vacancies" AS
SELECT a.listing_id, l.property_type, l.host_name, COUNT(a.date) AS days_vecant
FROM availabilities a
JOIN listings l ON a.listing_id = l.id
WHERE a.date LIKE '2023-06%'
AND a.available = 'TRUE'
GROUP BY a.listing_id
ORDER BY a.date LIMIT 15;


-- SELECT * FROM availabilities a
-- WHERE a.listing_id = '18199963'
-- and a.date LIKE '2023-06%'

