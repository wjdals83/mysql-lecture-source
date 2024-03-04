-- subqueries
-- 다른 뭐리 내에서 실행되는 쿼리이다. 
-- subquery 의 결과를 활용하여 복잡한 mainquery 를 작성해 한 번에 
-- 여러 작업을 수행할 수 있다. 

-- tbl_menu 테이블에서 민트미역국과 같은 카테고리 코드를 가지고 있는 행들의 모든
-- 정보를 조회하시오.
select 
	category_code		-- 우선 민트미역국의 카테고리 코드를 알아야 한다.
from
	tbl_menu
where
	menu_name = '민트미역국';
    
select
	*
from
	tbl_menu
where
	category_code = 4;
    
-- 해결

select
	*
from
	tbl_menu
where
	category_code = (
						select
							category_code
						from
							tbl_menu
						where
							menu_name = '민트미역국'
					);
                    
-- count() : 특정 열 또는 행의 수를 반환하는 데 사용

select
	category_code,
    count(*) as 'count'
from
	tbl_menu
group by category_code;

-- from 절에 쓰인 서브쿼리(derived table, 파생 테이블)
-- 반드시 자신의 별칭이 있어야 한다. 
-- 이 count 라는 컬럼이 가진 가장 큰 값 -> 6 이라는 값을 도출하고 싶다.

-- max() : 최댓값을 반환해줌.

select
	max(count)
from
	(
		select
			count(*) as 'count'
		from
			tbl_menu
		group by
			category_code
    ) as countmenu;		-- 별칭 지어주기..?
    
-- 상관 서브쿼리
-- 메인쿼리가 서브쿼리 결과에 영향을 주는 경우 상관 서브쿼리 라고 한다. 

-- tbl_menu 테이블에서 카테고리 코드가 4번인 친구들의 메뉴 가격 평균을 조회하시오.
-- avg() 
select 
	avg(menu_price)
from
	tbl_menu
where
	category_code = 4;
    
-- 카테고리별 평균 가격보다 높은 가격ㄱ의 메뉴의 메뉴코드, 메뉴이름, 메뉴가격, 카테고리코드 를 조회하시오.
select
	a.menu_code,
    a.menu_name,
	a.menu_price,
    a.category_code
from
	tbl_menu a
where
	menu_price > (
					select
						avg(menu_price)
					from
						tbl_menu
					where
						category_code = a.category_code
				);
                
-- cte(common table expressions)
-- 파생 테이블과 비슷한 개념이며 코드으 가독성과 재사용성을 위해 파생 테이블
-- 대신 사용하게 된다.

select
	a.menu_name,
    b.category_name
from
	tbl_menu a
join
	tbl_category b
    on
    a.category_code = b.category_code;
    
with menucate as (		-- 쿼리문 실행ㅅ ㅣㅅ 나오는 테이블을 재사용하여 가상의 테이블 만들었음.
				select
					a.menu_name,
					b.category_name
				from
					tbl_menu a
				join
					tbl_category b
					on
					a.category_code = b.category_code
				)
                
select
	*
from
	menucate;
