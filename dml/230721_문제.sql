# 1. 각 계정별로 어떤 기부를 했는지 조회하시오. - test 제외
select
	gt.giver_id,
    gt.user_id, 
    ut.name,
    gt.giving_page_id,
    gpt.story_title,
    gt.giving_total
from
	giver_tb gt
    left outer join user_tb ut on (ut.user_id = gt.user_id)
    left outer join giving_page_tb gpt on (gpt.giving_page_id = gt.giving_page_id)
order by gt.user_id;

# 2. 센터별로 총 기부액이 얼마인지 조회하시오.
select
	ct.center_id, 
    ct.center_name, 
    ct.center_address,
    ifnull(sum(gt.giving_total), 0) as total_give_price
from
	center_tb ct	-- 모든 센터의 기부액을 출력하기 위해 center_tb가 마스터 테이블이 됨.
    left outer join giving_page_tb gpt on (gpt.center_id = ct.center_id)
	left outer join giver_tb gt on (gt.giving_page_id = gpt.giving_page_id)
group by
	ct.center_id, 
    ct.center_name;

# 3. 기부 항목별 총 기부액을 조회하시오.
select
	gpt.giving_page_id,
	gpt.giving_name, 
    sum(gt.giving_total) as total_give_price
from
	giver_tb gt
    left outer join giving_page_tb gpt on (gpt.giving_page_id = gt.giving_page_id)
where
	giving_name != 'test'
group by
	gpt.giving_page_id;

# 4. 카테고리 별로 총 기부액을 조회하시오.
select
	gpt.category_id, 
    gct.giving_category_name, 
    ifnull(sum(gt.giving_total), 0) as total_giving_money
from
	giving_category_tb gct 
    left outer join giving_page_tb gpt on (gpt.category_id = gct.giving_category_id)
    left outer join giver_tb gt on (gt.giving_page_id = gpt.giving_page_id)
group by
	gpt.category_id, gct.giving_category_name;

