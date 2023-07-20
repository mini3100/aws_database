# 여러 줄 삽입
# 코드 작성시 한 줄로 작성하지 말고 여러 줄로 가독성 좋게 작성!
insert into student_tb 
values
	(0, '정가영', 20, 0), 
	(0, '정가일', 21, 0),
    (0, '정가이', 20, null),
    (0, '정가삼', 22, null),
    (0, '정가사', 21, 0);

select * from student_tb;

# null 검색할 때 : is null
# null 아닌 것을 검색할 때 : is not null
# or와 and가 함께 쓰일 때 : or(*) 먼저 수행 후 and(+) 조건 수행
select
	student_id,
    student_name,
    student_age,
    student_score
from
	student_tb
where
    student_age = 20
    or student_score is not null
    and student_name = '정가영';

update student_tb
set
	student_score = 30
where
	student_age = 22;

# 나이가 20살인 학생들의 점수를 전부 더하세요.
select
	student_age,
    sum(student_score) as total_score
from
	student_tb
-- where
-- 	student_age = 20
GROUP BY
	student_age
having
	total_score = 40;

# 모든 데이터들에 대한 개수 (라인 수)
select
	count(*)
from
	student_tb;

select
	count(*)
from
	student_tb
where
	student_age = 20;

# 성적 순으로 정렬
select
	*
from
	student_tb
order by
	student_score desc, 
    student_id desc;
    
    
    
    