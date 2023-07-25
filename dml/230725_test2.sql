# << 1번 >>
CREATE TABLE sales ( 
    customer VARCHAR(255), 
    amount INT
);

INSERT INTO sales (customer, amount)
VALUES 
    ('John', 100), 
    ('Jane', 200), 
    ('John', 150), 
    ('Jane', 50), 
    ('Jim', 300);
    
select * from sales;

select
	customer,
	sum(amount) as total_sales
from
	sales
group by
	customer
order by
	total_sales, customer;
    
    
# << 2번 >>
create user 'new_user'@'localhost' identified by '1234';
grant select, insert, update on `test`.* to 'new_user'@'localhost';
flush privileges;


# << 3번 >>
INSERT INTO USER_MST VALUES(0, 'JOHN', 'JOHN@gmail.com');
INSERT INTO USER_MST VALUES(0, 'JANE', 'JANE@gmail.com');
INSERT INTO USER_MST VALUES(0, 'JIM', 'JIM@gmail.com');

INSERT INTO USER_DTL VALUES(0, '010-1111-2222', 'MALE');
INSERT INTO USER_DTL VALUES(0, '010-3333-4444', 'FEMALE');
INSERT INTO USER_DTL VALUES(0, '010-5555-6666', 'MALE');

SELECT * FROM USER_MST;
SELECT * FROM USER_DTL;

CALL FIND_USER_BY_USERNAME('JOHN');

# << 4번 >>
DELETE FROM
	USER_MST
WHERE
	USER_ID = 3;

