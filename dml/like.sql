#like
select 
    *
from
    product_tb
where
    product_name LIKE 'BASIC _T?%';
# _ : 글자 개수 정해줌, % : 글자 개수 안 정해줌

# product_tb에서 NO와 PROPERTY로 시작하는 것을 모두 출력하시오.
select 
    *
from
    product_tb
where
    product_name like 'NO%'
        OR product_name like 'PROPERTY%';