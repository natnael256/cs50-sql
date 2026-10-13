-- EXPLAIN QUERY PLAN
SELECT "id", "name"
FROM "students"
WHERE "id" IN (
    SELECT "student_id"
    FROM "enrollments"
    WHERE "course_id" = (
        SELECT "id"
        FROM "courses"
        WHERE "courses"."department" = 'Computer Science'
        AND "courses"."number" = 50
        AND "courses"."semester" = 'Fall 2023'
    )
);
-- ------------------------------------------------------------
-- Baseline (no indexes)
--   Plan: SCAN enrollments, SCAN courses
--   Run Time: real 0.231954  user 0.218551  sys 0.011010
-- ------------------------------------------------------------

-- ------------------------------------------------------------
-- Step 1: index enrollments on course_id
-- ------------------------------------------------------------
CREATE INDEX IF NOT EXISTS "by_course_id"
ON "enrollments" ("course_id");

--   Plan: SEARCH enrollments USING INDEX by_course_id
--   Run Time: real 0.001862  user 0.001298  sys 0.000
--   Result: ~125x faster

-- ------------------------------------------------------------
-- Step 2: index courses on semester
-- ------------------------------------------------------------
CREATE INDEX IF NOT EXISTS "by_semester"
ON "courses" ("semester", "title");

--   Run Time: real 0.000661  user 0.000186  sys 0.000479
--   Note: sub-millisecond difference, likely within run-to-run
--   noise. Only narrows by semester; department and number are
--   still checked row by row.
