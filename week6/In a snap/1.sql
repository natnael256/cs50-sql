-- EXPLAIN QUERY PLAN
SELECT username
FROM users
WHERE last_login_date > '2024-01-01';

-- Before index
-- Run Time: real 0.005167 user 0.001612 sys 0.002192

-- After index
-- Run Time: real 0.004946 user 0.000970 sys 0.001881

-- CREATE INDEX IF NOT EXISTS search_users_by_last_login ON users(
--     username, last_login_date)
--     WHERE last_login_date > '2024-01-01';
