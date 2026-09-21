CREATE TABLE "customers"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "order_id" TEXT NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("order_id") REFERENCES "orders"("id")
);

CREATE TABLE "orders"(
    "id" INTEGER,
    "customer_id" INTEGER,
    "donut_id" INTEGER,
    PRIMARY KEY ("id", "customer_id"),
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT,
    "gluten_free" TEXT CHECK("gluten_free" IN ('yes' ,'no')),
    "price" REAL NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "ingredients"(
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "amount" INTEGER NOT NULL,
    "price_per_unit" REAL NOT NULL,
    PRIMARY KEY ("id")

);

CREATE TABLE "donut_ingredients"(
    "ingredient_id" INTEGER,
    "donut_id" INTEGER,
    PRIMARY KEY ("ingredient_id" , "donut_id")
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id")
);

