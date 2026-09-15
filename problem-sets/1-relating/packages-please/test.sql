-- SELECT a.id, a.address
-- FROM addresses a
-- WHERE a.address in ('109 Tileston Street',
--                     '728 Maple Place');
-- get the id for both address ( 4983 sender, 9873 for tileston street)




-- SELECT * FROM packages p
-- WHERE p.from_address_id in (
--     SELECT a.id
--     FROM addresses a
--     WHERE a.address in ('109 Tileston Street'
--     )
-- );

-- package id is 9523 and content is Flowers

-- SELECT a.address, s.action, s.timestamp, s.driver_id
-- FROM scans s join addresses a on s.address_id = a.id
-- where s.package_id = 9523;

--package is picked up by driver_id 17


SELECT * FROM drivers d
WHERE d.id = 17;
