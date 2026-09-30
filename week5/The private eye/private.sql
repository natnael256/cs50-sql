-- SELECT * FROM sentences
-- WHERE id IN (14,114,618,630,932,2230,2346,3041);

CREATE VIEW "message" AS
WITH part (id, start_point, len) as (

    VALUES
      (14,   98, 4),
      (114,  3, 5),
      (618,  72,  9),
      (630,  7, 3),
      (932, 12,  5),
      (2230, 50, 7),
      (2346, 44, 10),
      (3041, 14, 5)

)
SELECT SUBSTRING(s.sentence, p.start_point, p.len ) as phrase
FROM sentences s
JOIN part p ON s.id = p.id
