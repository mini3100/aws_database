# << 1번 >>
create schema `delivery_db`;

CREATE TABLE `delivery_db`.`delivery_mst` (
  `delivery_id` INT NOT NULL AUTO_INCREMENT,
  `delivery_company` VARCHAR(20) NULL,
  `delivery_man` VARCHAR(15) NULL,
  `delivery_address` VARCHAR(100) NULL,
  `consignee_name` VARCHAR(15) NULL,
  `consignee_phone` VARCHAR(14) NULL,
  `consignee_message` TEXT NULL,
  PRIMARY KEY (`delivery_id`));

insert into delivery_mst values(1, '대한통운', '김준일', '부산광역시 연제구 중앙대로 1001 부산광역시청', '김춘식','010-8282-5353','안전하게 배송해주세요');

# << 2번 >>
# 1. 데이터베이스 목록 조회
show databases;

# 2. 데이터베이스 사용 선택 ( 데이터베이스명: `delivery_db` )
use delivery_db;

# 3. 테이블 목록 조회
show tables;

# 4. 테이블 구조 조회 ( 테이블명: `delivery_mst` ) 
show columns from delivery_mst;
DESC delivery_mst;

# << 3번 >>
insert into 학생 values(0, '김춘식');
insert into 학생 values(0, '손흥민');
insert into 과목 values(0, '컴퓨터 구조');
insert into 과목 values(0, '데이터베이스');
insert into 과목 values(0, '인공지능');
insert into 성적 values(0, 1, 1, 95);
insert into 성적 values(0, 2, 1, 84);
insert into 성적 values(0, 1, 2, 89);
insert into 성적 values(0, 2, 2, 92);
insert into 성적 values(0, 1, 3, 100);
insert into 성적 values(0, 2, 3, 88);

select 
	순번, 성적.학번, 이름, 성적.과목번호, 과목이름, 점수
from 
	성적
	left outer join 학생 on (학생.학번 = 성적.학번)
    left outer join 과목 on (과목.과목번호 = 성적.과목번호)
where
	성적.과목번호 between 1 and 2;

# << 4번 >>
insert into 상품 values(0, '딸기사탕', 50);
insert into 상품 values(0, '누룽지사탕', 100);
select * from 상품;

START TRANSACTION;

SAVEPOINT insert_product;
INSERT INTO `상품`
VALUES(0, '오렌지사탕', 20);

SAVEPOINT update_product;
UPDATE `상품`
SET
    `수량` = 200
WHERE
    `상품코드` = 2;

rollback to savepoint update_product;

SAVEPOINT delete_product;
DELETE
FROM
    `상품`
WHERE
    `상품코드` = 2;
    
COMMIT;


# << 5번 >>
insert into student values(20013001, '홍길동', '컴퓨터공학과');
insert into student values(20013002, '김철수', '전자공학과');

create index STUDENT_CODE_INDEX on student(학번);
show index from student;


# << 6번 >>
INSERT INTO USER_MST VALUES(0, 'aaa', '1234', '정가영', 'aaa@NAVER.COM');
INSERT INTO USER_MST VALUES(0, 'bbb', '1234', '정가일', 'bbb@NAVER.COM');
INSERT INTO USER_MST VALUES(0, 'ccc', '1234', '정가이', 'ccc@NAVER.COM');

SELECT * FROM USER_MST;

CREATE VIEW USER_VIEW AS
SELECT
    `ID`,
    `USERNAME`,
    `PASSWORD`,
    `NAME`,
    `EMAIL`
FROM
    `USER_MST`
WHERE
    `ID` BETWEEN 1 AND 200;
    
SELECT
	*
FROM
	`USER_VIEW`
WHERE
	`USERNAME` LIKE 'a%';

# << 7번 >>
show index from 학생;
show full tables in STUDENT_DB where table_type like 'VIEW';


