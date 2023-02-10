CREATE DATABASE ORG;

SHOW DATABASES;

USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
	);
    
INSERT INTO Worker
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

SELECT * FROM Worker;

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
	REFERENCES Worker(WORKER_ID)
	ON DELETE CASCADE
	);
    
INSERT INTO Bonus
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');

SELECT * FROM Bonus;

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
	REFERENCES Worker(WORKER_ID)
	ON DELETE CASCADE
	);
    
INSERT INTO Title
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
		(001, 'Manager', '2016-02-20 00:00:00'),
		(002, 'Executive', '2016-06-11 00:00:00'),
		(008, 'Executive', '2016-06-11 00:00:00'),
		(005, 'Manager', '2016-06-11 00:00:00'),
		(004, 'Asst. Manager', '2016-06-11 00:00:00'),
		(007, 'Executive', '2016-06-11 00:00:00'),
		(006, 'Lead', '2016-06-11 00:00:00'),
		(003, 'Lead', '2016-06-11 00:00:00');
        
SELECT * FROM Title;

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT FIRST_NAME AS WORKER_NAME FROM WORker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UCASE(FIRST_NAME) FROM WORKER;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT DEPARTMENT FROM WORKER;
SELECT DEPARTMENT FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT)>1;

-- Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.
SELECT SUBSTRING(FIRST_NAME,1,3) FROM WORKER;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column 'Amitabh' from worker table.
SELECT INSTR(FIRST_NAME,'b') FROM WORKER WHERE FIRST_NAME = 'Amitabh';

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT RTRIM(FIRST_NAME) FROM WORKER;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(FIRST_NAME) FROM WORKER;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT DEPARTMENT, LENGTH(DEPARTMENT) FROM WORKER; 

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(FIRST_NAME,'A','A') FROM WORKER ;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS COMPLETE_NAME FROM WORKER;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM WORKER ORDER BY FIRST_NAME;
SELECT * FROM WORKER ORDER BY FIRST_NAME ASC;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by
-- FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM WORKER ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM WORKER WHERE FIRST_NAME IN ('VIPUL','SATISH');
SELECT * FROM WORKER WHERE FIRST_NAME ='VIPUL' OR FIRST_NAME='SATISH';

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT * FROM WORKER WHERE FIRST_NAME NOT IN('VIPUL','SATISH');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
SELECT * FROM WORKER WHERE DEPARTMENT LIKE 'ADMIN%';
SELECT * FROM WORKER WHERE DEPARTMENT='ADMIN';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE  '%A%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE  '%A';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE  '_____H' ;		-- 5 UNDERSCORE

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM WORKER WHERE SALARY BETWEEN 100000 AND 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM WORKER WHERE JOINING_DATE LIKE '2014-02%';
SELECT * FROM WORKER WHERE YEAR(JOINING_DATE)=2014 AND MONTH(JOINING_DATE)=02;

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT DEPARTMENT , COUNT(DEPARTMENT) FROM WORKER WHERE DEPARTMENT='ADMIN';
SELECT DEPARTMENT , COUNT(*) FROM WORKER WHERE DEPARTMENT='ADMIN';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
SELECT CONCAT(FIRST_NAME,' ', LAST_NAME ) AS FULL_NAME , SALARY FROM WORKER WHERE SALARY BETWEEN 50000 AND 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT, COUNT(DEPARTMENT) AS NO_OF_WORKER FROM WORKER GROUP BY DEPARTMENT ORDER BY COUNT(DEPARTMENT) DESC;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT W.* FROM WORKER AS W INNER JOIN TITLE AS T ON W.WORKER_ID = T.WORKER_REF_ID WHERE T.WORKER_TITLE='MANAGER';

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
SELECT WORKER_TITLE, COUNT(*) AS COUNT FROM TITLE GROUP BY WORKER_TITLE HAVING COUNT>1;
SELECT WORKER_TITLE, COUNT(WORKER_TITLE) AS COUNT FROM TITLE GROUP BY WORKER_TITLE HAVING COUNT>1;

-- Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM WORKER WHERE MOD(WORKER_ID,2) != 0;
SELECT * FROM WORKER WHERE MOD(WORKER_ID,2) <> 0;		-- NOT EQUAL (<>)

-- Q-27. Write an SQL query to show only even rows from a table.
SELECT * FROM WORKER WHERE MOD(WORKER_ID,2) = 0;

-- Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE WORKER_CLONE LIKE WORKER;
INSERT INTO WORKER_CLONE SELECT * FROM WORKER;
SELECT * FROM WORKER_CLONE;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
SELECT WORKER.* FROM WORKER INNER JOIN WORKER_CLONE  USING(WORKER_ID);

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS
SELECT WORKER.* FROM WORKER LEFT JOIN WORKER_CLONE USING (WORKER_ID) WHERE  WORKER_CLONE.WORKER_ID IS NULL;

-- Q-31. Write an SQL query to show the current date and time.
-- DUAL
SELECT NOW();
SELECT CURDATE() AS DATE, NOW() AS DATE_AND_TIME;

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
SELECT * FROM WORKER ORDER BY SALARY DESC LIMIT 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT * FROM WORKER ORDER BY SALARY DESC LIMIT 4;
SELECT * FROM WORKER ORDER BY SALARY DESC LIMIT 4,1;		-- AFTER 4TH ROW , SHOW NEXT 1 ROW

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
SELECT * FROM WORKER W1 WHERE 5 = (
	SELECT COUNT(SALARY) FROM WORKER W2 WHERE W2.SALARY >= W1.SALARY);
    
