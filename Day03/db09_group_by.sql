-- 집계 하수를 사용하기 위해서 / 그룹핑

-- GROUP BY에 작성된 컬럼명만 SELECT에 쓸 수 있음
SELECT userID AS ' 아이디 '
	, AVG(amount) AS '평균 구매 갯수 '
	FROM buytbl
    GROUP BY userID;
    
-- HAVING은 집계함수 등의 결과값을 필터링하기 위해서 사용
SELECT userID
		, SUM(price * amount) AS 'TOTAL'
    FROM buytbl
#    WHERE '합산 >= 1000; 컬럼이 아니고 직계함수들은 WHERE을 쓸 수 없다
    GROUP BY userID
    HAVING SUM(price * amount) >= 1000; # 별명 사용 불가

-- ROllup

SELECT userID
		, SUM(price * amount) AS 'TOTAL'
    FROM buytbl
	GROUP BY userID
    WITH ROLLUP; # 전체 합산 금액
    
    
SELECT SUM(o.합산)
		, SUM(price * amount) AS 'TOTAL'
    FROM buytbl
	GROUP BY userID
    UNION
    