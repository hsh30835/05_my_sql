/* SET OPERATORS */
/* UNION */
-- union은 쿼리를 합치고 중복을 제거해줌
-- 중복 한번만 출력되게함
SELECT
	 menu_code
	,menu_name
	,menu_price
	,category_code
	,orderable_status
  FROM tbl_menu
 WHERE category_code = 10
 UNION
SELECT
	 menu_code
	,menu_name
	,menu_price
	,category_code
	,orderable_status
  FROM tbl_menu
 WHERE menu_price < 9000;
 
-- union all 중복제거 안함
SELECT
	 menu_code
	,menu_name
	,menu_price
	,category_code
	,orderable_status
  FROM tbl_menu
 WHERE category_code = 10
 UNION all
SELECT
	 menu_code
	,menu_name
	,menu_price
	,category_code
	,orderable_status
  FROM tbl_menu
 WHERE menu_price < 9000;
 
-- inner join에 sub query 사용하기;
SELECT
	a.menu_code,
	a.menu_name,
	a.menu_price,
	a.category_code,
	a.orderable_status
  FROM tbl_menu a -- 1번실행 
  JOIN (SELECT -- 2번실행
  			menu_code,
  			menu_price,
  			category_code,
  			orderable_status
  		  FROM tbl_menu
  		 WHERE menu_price < 9000) AS b ON (a.menu_code = b.menu_code)
  		 -- menu_price가 9000 미만인 애들을 불러오는데 a.menu_code와 b.menu_code가 같은애들만 가져옴
WHERE a.category_code = 10; -- 그리고 category_code가 10인거 찾음
 
 SELECT
 	a.menu_code,
 	a.menu_name,
 	a.menu_price,
 	a.category_code,
 	a.orderable_status,
 	b.menu_code
  FROM tbl_menu a
  LEFT join(SELECT 
  				menu_code,
  				menu_name,
  				menu_price,
  				category_code,
  				orderable_status
  			  FROM tbl_menu
  			 WHERE menu_price < 9000) as b ON (a.menu_code = b.menu_code)
  WHERE a.category_code = 10
  AND b.menu_code IS NULL;