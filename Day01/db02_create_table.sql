-- 데이블 생성 쿼리
CREATE TABLE producttbl (
	productname NVARCHAR(20) PRIMARY KEY,
    cost INT NOT NULL,
    makedata DATE,
    company NVARCHAR(20),
    amount INT NOT NULL
);