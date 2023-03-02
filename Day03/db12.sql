-- UPDATE,TRANSACTION	

START TRANSACTION;
-- 경고 ! UPDATE 구문에는 WHERE절 빼면 안됨!1
UPDATE usertbl
	SET  mobile1 = '010'
    , mobile2 = '66667799'
    , addr = '부산'
 WHERE userID = 'SMG';
COMMIT;
ROLLBACK;


-- DELET
-- WHERE절이 빠지면 