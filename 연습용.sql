-- 1.장인랭킹 테이블에서 티어가 마스터 이상인 장인들의 닉네임 조회하기
-- (티어는 아이언 - 브론즈 - 실버 - 골드 - 플래티넘 - 에메랄드 - 다이아몬드 - 마스터 - 그랜드 마스터 - 챌린저 순이다)
SELECT
	user_name
FROM
tbl_master
WHERE user_tier ='마스터'
   OR user_tier ='그랜드 마스터'
   OR user_tier ='챌린저'
   
SELECT * FROM tbl_master_build;

SELECT * FROM tbl_master;


-- 2.승률이 가장 높은 장인 3명의 닉네임 판수 승률을 승률 내림차순으로 조회해라
SELECT
	user_name,
	total_games,
	winning
FROM
tbl_master
ORDER BY winning desc
LIMIT 3

-- 3.점멸 안드는 장인의 닉네임 조회하기
SELECT
	M.user_name
FROM
tbl_master AS M
JOIN
tbl_master_build AS B ON M.user_number = B.user_number
JOIN
tbl_spell AS S ON B.build_number = S.build_number
WHERE spell_D != '점멸'
  AND spell_F != '점멸'

-- 4.각챔프별 모든 장인들의 챔피언 이름과 평균 판수 조회하기
  SELECT
  	champion_name,
  	avg(total_games) AS '평균 판수'
  FROM
  tbl_master
  GROUP BY champion_name;
 

 
