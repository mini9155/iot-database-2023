-- 쇼핑몰에 가입하고 물건을 한 번도 구매하지 않은 회원까지 모두 출력!

SELECT u.*
		, b.userID
        , b.groupName
        , b.price
        , b.amount
	FROM usertbl AS u
    RIGHT OUTER JOIN buytbl AS b
		ON u.userID = b.userID
	WHERE b.userID IS NULL;
    
-- 학생중에 동아리에 가입하지 않은 학생

select s.stdName
	, s.addr
	, j.num
    , c.clubName
	from stdtbl as s
    left outer join stdclubtbl as j
		on s.stdName = j.stdName
	right outer join clubtbl as c
		on c.clubName, j.clubName
union -- 집합

select s.stdName
	, s.addr
	, j.num
    , c.clubName
    , c.roomNo
	from stdtbl as s
    left outer join stdclubtbl as j
		on s.stdName = j.stdName
	right outer join clubtbl as c
		on c.clubName, j.clubName;