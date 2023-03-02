-- INSERT
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('SMG','성명건',1976,'부산','010','66887777','179','2023-03-02');

-- 컬럼을 다 적을 때 입력 안 할 컬럼은 NULL로 지정
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('SMG','성명건',1976,'부산','010','66887777','179','2023-03-02');

-- NULL 컬럼은 생략 가능
INSERT INTO usertbl
(userID, name, birthYear, addr)
VALUES
('SMG','성명건',1976,'부산');

-- 컬럼 지정을 생략 가능(단, 입력할 값의 순서가 컬럼순서 일치)
INSERT INTO usertbl VALUES
('SJW','손정웅',1969,'서울','010','55664433','1buytblbuytbl76',NULL);

-- AUTO_INCREMENT의 경우 필드값을 입력하지 않아도 됨
INSERT INTO buytbl
(num,userID,prodName,groupName,price,amount)
VALUE
(13,'SMG','노트북','전자',5000000,1);