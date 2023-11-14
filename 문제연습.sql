USE opez;

SHOW tables;

-- 다중 join을 이용하여 판수가 500판 이상이고 1000판 이하인 장인의 닉네임, 티어, 판수, 핵심 룬, 스펠, 아이템 이름을 판수가 많은 순서대로 조회하시오.
-- (tbl_master, tbl_master_build, tbl_rune, tbl_spell, tbl_item)
SELECT 
   AU.user_name,
   AU.user_tier,
   MU.total_games,
   R.main_rune,
   S.spell_D,
   S.spell_F,
   I.item_name
FROM tbl_all_users AS AU
JOIN tbl_master_users AS MU ON(AU.user_code = MU.user_code)
JOIN tbl_master_build AS MB ON(MU.master_code = MB.master_code)
JOIN tbl_rune AS R ON(MB.build_code = R.build_code)
JOIN tbl_spell AS S ON(MB.build_code = S.build_code)
JOIN tbl_item AS I ON(MB.build_code = I.build_code) 
WHERE MU.total_games BETWEEN 500 AND 1000
ORDER BY MU.total_games DESC;

-- 1.각 챔프별 모든 장인들의 챔피언 이름과 평균 판수를 조회하시오.
DESCRIBE tbl_master_users;

SELECT
	ch.champion_name,
	avg(mu.total_games) AS '평균 판수'
FROM tbl_master_users AS mu JOIN tbl_champions AS ch
ON mu.champion_code=ch.champion_code
GROUP BY ch.champion_name;

-- 2. 점멸을 들지 않는 장인의 닉네임과 스펠 모두 조회해주시오.
SELECT
	au.user_name,
	sp.spell_D,
	sp.spell_F
FROM tbl_all_users AS au JOIN tbl_master_users AS mu
  ON au.user_code=mu.user_code
JOIN tbl_master_build AS mb
  ON mu.master_code=mb.master_code
JOIN tbl_spell AS sp
  ON mb.build_code=sp.build_code
WHERE sp.spell_D != '점멸' -- !=는 아니다
  AND sp.spell_F != '점멸'
  
-- 3. 승률이 가장 높은 장인 3명의 닉네임 판수 승률을 승률 내림차순으로 조회해주시오.
SELECT
	au.user_name,
	mu.total_games,
	mu.winning_rate
FROM tbl_all_users AS au JOIN tbl_master_users AS mu
  ON au.user_code = mu.user_code
ORDER BY mu.winning_rate DESC
LIMIT 3; -- limit는 ORDER BY 밑임

-- 4. 모든 유저 중 장인을 제외한 일반 유저의 이름과 티어를 조회해주시오
SELECT
	au.user_name,
	au.user_tier
FROM tbl_all_users AS au LEFT JOIN tbl_master_users AS mu -- LEFT JOIN을 해서 모든 유저를 가져옴
  ON au.user_code = mu.user_code
WHERE mu.user_code IS NULL; -- 그중에서 장인의 값을 null로 없애버림

-- 5. 다중 join을 이용하여 판수가 500판 이상이고 1000판 이하인 장인의 닉네임, 티어, 판수, 핵심 룬, 스펠,
-- 첫 코어 아이템의 이름, 스킬 선마 순서를 판수가 많은 순서대로 조회하시오.
SELECT
	au.user_name,
	au.user_tier,
	mu.total_games,
	ru.main_rune,
	sp.spell_D,
	sp.spell_F,
	it.item_name,
	ms.skill_name
FROM tbl_all_users AS au JOIN tbl_master_users AS mu
  ON au.user_code=mu.user_code -- tbl_all_users와 tbl_master_users이 공통적으로 가지는 user_code을 묶어준다
JOIN tbl_master_build AS mb
  ON mu.master_code = mb.master_code -- tbl_master_users와 tbl_master_build이 공통적으로 가지는 master_code를 묶어준다
JOIN tbl_rune AS ru
  ON mb.build_code = ru.build_code -- tbl_master_build와 tbl_rune이 공통적으로 가지는 build_code를 묶어준다
JOIN tbl_item AS it
  ON mb.build_code = it.build_code -- tbl_master_build와 tbl_item이 공통적으로 가지는 build_code를 묶어준다
JOIN tbl_master_skill AS ms
  ON mb.build_code = ms.build_code -- tbl_master_build와 tbl_master_skill이 공통적으로 가지는 build_code를 묶어준다
JOIN tbl_spell AS sp
  ON mb.build_code = sp.build_code -- tbl_master_build와 tbl_spell이 공통적으로 가지는 build_code를 묶어준다
WHERE 500<=total_games
  and 1000>=total_games  -- BETWEEN 500 AND 1000 써도됨
ORDER BY total_games DESC;

