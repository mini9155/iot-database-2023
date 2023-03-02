INSERT INTO proctbl (total_name)
VALUE('BBK');


SELECT * FROM proctbl;

DELETE FROM proctbl WHERE ID = 3;

DELETE FROM proctbl WHERE id = 1;

-- 완전 초기화
TRUNCATE proctbl;