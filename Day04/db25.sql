-- DateFormat 예제alter
select date_format('2023-03-03 17:15:10','%Y년%m월%d일 %h시%i분s초') as '일시';

-- 회원을 봅시다
select m.Names as '회원명'
		, m.Levels as '등급'
        , m.Addr as '주소'
        , m.Mobile as '연락처'
        , concat(upper(substring_index(m.Email, '@',1)),'@'
        , lower(substring_index(m.Email,'@',-1))) as '이메일'
        from membertbl as m
        order by m.names asc;