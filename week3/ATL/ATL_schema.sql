-- DROP TABLE "passengers";
-- DROP TABLE "check-ins";
--DROP TABLE "airliens";
CREATE TABLE "passengers"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);


CREATE TABLE "check-ins"(
    "id" INTEGER,
    "passenger_id" INTEGER,
    "checked_in_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "airliens"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK(concourse IN('a', 'b', 'C', 'd', 'e', 'f', 't' )),
    "airport_code" TEXT NULL NULL,
    PRIMARY KEY("id", "name")
);


CREATE TABLE "flights"(
    "id" INTEGER,
    "flight_number" NOT NULL UNIQUE,
    "airline_name" NOT NULL,
    "departure_airport" TEXT,
    "arrival_airport" Text,
    "departure_date" NUMERIC NOT NULL,
    "arrival_date" NUMERIC NOT NULL,
    PRIMARY KEY('id'),
    FOREIGN KEY("airline_name") REFERENCES "airlines" ("name")
);



