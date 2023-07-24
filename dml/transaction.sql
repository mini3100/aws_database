select @@autocommit;
set autocommit = 0;	#commit off

start transaction;

savepoint insert_user;

insert into user_tb values(0, 'eee', '1234');

select * from user_tb;

savepoint update_user_password;
    
update user_tb set password = '1111' where username = 'eee';

select * from user_tb;

rollback to savepoint update_user_password;	# 해당 시점으로 rollback

rollback to savepoint insert_user;

rollback;

commit;


