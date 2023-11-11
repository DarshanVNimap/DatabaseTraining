INSERT INTO department (name) values
 ("computer engineer"), 
 ("IT"),
 ("AIML"),
 ("Data Engineer");
 
 INSERT INTO student (name , email, department_id) VALUES
 ("Darshan" , "darshan@gmail.com" , 1),
 ("Gaurav" , "sanchela@gmail.com" , 3),
 ("Rahul" , "rahul@gmail.com" , 1),
 ("Salman khan","khan@gmail.com",2);
 
 SELECT * FROM department;
 
 -- demonstrate  not , or operator
 SELECT * FROM student 
 WHERE not (department_id >= 2 or student_id > 2);
 
 -- demonstrate and
 SELECT name FROM department
 WHERE department_id >= 2 and department_id <=4;
 
 -- demonstrate in
 
 SELECT * FROM student
 WHERE department_id in (2,3);
 
 -- demonstrate between 
 SELECT * FROM department
 WHERE department_id between 2 AND 4;
 
 -- like oprator
 SELECT * FROM student
 where name like "%an%";
 
 -- regular expression , order by and limit
 
 SELECT * FROM student
 where email REGEXP "^[dr]"
 order by student_id desc
 limit 1,1;
 