SELECT * FROM order_detail_tb;
SELECT * FROM order_tb;

# order_detail_tb + order_tb
select 
    *
from
    order_detail_tb odt
	left outer join order_tb ot ON (ot.order_id = odt.order_id)
	left outer join product_tb pt ON (pt.product_id = odt.product_id)
	left outer join user_tb ut ON (ut.user_id = ot.user_id)
	left outer join address_tb at ON (at.address_id = ot.address_id);

# user_tb에 들어있는 name이 '상구'인 사람의 구매 총액을 조회하시오.
select 
    ut.name, 
    sum(pt.product_price * odt.count_number) as total_order_price	# count_number : 구매한 갯수
from
    order_detail_tb odt
	left outer join order_tb ot ON (ot.order_id = odt.order_id)
	left outer join product_tb pt ON (pt.product_id = odt.product_id)
	left outer join user_tb ut ON (ut.user_id = ot.user_id)
where
	ut.name = '상구'
group by
	ut.name;
    
# 2023-06-01 ~ 2023-06-07 까지의 카테고리별 총 판매수량
select 
    ct.category_name, 
    sum(odt.count_number) as total_order_stock
from
    order_detail_tb odt
	left outer join order_tb ot ON (ot.order_id = odt.order_id)
	left outer join product_tb pt ON (pt.product_id = odt.product_id)
    left outer join category_tb ct ON (ct.category_id = pt.category_id)
where
	ot.order_date between '2023-06-01' and '2023-06-07'
GROUP BY
	ct.category_id;
