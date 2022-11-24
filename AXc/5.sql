Create table o_rollcall(rno int(11) not null primary key, name varchar(20), addr  varchar(20));
Create table n_rollcall(rno int(11), name varchar(20), addr  varchar(20));
Desc o_rollcall;
Desc n_rollcall;

INSERT INTO o_rollcall VALUES( 1,'sunny','pune');
INSERT INTO o_rollcall VALUES( 2,'bunny','chennai ');
INSERT INTO o_rollcall VALUES( 3,'lunny','mumbai ');
INSERT INTO o_rollcall VALUES( 4,'dunny','delhi ');
INSERT INTO o_rollcall VALUES( 5,'raunny','kolkata');
SELECT * FROM o_rollcall;


INSERT INTO n_rollcall VALUES( 1,'sunny','pune');
INSERT INTO n_rollcall VALUES( 2,'bunny','chennai ');
INSERT INTO n_rollcall VALUES( 3,'lunny','mumbai ');
SELECT * FROM n_rollcall;


Delimiter $
Create procedure n11(IN rno1 int)
Begin
Declare rno2 int;
Declare exit_cond Boolean;
Declare c1 cursor for select rno from o_rollcall where rno>rno1;
Declare continue handler for not found set exit_cond=TRUE;
Open c1;
L1: loop
Fetch c1 into rno2;
If not exists(select * from n_rollcall where rno=rno2) 
then
Insert into n_rollcall select * from o_rollcall where rno=rno2;
End if;
If exit_cond then
Close c1;
Leave l1;
End if;
End loop l1;
End;
$
Delimiter ;
Call n11(3);
Select * from n_rollcall;