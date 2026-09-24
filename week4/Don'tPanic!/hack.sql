-- In hack.sql, write a sequence of SQL statements to achieve the following:

-- Alter the password of the website’s administrative account, admin, to instead be “oops!”.
-- Erase any logs of the above password change recorded by the database.
-- Add false data to throw others off your trail. In particular, to frame emily33, 
-- make it only appear—in the user_logs table—as if the admin account has had its password changed 
-- to emily33’s password.

-- SELECT * FROM users

UPDATE users
SET 'password' = '982c0381c279d139fd221fce974916e7'
WHERE username =='admin' and id == 1;

-- SELECT * FROM user_logs;

DELETE FROM user_logs
WHERE id = (SELECT id FROM user_logs ORDER BY id DESC LIMIT 1);

INSERT INTO "user_logs" ('type', 'old_username', 'new_username', 'old_password', 'new_password')
VALUES('update', 'admin', 'admin', '', '44bf025d27eea66336e5c1133c3827f7');
