CREATE DATABASE EMPLOYEE;

USE EMPLOYEE;

DROP DATABASE EMPLOYEE;

CREATE TABLE EMPLOYEE(
	ID INT PRIMARY KEY,
    FNAME VARCHAR (25),
    LNAME VARCHAR (25),
	AGE INT,
    EMAIL_ID VARCHAR(50) UNIQUE,
    PHONE_NO INT  UNIQUE,
    CITY VARCHAR(50)
    );

INSERT INTO EMPLOYEE VALUES 
	(1,'Aman','Proto', 32,'aman@gamil.com', 898,'Delhi'),
    (2,'Yagya','Narayan', 44,'yagya@gamil.com', 222,'Palam'),
    (3,'Rahul','BD', 22,'rahul@gamil.com', 444,'Kolkata'),
    (4,'Jatin','Hermit', 21,'jatin@gamil.com', 666,'Raipur'),
    (5,'PK','Pandey', 31,'pk@gamil.com', 555,'Jaipur');

SELECT * FROM EMPLOYEE;

CREATE TABLE CLIENT(
	ID INT PRIMARY KEY,
    FNAME VARCHAR (25),
    LNAME VARCHAR (25),
	AGE INT,
    EMAIL_ID VARCHAR(50) UNIQUE,
    PHONE_NO INT UNIQUE,
    CITY VARCHAR(50),
    EMP_ID INT,
    FOREIGN KEY(EMP_ID) REFERENCES EMPLOYEE(ID)
    );

INSERT INTO CLIENT VALUES 
	(1,'Mac','Rogers', 47,'mac@gamil.com',333 ,'Kolkata',3),
    (2,'Max','Poirier', 27,'max@gamil.com',222,'Kolkata',3),
    (3,'Peter','Jain', 24,'peter@gamil.com',111 ,'Delhi',1),
    (4,'Sushant','Aggrawal', 23,'sushant@gamil.com',454 ,'Hyderabad',5),
    (5,'Pratap','Singh', 36,'pratap@gamil.com',777 ,'Mumbai',2);

SELECT * FROM CLIENT;
    
CREATE TABLE PROJECT(
	ID INT PRIMARY KEY,
    EMP_ID INT,
    FOREIGN KEY(EMP_ID) REFERENCES EMPLOYEE(ID),
    NAME VARCHAR (25),
    START_DATE DATE,
    CLIENT_ID INT,
    FOREIGN KEY (CLIENT_ID) REFERENCES CLIENT(ID)
    );
    
INSERT INTO PROJECT VALUES
	(1,1,'A','2021-04-21',3),
    (2,2,'B','2021-03-12',1),
    (3,3,'C','2021-01-16',5),
    (4,3,'D','2021-04-27',2),
    (5,5,'E','2021-05-01',4);
    
SELECT * FROM PROJECT;	

-- SUB QUERIES

-- WHERE Clause same  table
-- employees with age > 30
SELECT * FROM EMPLOYEE WHERE AGE IN ( SELECT AGE FROM EMPLOYEE WHERE AGE > 30);

-- WHERE clause different table
-- emp details working in more than 1 project
SELECT * FROM EMPLOYEE WHERE ID IN 
(SELECT EMP_ID FROM PROJECT GROUP BY EMP_ID HAVING COUNT(EMP_ID) > 1);

-- SELECT clause
-- single value subquery
-- emp details having  age > avg(age)
SELECT * FROM EMPLOYEE WHERE AGE > (SELECT AVG(AGE) FROM EMPLOYEE);

-- FROM clause		--> MUST BE ALIAS
-- select max age person whose first name contains 'a'
SELECT MAX(AGE) FROM (SELECT * FROM EMPLOYEE WHERE FNAME LIKE '%a%') AS TEMP;

-- CORELATED SUBQUERY
-- find 3rd oldest employee
SELECT * FROM EMPLOYEE E1 
WHERE 3 = (
	SELECT COUNT(E2.AGE) FROM EMPLOYEE E2 WHERE E2.AGE >= E1.AGE
    );
    
    

-- VIEW
SELECT * FROM EMPLOYEE;

-- creating a view
CREATE VIEW custom_view AS SELECT FNAME, AGE FROM EMPLOYEE;

-- Viewing from view
SELECT * FROM custom_view;

-- Altering the view
ALTER VIEW custom_view AS SELECT FNAME,LNAME,AGE FROM EMPLOYEE;

-- Dropping the view
DROP VIEW IF EXISTS custom_view;