
DROP TABLE "users";
CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE,
    "password" TEXT,
    PRIMARY KEY ("id")
);

DROP TABLE "schools";
CREATE TABLE "schools"(
    "id" INTEGER,
    "school_name" TEXT NOT NULL,
    "school_type" TEXT NOT NULL,
    "school_location" TEXT NOT NULL,
    "school_founded" INTEGER NOT NULL,
    PRIMARY KEY ("ID"),
    UNIQUE("school_name", "school_location")
);
DROP TABLE "companies";
CREATE TABLE "companies"(
    "id" INTEGER,
    "companie_name" TEXT NOT NULL,
    "companie_industry" TEXT NOT NULL,
    "companit_location" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

-- ------------------RELATIONSHIPS---------------------------
--user to user (like friends)
CREATE TABLE "user_connections"(
    "id" INTEGER,
    "user_id" INTEGER,
    "friend_id" INTEGER,
    PRIMARY KEY ("user_id", "id", "friend_id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("friend_id") REFERENCES "user"("id"),
    CHECK("user_id" < "friend_id")

);
-- user to schools
CREATE TABLE "user_schools"(
    "id" INTEGER,
    "user_id"  INTEGER,
    "school_id" INTEGER,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC NOT NULL,
    "degree" TEXT,
    PRIMARY KEY ("user_id",  "school_id", "id", "start_date")
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN kEY ("school_id") REFERENCES "schools"("id"),
    CHECK ("end_date" IS NULL OR "end_date" > "start_date")
);
-- user to company
CREATE TABLE "user_companies"(
    "id" INTEGER,
    "user_id" INTEGER,
    "companie_id" INTEGER,
    "title" TEXT NOT NULL,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC NOT NULL,
    PRIMARY KEY ("id", "user_id", "companie_id" "start_date")
    FOREIGN KEY ("user_id") REFERENCES "users" ("id"),
    FOREIGN KEY ("companie_id") REFERENCES "companies"("id"),
    CHECK ("end_date" IS NULL OR "end_date" > "start_date")
)
