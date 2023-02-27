-- 그냥 테이블 접근
SELECT *
	FROM memberTBL;
    

-- 뷰생성
CREATE VIEW uv_memberTBL
	AS
     SELECT memberName, memberAdress
      FROM memberTBL;
    
-- 뷰로 조
SELECT *
	FROM uv_membertbl;