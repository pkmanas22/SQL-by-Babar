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

-- INNER JOIN
-- Enlist all the emplyees ID's, names along with the project allocated to them.
SELECT E.*,P.* FROM EMPLOYEE AS E INNER JOIN PROJECT AS P ON E.ID= P.EMP_ID; 			-- ALL
SELECT E.ID, E.FNAME, E.LNAME,P.ID, P.NAME FROM EMPLOYEE AS E INNER JOIN PROJECT AS P ON E.ID= P.EMP_ID;		-- SELECTED

-- Fetch out all the employee ID's and their contact detail who have been working
-- from jaipur with the clients name working in Hyderabad.
SELECT E.ID,E.FNAME,E.EMAIL_ID,E.PHONE_NO,C.FNAME,C.LNAME FROM EMPLOYEE AS E INNER JOIN CLIENT AS C ON E.ID= C.EMP_ID 
WHERE E.CITY= 'Jaipur' AND C.CITY = 'Hyderabad';

-- LEFT JOIN
-- Fetch out each project allocated to each employee.
SELECT * FROM EMPLOYEE AS E LEFT JOIN PROJECT AS P ON E.ID = P.EMP_ID;

-- RIGHT JOIN
-- List out all the projects along with the employee's name and their respective allocated email ID.
SELECT E.FNAME,E.LNAME,E.EMAIL_ID,P.* FROM EMPLOYEE AS E RIGHT JOIN PROJECT AS P ON E.ID = P.EMP_ID;
SELECT P.ID,P.NAME,P.START_DATE,E.FNAME,E.LNAME,E.EMAIL_ID FROM EMPLOYEE AS E RIGHT JOIN PROJECT AS P ON E.ID = P.EMP_ID;

-- CROSS JOIN
-- List out all the combinations possibe for the employee's name and projects that can exist.
SELECT E.FNAME,E.LNAME,P.ID,P.NAME FROM EMPLOYEE AS E CROSS JOIN PROJECT AS P;	-- 5*5=25

-- WITHOUT JOIN
SELECT E.ID, E.FNAME, E.LNAME,P.ID, P.NAME FROM EMPLOYEE AS E , PROJECT AS P WHERE E.ID= P.EMP_ID;		