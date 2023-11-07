SHOW DATABASES;
CREATE USER 'menu'@'%' IDENTIFIED BY 'menu'; /*유저목록을 만들겠따, %:내 컴퓨터 내부에서만쓸수있다*/
SHOW DATABASES;
USE mysql;
SHOW TABLES; /*내가사용하는 데이터베이스에 따라 실행 결과가 달라진다*/
SELECT * FROM USER;
CREATE DATABASE menudb; /*menudb 데이터베이스 생성*/
SHOW DATABASES;
GRANT ALL PRIVILEGES ON menudb.* TO 'menu'@'%'; /* * : menu에 대한 모든 권한을 허용하겠다*/
SHOW GRANTS FOR 'menu'@'%';
USE menudb; /*menudb를 사용하겠다*/
SHOW TABLES; /*데이터를 넣었으니 SHOW TALBES를 실행해야 보인다*/
