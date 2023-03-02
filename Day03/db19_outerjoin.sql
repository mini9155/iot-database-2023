-- OUTER JOIN
INSERT INTO stdtbl values
('김범수','경남'),('성시경','서울'),('조용필','경기'),('은지원','경북'),('바비킴','서울');

insert into clubtbl values
('수영','101호'),('바둑','102호'),('축구','103호'),('봉사','104호');

insert into stdclubtbl (stdName, clubName)values
('김범수','바둑'),('김범수','축구'),('조용필','축구'),('조용필','축구');


-- inner join

select s.stdName, s.addr, c.clubName, t.roomNo
	from stdtbl as s
    join stdclubtbl as c
    on s.stdName = c.stdName
    join clubtbl as t
    on c.clubName = t.clubName;