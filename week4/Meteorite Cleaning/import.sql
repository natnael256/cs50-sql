
--Check for existing table if yes drop.
DROP TABLE IF EXISTS temp;
.import --csv meteorites.csv temp;
DROP TABLE IF EXISTS meteorites;
-- create table meteorites
CREATE TABLE "meteorites"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "class" TEXT,
    "mass" NUMERIC,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC
);


--data clean up on temp that hold the data from csv before inserting it to the meteorites tabel.
UPDATE "temp"
SET "mass" = NULLIF("mass", ''), "year"= NULLIF("year", ''), "lat"= NULLIF("lat", ''), "long"= NULLIF("long", '');



INSERT INTO meteorites( "name","class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", ROUND("mass",2), "discovery", CAST("year" AS INTEGER), ROUND("lat",2), ROUND("long",2)
FROM TEMP t
WHERE
t.nametype != 'Relict'
ORDER BY t.year ASC, t.name ASC;


