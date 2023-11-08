/* group by */
-- group by는 대상을 묶고 count는 그 수를 세줌
SELECT
	category_code,
	count(*)
	FROM tbl_menu
 GROUP BY category_code;
 
SELECT 
	category_code
 	count(*)
FROM tbl_menu
GROUP BY category_code;

-- sum()
SELECT
	category_code,
	menu_price
  FROM tbl_menu;
  
SELECT
	category_code, -- 코드가 같은거끼리 더함
	sum(menu_price)
  FROM tbl_menu
 GROUP BY category_code;
 
-- avg() 함수
SELECT
	category_code,
	avg(menu_price)
  FROM tbl_menu
 GROUP BY category_code;

-- 다중열 묶음
 SELECT 
	category_code,
	menu_price,
	count(*)
   FROM tbl_menu
  GROUP BY category_code, menu_price;
  
 SELECT
	 category_code
   FROM tbl_menu
  WHERE menu_name NOT IN ('과메기커틀릿')
  GROUP BY category_code
 HAVING category_code BETWEEN 5 AND 8;
