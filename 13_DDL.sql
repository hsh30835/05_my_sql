/* DDL(data Definition Language) */

/* create */
-- 테이블을 생성하기 위한 구문
-- if not Exists를 적용하면 기존에 존재하는 테이블이라도 에러가 발생하지 않는다.

-- 테이블의 컬럼 설정
-- column_name data_type(length) [not null] [default value] [auto_increment] column_constraint;

-- 테이블 생성 --CREATE TABLE IF NOT EXISTS 테이블이 중복되면 이 테이블로 바꾸겠단 뜻
CREATE TABLE IF NOT EXISTS tb1(
	pk INT PRIMARY KEY, -- 제약조건
	fk int,
	col1 varchar(255),
	CHECK(col1 IN ('Y','N'))
) ENGINE = INNODB;

DESCRIBE tb1;
INSERT INTO tb1 VALUES(3,"10","N");
SELECT * FROM tb1;

/* Auto_Increment */
-- insert시 primary키에 해당하는 컬럼에 자동으로 번호를 발생(중복되지 않게) 시켜 저장할 수 있다.
