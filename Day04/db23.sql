use tabledb;

create table TBL1(
	ID int not null primary key,
    bridge int null,
    contents varchar(5000)
);
/* sql DB의 usertbl 데이터중에서 userID, name,birthYear, addr만 가져와서
부어넣음*/

insert into tabledb.usertbl
select userID, name, birthYear, addr
	from sqldb.usertbl;
    
select * from usertbl where name = '김범수';


-- 뷰

USE sqldb;

create view uv_potentialUser
as
	select u.*
    , b.num, b.prodName, b.price, b.amount
    from usertbl as u
    left outer join buytbl as b
    on u.userID = b.userID
    where b.userID is null;
    
    select * from uv_potentialUser;
    
    -- 조건설정
    create table stdtbl(
	userID char(8) not null primary key,
    name varchar(10),
    grade int check (grade >= 1 and grade <=4), -- 학년은 1~4
    constraint CK_name check (name is not null) -- not null
    );