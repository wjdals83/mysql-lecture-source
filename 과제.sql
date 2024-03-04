-- 주석
/* 여러 줄 주석
*/

-- 1) 새로운 계정 만들기
CREATE USER 'ohgiraffers'@'%' IDENTIFIED BY 'ohgiraffers';

-- 현재 존재하는 데이터베이스 확인
SHOW databases;

-- mysql 데이터베이스로 계정 정보 확인하기
USE mysql;

SELECT * FROM USER;

-- 2) 데이터베이스 생성 후 계정에 권한 부여
CREATE DATABASE menudb;

grant all privileges on meudb.* to 'ohgiraffers'@'%'; -- menu에 대한 모든 권한 부여

show grants for 'ohgiraffers'@'%';









