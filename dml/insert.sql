SELECT * FROM test_tb;
insert into study1.test_tb(test_id, name, birthday) values(3, '정가이', '2001-10-31');
# 컬럼 순서 바꿔서 삽입 가능
insert into study1.test_tb(test_id, birthday, name) values(4, '2001-11-01', '정가삼');
insert into study1.test_tb(test_id, birthday, name) values(5, '2001-11-02', '정가사');
# 테이블 컬럼 생략시 컬럼 순서대로 넣어야 함
insert into test_tb values(6, '정가오', '2001-11-03');
# 특정 컬럼만 넣고 싶을 때는 생략 가능(생략한 컬럼의 데이터는 null값이 됨.
insert into test_tb(test_id, birthday) values(7, '2001-11-04');
# 컬럼 생략했는데 특정 컬럼만 넣고 싶다면 null값으로 채워줘야됨.
insert into test_tb values(8, '정가칠', null);

