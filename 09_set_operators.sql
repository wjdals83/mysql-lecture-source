-- 09_set_operators

-- 두 개 이상의 select 문의 결과 집합을 결합하는데 사용한다.

-- union
-- 두 개 이상의 select 문의 결과를 결합하여 중복된 레코드를 제거한 후
-- 반환하는 sql 연산자 이다. 

-- 1
select
	*
from
	tbl_menu
where
	category_code = 10
union		-- 두 개의 쿼리문을 중복된 값을 빼고 합쳐준다. 
    
-- 2
select
	*
from
	tbl_menu
where
	menu_price < 9000;
    
-- union all
-- 두 개 이상의 select 문의 결과를 결합하며 중복된 레코드를 제거하지 않고 모두 반환

select
	*
from
	tbl_menu
where
	category_code = 10
union all	
    
-- 2
select
	*
from
	tbl_menu
where
	menu_price < 9000;
    
-- intersect
-- 두 select 문의 결과 중 공통되는 레코드만 반환하는 sql 연산자이다. 
-- mysql 은 intersect를 제공하지 않는다.
-- 하지만 inner join 또는 in 연산자를 활용해서 구현하는 것은 가능하다. 

-- inner join 활용
-- 1
select
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu;
    
-- 2
select
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	menu_price < 9000;
    
-- 결과
select
	a.menu_code,
    a.menu_name,
    a.menu_price,
    a.category_code,
    a.orderable_status
from
	tbl_menu a
inner join
	(
		select
			menu_code,
			menu_name,
			menu_price,
			category_code,
			orderable_status
		from
			tbl_menu
		where
			menu_price < 9000
    ) b
    on
    (a.menu_code = b.menu_code);
