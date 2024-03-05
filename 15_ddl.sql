-- DDL(Data Deficition Language)
-- DDL 은 데이터베이스의 스키마(테이블)를 정의하거나 수정하는데 사용되는
-- SQL 의 한 부분이다.

-- 1-1. create
-- 테이블 생성을 이한 구문
-- if not exists 를 적용하면 기존에 존재하는 테이블이라도 에러가 발생하지 않는다.

-- 테이블의 컬럼 설정 방법
-- 컬럼이름 데이터타입(길이) [not null] [default value] [auto_increment] colum_contraint;

-- tb1 예시 테이블 생성하기

create table if not exists tb1 (
	pk int primary key,
    fk int,
    col1 varchar(255),			-- 데이터 타입이 문자
    check(col1 in ('Y', 'N'))
) ENGINE=INNODB;		-- 신경쓰지말고 이거 하나만 추가한다고 생각.

-- ENGINE=INNODB : 테이블을 innodb 라고 불리는 스토리지 엔진으로 생성하겠다는 의미(mysql 에서 가장 많이 쓰임)

describe tb1;		-- describe를 쓰면 테이블 정보가 나온다, primary 키는 식별자

insert into tb1 values(1, 10, 'Y'); -- pk 를 프라이머리 키로 설정하여 1 값을 null 로 변경시 오류가 발생한다. 
-- int 나 varchar 에는 null 값ㅇ르 넣을 수 있다. 
select * from tb1;

-- auto_increment
-- insert 시 primary 키에 해당하는 컬럼에 자동으로 번호를 발생(중복되지 않게) 시켜 저장할 수 있다. 

create table if not exists tb2 (
	pk int auto_increment primary key,
    fk int,
    col1 varchar(255),			
    check(col1 in ('Y', 'N'))
) ENGINE=INNODB;

describe tb2;		-- 엑스트라에 오토 인크리먼트가 추가된다. 

insert into tb2 values(null, 10, 'Y');	-- 자동으로 추가가 되니 null 값을 넣을 수 있게 됐다.
insert into tb2 values(null, 10, 'Y');

select * from tb2;

-- alter
-- 테이블에 추가/변경/수정/삭제 하는 모든 것은 alter 명령어를 사용하여 적용한다. 

-- 열 추가
-- alter table 테이블명 add 컬럼명 컬럼정의
-- tb2 테이블에 col2 라는 컬럼 추가(int 형, not null 제약조건 존재)
alter table tb2 
add col2 int not null;

describe tb2;

-- 열 삭제
-- alter table 테이블명 drop column 컬럼명
-- col2 컬럼 삭제
alter table tb2
drop column col2;

describe tb2;

-- 열 이름 및 데이터 형식 변경
-- alter table 테이블명 change column 기존컬럼명 바꿀컬럼명 컬럼정의
-- fk -> change_fk 컬럼으로 변경 not null 제약조건 추가
alter table tb2 
change column fk change_fk int not null;

describe tb2;

-- 열 제약 조건 추가 및 삭제
-- alter table 테이블명 drop 제약조건
-- tb2 테이블의 primary key 제약조건 제거
alter table tb2
drop primary key;		

-- auto_increment 가 걸려 있는 컬럼은 primary key 제거가 안 된다. 
-- 따라서 modify 명령어로 제거한다. 
alter table tb2
modify pk int;		-- auto_increment 가 사라진다. 

describe tb2;		

-- 수정 후 primary key 삭제
alter table tb2
drop primary key;

describe tb2;

-- tb2 테이블의 pk 컬럼에 primary key 추가하기 
-- add
alter table tb2
add primary key(pk);

describe tb2;

-- 컬럼 여러 개 추가하기
alter table tb2
add col3 date not null,
add col4 tinyint not null;

-- date 형이 추가가 안 되는 것은 MySQL 이 5.7 버전 이후 0으로 채워진 date 컬럼이 존재하면 안 되기 때문이다. 

select @@global.sql_mode; 

describe tb2;

-- drop
-- 테이블을 삭제하기 위한 구문
create table if not exists tb3 (
	pk int auto_increment primary key,
    fk int,
    col1 varchar(255),			
    check(col1 in ('Y', 'N'))
) ENGINE=INNODB;

-- drop table tb3
drop table if exists tb3;		--  테이블 3이 존재한다면 삭제해라 라는 if 안정장치 추가

drop table if exists tb1, tb2;

-- truncate
-- 논리적으로는 where 절이 없는 delete 구문과 큰 차이가 없어 보인다. 
-- 하지만 어차피 데이터를 다 삭제할 경우 행마다 하나씩 지워지는 delete 보다
-- drop 이후 바로 테이블을 재생성 해주는 truncate 가 훨씬 효율적으로 
-- 한 번에 테이블을 초기화 시켜준다. 
create table if not exists tb1 (
	pk int auto_increment primary key,
    fk int,
    col1 varchar(255),			
    check(col1 in ('Y', 'N'))
) ENGINE=INNODB;

insert into tb1 values (null, 10, 'Y');
insert into tb1 values (null, 20, 'Y');
insert into tb1 values (null, 30, 'Y');
insert into tb1 values (null, 40, 'Y');

select * from tb1;

-- 테이블 초기화
-- truncate table tb1;
truncate tb1;		--  table 키워드 생략 가능. 




















