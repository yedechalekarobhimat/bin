CREATE DATABASE ass1;
USE ass1;
CREATE TABLE employee(
  em_id INT, 
  em_name CHAR(20), 
  em_join_date DATE, 
  PRIMARY key(em_id)
);
DESC employee;

CREATE TABLE emp_finance(
  pay_id INT auto_increment, 
  em_id INT, 
  em_salary INT, 
  em_contract DATE, 
  FOREIGN key(em_id) REFERENCES employee(em_id), 
  PRIMARY key(pay_id)
);
DESC emp_finance;

INSERT INTO employee VALUES(1, 'sham', '2020-09-22');
INSERT INTO employee VALUES(2, 'ram', '2020-09-12');
INSERT INTO employee VALUES(3, 'ram', '2020-09-15');
SELECT * FROM employee;

INSERT INTO emp_finance VALUES(1,1,2000,'2021-01-21');
INSERT INTO emp_finance VALUES(null,3,4000,'2021-04-21');
SELECT * FROM emp_finance;

CREATE VIEW EmpDetails AS 
SELECT e.em_id, e.em_name, f.em_salary FROM employee AS e 
INNER JOIN emp_finance AS f 
WHERE e.em_id = f.em_id;

SELECT * FROM EmpDetails;

ALTER TABLE emp_finance ADD bonus int(10);

CALL sys.create_synonym_db('ass1', 'assignment1');
show databases;
use assignment1;
show tables;