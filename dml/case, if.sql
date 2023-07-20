# 조건문
select
	*,
    case
		when product_price < 100000 then '10만원 미만'
        when product_price < 200000 then '20만원 미만'
        else '10만원 이상'
    end as '가격 범위',
    if(product_price < 100000, '10만원 미만', '10만원 이상') as '가격 범위2', # 삼항 연산자
    if(size_m is null, '사이즈 없음', size_m) as size_m2,
    ifnull(size_m, '사이즈 없음') as size_m3,	# size_m == null 이면 '사이즈 없음'으로 변환
    nullif(size_m, 'M') as size_m4	# size_m == 'M'이면 null로 변환
from
	product_tb;