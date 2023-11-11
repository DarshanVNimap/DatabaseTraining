-- inner join 

SELECT s.name , email , d.name as department FROM student s
JOIN department d
	ON  s.department_id = d.department_id;
    
-- join more than 2 table

SELECT 
	s.student_id,
    s.email,
    d.name AS department,
    c.name AS city
FROM student s
JOIN department d
	ON s.department_id = d.department_id
JOIN city c
	ON s.city_id = c.city_id;


-- left outer join

SELECT s.name , d.name AS Department
FROM student s
LEFT JOIN department d
	ON s.department_id = d.department_id;

-- right outer join and Using Clause	

SELECT s.name,d.name as department, c.name AS city
FROM student s
RIGHT JOIN city c
	USING (city_id)
left JOIN department d
	USING (department_id); 

-- Union

SELECT name , 'ACTIVE' AS status from student
UNION
SELECT name , 'DEACTIVE' AS status from city ;