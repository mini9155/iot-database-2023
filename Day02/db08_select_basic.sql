-- 메모장 --
/*
USE homeplus; (데이터베이스 선택)
SELECT ALL x 이러면 혼남!
데이터베이스는 '만 쓴다, "쓰면 에러
*/
-- 한 문장 끝일 때는 세미클론으로 마무리
-- 8,9번 같은 의미
SELECT * FROM indextbl;
SELECT * FROM homeplus.indextbl;

-- 필요한 컬럼만 가져오겠다
SELECT first_name, last_name FROM indextbl;

-- sqldb alter
USE sqldb;

-- 조건절 검색 (,나 조건문 앞에서 엔터를 쳐서 줄 정렬)
SELECT userID
	, name
    , birthYear
    , height
    FROM usertbl
    WHERE name = '김경호';

-- 지금은 homeplus 데이터베이스라 실행해도 못 가져옴
SELECT * FROM employees.titles; -- 다른 DB의 테이블에서 데이터를 가져올려면

-- 관계연산자 - 필터링
SELECT	*
	FROM usertbl
	WHERE birthYear >= 1970 # 1970년 이후로 태어난 사람
    AND height >= 182;
    
-- 사이의 값을 조회 (문장이 전부 다 끝났을 경우만 세미클론을 붙임)
SELECT *
	FROM usertbl
    WHERE height >= 180
    AND height <= 183;
    
    
SELECT *
	FROM usertbl
    WHERE height BETWEEN 180 AND 183;
    
-- IN 연산자 (AND 나 OR 쓰는 건 최소화)
SELECT *
	FROM usertbl
    WHERE addr IN ('경남' ,'경북', '전남');
    
-- 문자열 검색 -- (%가 앞에 붙으면 ~로 시작하는 사람), 김__ 김 포함 이름이 3글자인 사람만 찾음
SELECT *
	FROM usertbl
    WHERE name LIKE '김__';
    
-- 서브쿼리(subquery)
SELECT name
	, height
    FROM usertbl
    WHERE height > (SELECT height FROM usertbl WHERE name = '김경호'); # 김경호 보다 키가 큰 사람들을 조회해주세요!!

-- 정렬 ORDER BY : default ASC[ending] 안 적어도 오름차순
-- 내림차순 DESC 내림차순

SELECT *
    FROM usertbl
    WHERE birthyear > 1069
    ORDER BY height DESC, name ASC; # 작은 순으로 정렬함

-- 중복제거
SELECT DISTINCT addr
    FROM usertbl;
    
    
-- LIMIT 갯수 제한
USE homeplus;

SELECT * FROM indextbl
LIMIT 5; # 5개만 출력

-- 조회하면서 새로운 테이블 생성
-- PK / FK 제약조건은 복사 안됨
-- 일부 칼럼(열)만 복사 테이블 생성 가능
CREATE TABLE elec_buytbl_new
SELECT num
	, prodName
	, price
    FROM buytbl
	WHERE groupName = '전자';