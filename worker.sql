create database  IF NOT EXISTS WORKER;
SHOW DATABASES;
USE WORKER;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY auto_increment,
	FIRST_NAME VARCHAR(25),
	LAST_NAME VARCHAR(25),
	SALARY INT (15),
	JOIN_DATE DATETIME,
	DEPARTMENT varchar(25)
	);

INSERT INTO Worker
	(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOIN_DATE,DEPARTMENT) VALUES
		('001','Manas','Pradhan','500000','2020-10-25 10:00:00','CEO'),
        ('002','AVC','PraJGJdhan','60000','2020-10-18 10:00:00','sweeper'),
        ('003','DRF','HJFH','40000','2020-12-25 10:00:00','HR'),
        ('004','EDF','RTWT','60000','2020-10-25 10:00:00','MD'),
        ('005','FHF','FGSG','80000','2020-10-25 10:00:00','HR'),
        ('006','EEE','GDSGG','45000','2020-10-25 10:00:00','HR');

INSERT INTO Worker
	(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOIN_DATE,DEPARTMENT) VALUES
		('007','sss','ppp',null,'2020-10-25 10:00:00','admin');
select * FROM Worker;

CREATE TABLE BONUS (
	WORK_REF_ID INT,
    BONUS_AMOUNT INT ,
    BONUS_DATE date,
    foreign key (WORK_REF_ID)
		references Worker (WORKER_ID)
        on delete cascade
    );
    
INSERT INTO BONUS
	(WORK_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES 
		('001','5000','2019-10-12'),
        ('002','5000','2020-10-12'),
        ('003','5000','2019-11-12'),
        ('004','5000','2019-10-08'),
        ('005','5000','2019-09-12'),
        ('006','5000','2019-10-22');

select * FROM BONUS;
	
CREATE TABLE Title (
	WORK_REF_ID INT,
    WORK_TITLE VARCHAR(25),
    AFFECTED_FROM DATE,
    foreign key (WORK_REF_ID)
		references Worker (WORKER_ID)
        on delete cascade
    );
DROP table Title;   
INSERT INTO Title
	(WORK_REF_ID, WORK_TITLE, AFFECTED_FROM) VALUES 
		('001','CEO','2019-10-12'),
        ('002','Asst. Manager','2020-10-12'),
        ('003','5000','2019-11-12'),
        ('004','Manager','2019-10-08'),
        ('005','5000','2019-09-12'),
        ('006','Lead','2019-10-22');

select * FROM Title;