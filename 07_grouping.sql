-- grouping
-- group by 절은 결과 집합을 특정 열의 값에 따라 그룹화 하는데 사용된다.

select
	category_code
from
	tbl_menu;
    
select
	category_code
from tbl_menu
group by category_code;

-- count() : 갯수를 세준다.
select
	category_code,
    count(*)
from
	tbl_menu
group by category_code;

-- sum() : 합계
select
	category_code,
    sum(menu_price)
from
	tbl_menu
group by
	category_code;
    
-- avg() : 평균
select
	category_code,
    avg(menu_price)
from
	tbl_menu
group by category_code;


-- 2개 이상의 그룹 생성
select
	menu_price,
    category_code
from
	tbl_menu
group by
	menu_price,
    category_code;			-- 모두 만족을 시켜야만 그룹화가 된다. 가격이나 코드 둘 중 하나라도 다르면 다른 그룹
    
    -- rollup
    -- 컬럼들의 총합을 구하는 방식
    select
		category_code,
        sum(menu_price)
	from
		tbl_menu
	group by
		category_code
	with rollup;		-- 맨 밑에 총합계까지 구해준다. 

select
	menu_price,
    category_code,
    sum(menu_price)
from
	tbl_menu
group by
	menu_price,
    category_code
with rollup;

