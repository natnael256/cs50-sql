
-- *** The Lost Letter ***

-- SELECT s.address_id
-- FROM packages p join scans s on p.id = s.package_id
-- WHERE s.package_id = (
--     SELECT p.id as Package_id
--     FROM addresses a join packages p on a.id = p.from_address_id
--     WHERE a.address = '900 Somerville Avenue'
--     AND p.contents LIKE '%congratulatory%'
-- );

-- use the id form the subquery and using the in key work get the return the addrases.
SELECT * FROM addresses a
WHERE a.id in (
    -- use the package id returned to return teh address_id for both drop and pickup location
    SELECT s.address_id
    FROM packages p join scans s on p.id = s.package_id
    WHERE s.package_id = (
        -- I am using this query to find the package ID based on the given information: the sender’s address and the package contents.
        -- To achieve this, I use a JOIN function to combine the addresses table with the packages table,
        -- allowing me to match the sender’s address with the package contents.
        -- this return the package id
        SELECT p.id as Package_id
        FROM addresses a join packages p on a.id = p.from_address_id
        WHERE a.address = '900 Somerville Avenue'
        AND p.contents LIKE '%congratulatory%'
    )
);


-- *** The Devious Delivery ***

-- Looked up the package ID using the available information.
-- SELECT p.id FROM packages p
-- WHERE p.contents  LIKE '%duck%'
-- AND p.from_address_id is NULL;

--Used it in a subquery to check the scan records using the package ID I obtained.

-- SELECT * FROM scans s
-- WHERE s.package_id = (
--     SELECT p.id FROM packages p
--     WHERE p.contents  LIKE '%duck%'
--     AND p.from_address_id is NULL
-- );

--Combined all the queries.
SELECT * FROM addresses a
WHERE a.id in (
    SELECT s.address_id FROM scans s
    WHERE s.package_id = (
        SELECT p.id FROM packages p
        WHERE p.contents  LIKE '%duck%'
        AND p.from_address_id is NULL
    )
    AND s.action = 'Drop'
);

-- *** The Forgotten Gift ***

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
WHERE d.id = (
    SELECT s.driver_id
    FROM scans s join addresses a on s.address_id = a.id
    where s.package_id = 9523
);

SELECT * FROM drivers d
WHERE d.id = 17;


