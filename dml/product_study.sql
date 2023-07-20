insert into product_tb
values
	(0, '상의1', 10000),
	(0, '상의2', 20000),
	(0, '상의3', 30000);

SELECT 
    *
FROM
    product_tb;

insert into product_color_tb
values
	(0, 'black'),
	(0, 'white'),
	(0, 'red'),
	(0, 'blue'),
	(0, 'green');
    
SELECT 
    *
FROM
    product_color_tb;

insert into registered_product_tb
values
	(0, 1, 1),
	(0, 1, 2),
	(0, 1, 3),
	(0, 1, 4),
	(0, 1, 5),
	(0, 2, 1),
	(0, 2, 3),
	(0, 3, 2),
	(0, 3, 4);
    
SELECT 
    *
FROM
    registered_product_tb;

# 두 테이블에 같은 이름의 컬럼이 들어 있기 때문에 식별 필요
select 
    *,
    (select 
            color_name
        from
            product_color_tb as pct
        where
            pct.product_color_id = rpt.product_color_id) as color_name
from
    registered_product_tb as rpt
where
    product_color_id = (select 
            product_color_id
        from
            product_color_tb
        where
            color_name = 'black');
	
# left join 사용
select 
    *
from
    registered_product_tb rpt	# 테이블에 as 생략
        left outer join
    product_color_tb pct ON (pct.product_color_id = rpt.product_color_id)	# on(조건) 조건이 참인 경우에만 join
where
    pct.color_name = 'red';
    
select
	registered_product_id, 
    product_id, 
    color_name
from
	registered_product_tb rpt, product_color_tb pct
where
	pct.product_color_id = rpt.product_color_id
    and pct.color_name = 'red';