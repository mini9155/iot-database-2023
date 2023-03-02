-- 변수 사용

USE sqldb;

SET @myVar1 = 5;
SELECT @myVar1;
SET @myVal2 = '이름 ==> ';

SELECT @myVal2, name
	FROM usertbl
    WHERE height > 170;
    
SELECT name, height + @myVar1
	FROM usertbl;
    

-- 형변환alter
SELECT CAST(birthYear AS CHAR) FROM usertbl;
SELECT CAST(CONVERT(birthYear, CHAR)AS SIGNED INTEGER)FROM usertbl;

SELECT CAST(addr AS DECIMAL) FROM usertbl; # 문자열이라 ㄴㄴ
SELECT CONVERT(addr, decimal) FROM usertbl;
SELECT CAST('1000' AS DECIMAL);

-- 암시적 형 변환
SELECT 200 + 300;
SELECT CONCAT('HELLO','WORLD');
SELECT '200'+'300'; -- MySQL 이외에서는 '200300'
SELECT '200' + 300;

/* 내장함수 리스트 */
-- 흐름함수
-- 100>200 ? '참' : '거짓'
SELECT IF(100>200,'참','거짓');

SELECT IFNULL(NULL, '널D입니다');

SELECT IFNULL(NULL,0)+100;
-- NULLIF는 많이 사용 안됨
SELECT NULLIF(100,100);
-- 쿼리 작성할 때 많이 사용
SELECT name
	, birthYear
    , addr
    , CASE addr
    WHEN '서울' THEN '수도권'
    WHEN '경기' THEN '수도권'
    WHEN '부산' THEN '광역권'
    WHEN '한양' THEN '조선권'
    ELSE '지역권' END
	FROM usertbl;
    
-- 문자열 함수
SELECT ASCII('A'),ASCII('B');
SELECT ASCII('안'), CHAR(236); -- 한글은 사용하면 안됨
-- CHAR_LENGTH (글자길이), LENGTH(byte)
SELECT CHAR_LENGTH('ABC'), LENGTH('ABC');
SELECT CHAR_LENGTH('가나다'), LENGTH('가나다'); # 한글 한글자당 3bytes

SELECT REPLACE('HELLO WORLD', 'HELLO', 'BYEBYE');
SELECT INSTR('안녕하세요,여러분','여');

-- LEFT, RIGHT
SELECT LEFT('ABCDEFGHIJKLMN',3),RIGHT('ABCDEFGHIJKLMN',3);
SELECT UPPER('hello world'), lower('HELLO WORLD');

-- LTRIM, RTRIM, TRIM
SELECT LTRIM('          HELLO WORLD          ') AS 'LTRIM' # 왼쪽 여백 없앤다
	, RTRIM('          HELLO WORLD          ') AS 'RTRIM' # 오른쪽 여백 없앤다
    , TRIM('          HELLO WORLD          ') AS 'TRIM'; # 앞 뒤 여백 없앤다
    
-- 'hello' * 3    
SELECT REPEAT('HELLO',3);

-- substring
SELECT SUBSTRING('대한민국만세',5,2);

-- 수학함수
SELECT ABS(-10);

SELECT CEILING(4.7), FLOOR(4.9), ROUND(4.5); # 반올림

SELECT MOD(157, 10);

-- RANDOM
SELECT RAND(),FLOOR(1+(RAND()*(6))); -- 주사위 놀이

-- 날짜 및 시간 함수
SELECT NOW(); # 현재값
SELECT ADDDATE('2023-03-02',INTERVAL -10 DAY);

SELECT YEAR(NOW());
SELECT HOUR(NOW());
SELECT TIME(NOW());
SELECT MONTH(NOW());
SELECT DATE(NOW());
SELECT DAY(NOW());
SELECT DAYOFWEEK(NOW());# 1(일) ~ 7(토)
SELECT LAST_DAY('2023-02-01');

-- 시스템함수
SELECT USER();
SELECT DATABASE();

-- ROW_COUNT()

UPDATE buytbl SET price  = price * 2;
SELECT ROW_COUNT();

SELECT VERSION(); # 버전