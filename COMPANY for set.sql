CREATE DATABASE COMPANY;

USE COMPANY;

CREATE TABLE DEPT1(
	empid INT PRIMARY KEY,
    name VARCHAR(50),
    role VARCHAR(50)
    );
    
INSERT INTO DEPT1 VALUES
	(1,'A','Engineer'),
    (2,'B','Salesman'),
    (3,'C','Manager'),
    (4,'D','Salesman'),
    (5,'E','Engineer');
    
SELECT * FROM DEPT1;

CREATE TABLE DEPT2(
	empid INT PRIMARY KEY,
    name VARCHAR(50),
    role VARCHAR(50)
    );
    
INSERT INTO DEPT2 VALUES
	(3,'C','Manager'),
    (6,'F','Marketing'),
    (7,'G','Salesman');
    
SELECT * FROM DEPT2;

-- SET OPERATIONS

-- List out all the employees in the company.
SELECT * FROM  DEPT1 
UNION  
SELECT* FROM DEPT2;

-- List out all the employees in all departments who work as salesman.
SELECT * FROM DEPT1 WHERE role = 'Salesman'
UNION
SELECT * FROM DEPT2 WHERE role = 'Salesman';

-- List out all the employees who work in all the departments.
SELECT DEPT1.* FROM DEPT1 INNER JOIN DEPT2 USING (empid);

-- List out all the employees working in dept1 but not in dept2.
SELECT DEPT1.* FROM DEPT1 LEFT JOIN DEPT2 USING(empid)
WHERE DEPT2.empid is NULL;
