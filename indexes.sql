USE sql_store;
-- CREATE INDEX IN CUSTOMERS IN POINTS COLUNM

CREATE  INDEX  idx_points ON customers (points);

explain SELECT count(*)
 FROM customers 
WHERE points > 1000;

-- create full text index

USE sql_blog;
CREATE FULLTEXT INDEX idx_blog ON posts(title , body);

SELECT * FROM POSTS   -- without full text index
WHERE title like '%react%' ;

SELECT * FROM posts -- search with full text index
WHERE MATCH(title , body) AGAINST('react redux');

-- create full text index to search base on job title

USE sql_hr;

CREATE FULLTEXT INDEX idx_job_title ON employees (job_title);

SELECT * FROM employees
WHERE MATCH(job_title) AGAINST('staff account');