-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
SELECT W1.* FROM WORKER W1, WORKER W2 WHERE W1.SALARY = W2.SALARY AND W1.WORKER_ID <> W2.WORKER_ID;

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
SELECT MAX(SALARY) FROM WORKER WHERE SALARY NOT IN (SELECT MAX(SALARY) FROM WORKER);
SELECT MAX(SALARY) FROM WORKER where (SELECT MAX(SALARY) FROM WORKER WHERE SALARY NOT IN (
	SELECT MAX(SALARY) FROM WORKER));		-- 500000		, NOT WORKING
    
SELECT SALARY FROM WORKER W1 WHERE 3 = (SELECT DISTINCT COUNT(SALARY) FROM WORKER W2 WHERE W2.SALARY >= W1.SALARY); -- 3RD HIGHEST 

-- Q-37. Write an SQL query to show one row twice in results from a table.
SELECT * FROM WORKER 
UNION ALL
SELECT * FROM WORKER ORDER BY WORKER_ID;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.
SELECT W.WORKER_ID FROM WORKER AS W LEFT JOIN BONUS AS B ON W.WORKER_ID=B.WORKER_REF_ID WHERE B.WORKER_REF_ID IS NULL;
SELECT WORKER_ID FROM WORKER WHERE WORKER_ID NOT IN(SELECT WORKER_REF_ID FROM BONUS);

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
SELECT * FROM WORKER WHERE WORKER_ID <= (SELECT COUNT(WORKER_ID)/2 FROM WORKER );

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
SELECT DEPARTMENT , COUNT(*) FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(*)<4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
SELECT DEPARTMENT , COUNT(*) FROM WORKER GROUP BY DEPARTMENT;
-- Q-42. Write an SQL query to show the last record from a table.
SELECT * FROM WORKER WHERE WORKER_ID =  (SELECT MAX(WORKER_ID) FROM WORKER);
SELECT MAX(WORKER_ID) FROM WORKER;			-- 8

-- Q-43. Write an SQL query to fetch the first row of a table.
SELECT * FROM WORKER WHERE WORKER_ID =  (SELECT MIN(WORKER_ID) FROM WORKER);

-- Q-44. Write an SQL query to fetch the last five records from a table.
(SELECT * FROM WORKER ORDER BY WORKER_ID DESC LIMIT 5) ORDER BY WORKER_ID;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT * FROM WORKER WHERE SALARY IN (SELECT  MAX(SALARY) FROM WORKER GROUP BY DEPARTMENT);
SELECT W.DEPARTMENT,W.FIRST_NAME,W.SALARY FROM (SELECT MAX(SALARY) AS MAXSAL , DEPARTMENT FROM WORKER GROUP BY DEPARTMENT) TEMP
INNER JOIN
WORKER W ON TEMP.MAXSAL=W.SALARY AND W.DEPARTMENT = TEMP.DEPARTMENT;

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery
SELECT DISTINCT SALARY FROM WORKER W1 WHERE 3 >= 
	(SELECT COUNT(DISTINCT SALARY) FROM WORKER W2 WHERE W1.SALARY <= W2.SALARY ORDER BY W1.SALARY DESC);
    
-- DRY RUN AFTER REVISING THE CORELATED  SUBQUERY CONCEPT FROM LEC-9.
SELECT DISTINCT SALARY FROM WORKER ORDER  BY SALARY DESC LIMIT 3;

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery
SELECT DISTINCT SALARY FROM WORKER W1 WHERE 3 >= 
	(SELECT COUNT(DISTINCT SALARY) FROM WORKER W2 WHERE W1.SALARY >= W2.SALARY);
    
-- Q-48. Write an SQL query to fetch nth max salaries from a table.
SELECT DISTINCT SALARY FROM WORKER W1 WHERE N >= 
	(SELECT COUNT(DISTINCT SALARY) FROM WORKER W2 WHERE W1.SALARY <= W2.SALARY);
    
-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT DISTINCT DEPARTMENT, SUM(SALARY) AS TOTAL FROM WORKER GROUP BY DEPARTMENT ORDER BY TOTAL DESC;

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT FIRST_NAME, SALARY  FROM WORKER WHERE SALARY = (SELECT MAX(SALARY) FROM WORKER);

-- Q- 51.
CREATE TABLE RENEW(
	A INT,
    B INT);
    
INSERT INTO RENEW VALUES 
	(1,2),
    (2,4),
    (2,1),
    (3,2),
    (4,2),
    (5,6),
    (6,5),
    (7,8);

SELECT * FROM RENEW;

-- METHOD - 1 (JOIN)
SELECT LT.* FROM RENEW LT LEFT JOIN RENEW RT ON LT.A=RT.B AND LT.B=RT.A
WHERE RT.A IS NULL OR LT.A < RT.A;

-- METHOD - 2(CO RELATED SUBQUERIES)
SELECT * FROM RENEW R1 WHERE NOT EXISTS 
(SELECT * FROM RENEW R2 WHERE R1.A=R2.B AND R1.B = R2.A AND R1.A > R2.A);