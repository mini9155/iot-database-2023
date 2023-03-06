/* BookRentalShop 연습 */

SELECT *
	FROM membertbl;
    

-- 서브쿼리 - 성능이 떨어지는 영향(안좋음)
SELECT b.Author AS '저자' -- 1
	 , b.Division AS '장르' -- 2
     , (SELECT Names FROM divtbl WHERE Division = b.Division ) AS '장르'
     , b.Names AS '책제목' -- 3
     , b.ISBN 
     , b.Price AS '금액'
	FROM bookstbl AS b
    ORDER BY 3; # 디폴트가 ASC, 책제목, 3=> b.Names 대신 쓸 수 있음


-- 조인
SELECT b.Author AS '저자'
  -- , b.Division
     , d.Names AS '장르'
     , b.Names AS '책제목'
     , b.ISBN
     , b.Price AS '금액'
	FROM bookstbl AS b
    INNER JOIN divtbl AS d # JOIN은 인덱스끼리 사용한다,키끼리 사용하기 때문에 빠름
		ON b.Division = d.Division
	ORDER BY b.Names;
    
-- 서브쿼리 - 장르로 그룹핑
SELECT (SELECT Names
			FROM divtbl
            WHERE Division = bb.Division) AS '장르'
		, bb.총합
	FROM (
		   SELECT b.Division
		 , SUM(b.Price) AS '총합'
		FROM bookstbl AS b
    GROUP BY b.Division
		 ) AS bb;
         

-- 조인
SELECT m.Names AS '이름'
	 , m.Addr AS '주소'
     , m.mobile AS '연락처'
     , r.rentalDate AS '대여일자'
     , r.returnDate AS '반납일자'
     , b.Names AS '책제목'
     , b.Division AS '장르'
     , b.price AS '금액'
	FROM membertbl AS m
	INNER JOIN rentaltbl AS r
		ON 	m.memberIdx = r.memberIdx
	INNER JOIN bookstbl AS b
		ON r.bookIdx = b.bookIdx