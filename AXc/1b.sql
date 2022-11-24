Create database ass1b;
Use ass1b;
CREATE TABLE emp(emp_id int primary key auto_increment, 
emp_fname char(20) not null, emp_lname char(20) not null, 
emp_salary int, join_date date);
Desc emp;
INSERT INTO emp values(1, 'Ram', 'Kapoor', 40000, '2019-02-23');
INSERT INTO emp values(null, 'Ramesh', 'Kapoor', 20000, '2019-02-24');
INSERT INTO emp values(null, 'Ramu', 'Kapoor', 4000, '2019-02-25');
Select * FROM emp;
UPDATE emp set emp_salary=10000 where emp_id=3;
DELETE FROM emp where emp_id=3;
SELECT AVG(emp_salary) FROM emp;
SELECT concat(emp_fname, emp_lname) FROM emp where emp_salary in (SELECT max(emp_salary) FROM emp);
SELECT upper(concat(emp_fname, emp_lname)) FROM emp where emp_salary in (SELECT max(emp_salary) FROM emp);
SELECT * FROM emp WHERE YEAR(join_date)='2015';
SELECT * FROM emp WHERE emp_name like 'Ram%';
SELECT * FROM emp WHERE emp_id in (1,2,3);
SELECT * FROM emp WHERE emp_id not in (1,2,3);
SELECT * FROM emp WHERE YEAR(join_date) between '2015' and '2018';