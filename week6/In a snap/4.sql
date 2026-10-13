-- CREATE INDEX "search_messages_by_to_user_id"
-- ON "messages"("to_user_id");


-- The app needs to send users a summary of their engagement. Find the username of the most popular user, defined as
-- the user who has had the most messages sent to them.

-- Ensure your query uses the search_messages_by_to_user_id index, which is defined as follows:

SELECT username FROM
users
WHERE  id = (
    SELECT  m.to_user_id
    FROM messages m
    GROUP BY m.to_user_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- +----------------------+
-- |       username       |
-- +----------------------+
-- | charminghappiness484 |
-- +----------------------+
-- Run Time: real 0.020463 user 0.019834 sys 0.000479


-- sqlite> .read 4.sql
-- QUERY PLAN
-- |--SEARCH users USING INTEGER PRIMARY KEY (rowid=?)
-- `--SCALAR SUBQUERY 1
--    |--SCAN m USING COVERING INDEX search_messages_by_to_user_id
--    `--USE TEMP B-TREE FOR ORDER BY
-- Run Time: real 0.000169 user 0.000171 sys 0.000000
-- sqlite>
