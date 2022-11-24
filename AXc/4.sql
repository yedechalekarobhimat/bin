create database ass4;
use ass4;
Create table borrower(rollin int(11) not null primary key, name char(20) not null, dateofIssue date, bname char(20), status char(1));
Create table fine(rollno int(11), fdate date, amt int(11), foreign key(rollno) references borrower(rollin)); 
desc borrower;
desc fine;
INSERT INTO borrower values(1,'a', '2022-11-01', 'java', 'I');
INSERT INTO borrower values(2,'b', '2022-10-01', 'networking', 'I');
INSERT INTO borrower values(3,'c', '2022-09-01', 'DBMS', 'I');
INSERT INTO borrower values(4,'d', '2022-08-01', 'CN', 'I');
SELECT * FROM fine;

(we use delimiter to push our code in block and not one by one)
delimiter $        
CREATE procedure fine_calculation (IN rno int(3), bname char(20))
begin
Declare i_date date;
Declare diff int;
Declare fine_amt int;
Declare exit handler for sqlexception select 'Table not found';
SELECT dateofIssue into i_date from borrower where rollin=rno and bname=bname;
Select datediff(curdate(), i_date) into diff;
If(diff>15 and diff<=30) then
Set fine_amt = diff*5;
Insert into fine values(rno, curdate(), fine_amt);
Elseif(diff>30) then 
Set fine_amt=15*5 + (diff-30)*50;
Insert into fine values(rno, curdate(),fine_amt);
End if;
Update borrower set status='R' where rollin=rno and bname=bname;
End
$
Delimiter ;
Call fine_calculation(3, 'DBMS');
SELECT * FROM fine;
SELECT * FROM borrower;