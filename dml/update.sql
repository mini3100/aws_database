select * from test_tb;

# update(데이터 수정)
# 해당 값을 명확히 찾을 수 있게 조건을 기본키를 통해 줘야 함.
update test_tb set name = '정가육' where test_id = 7;
update test_tb set birthday = '2001-11-05' where test_id = 8;
# 여러 컬럼 한 번에 수정
update test_tb set name = '정가팔', birthday = '2001-11-06' where test_id = 8;