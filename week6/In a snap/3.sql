-- CREATE INDEX "search_messages_by_from_user_id"
-- ON "messages"("from_user_id");




-- EXPLAIN QUERY PLAN
SELECT m.to_user_id FROM messages m
WHERE from_user_id = (
    SELECT id FROM users
    WHERE username = 'creativewisdom377'
)
GROUP BY m.to_user_id
ORDER BY COUNT(*) DESC
LIMIT 3;


