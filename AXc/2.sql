Create database ass99;
Use ass99;
Create table student(roll_no int primary key, name char(20), address char(40), phone int(10), age int(2));
Desc student;
INSERT INTO student values(1,'Harsh', 'delhi', '11', '18');
INSERT INTO student values(2,'Harshal', 'mumbai', '12', '16');
INSERT INTO student values(3,'prathamesh ', 'pune', '13', '20');
INSERT INTO student values(4,'Shreyash ', 'chennai', '14', '21');
INSERT INTO student values(5,'pra', 'pune', '13', '20');
INSERT INTO student values(6,'Shr', 'chennai', '14', '21');

CREATE TABLE studentcourse (cid int(1), roll_no int, foreign key(roll_no) references student(roll_no));
Desc studentcourse;
INSERT INTO studentcourse values(1,2);
INSERT INTO studentcourse values(2,1);
INSERT INTO studentcourse values(3,3);
INSERT INTO studentcourse values(4,4);
SELECT * FROM student 
Inner join studentcourse 
ON student.roll_no = studentcourse.roll_no;
SELECT * FROM student 
left join studentcourse 
ON student.roll_no = studentcourse.roll_no;
SELECT * FROM student 
Right join studentcourse 
ON student.roll_no = studentcourse.roll_no;
SELECT * FROM student 
join studentcourse;
SELECT * FROM student;
CREATE VIEW newView AS 
SELECT student.name, student.roll_no, studentcourse.cid FROM student
LEFT JOIN studentcourse 
ON student.roll_no = studentcourse.roll_no;
SELECT * FROM newView;
SELECT * FROM student WHERE roll_no in
(SELECT roll_no FROM studentcourse);
SELECT * FROM student 
WHERE roll_no in 
(SELECT roll_no FROM studentcourse
WHERE student.age < 20);