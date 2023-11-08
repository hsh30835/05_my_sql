/* JOIN */

-- ineer join
-- on은 테이블간의 연결할 조건을 의미한다.
-- where은 조회된 결과에서 필터링할 조건이다.
SELECT
	a.menu_name,
	b.category_name
  FROM tbl_menu AS a
 --  INNER JOIN tbl_category b ON (a.category_code = b.category_code)
  JOIN tbl_category AS b ON (a.category_code = b.category_code)
  
SELECT
	* FROM tbl_menu;
	
SELECT 
	* FROM tbl_category;
	
-- Right join
 SELECT
 	a.menu_name,
	b.category_name
  FROM tbl_menu AS a
  RIGHT JOIN tbl_category AS b ON (a.category_code = b.category_code);
 -- cross join 모든걸 매칭 잘안씀
  SELECT
 	a.menu_name,
	b.category_name
  FROM tbl_menu AS a
  cross JOIN tbl_category b;
 -- outer join 
 SELECT
 	a.menu_name,
 	b.category_name
   FROM tbl_menu a
   RIGHT JOIN tbl_category b on(a.category_code = b.category_code)
   WHERE a.category_code IS NULL;
 -- slef join
 SELECT
 	 a.category_code AS 'b의 code',
 	 a.category_name AS 'a의 code',
 	 b.category_name 
 	FROM tbl_category a
 	JOIN tbl_category b ON (a.category_code = b.ref_category_code);
 SELECT * FROM tbl_category ;