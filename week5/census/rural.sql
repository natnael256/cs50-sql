CREATE VIEW "rural" AS
SELECT * FROM census c
WHERE c.locality LIKE '%Rural Municipality';
