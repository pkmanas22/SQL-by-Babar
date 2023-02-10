USE CUSTOMER;
CREATE TABLE ACCOUNT(
	ID INT primary KEY,
    NAME VARCHAR(250) UNIQUE,
    BALANCE INT,
    constraint BALANCE_CHECK CHECK (BALANCE>1000)
	);
    
insert INTO ACCOUNT VALUES
	(1,'Manas',10000);

insert INTO ACCOUNT VALUES
	-- (2,'Manas',10000);   AS duplicate entry
    -- (2,'Mana',1000); 		Balance is violated as check
    (2,'Mana',1001); 
    
SELECT * FROM ACCOUNT;

DROP TABLE ACCOUNT;

CREATE TABLE ACCOUNT(
	ID INT primary KEY,
    NAME VARCHAR(250) UNIQUE,
    BALANCE INT NOT NULL DEFAULT 0
	);
    
insert INTO ACCOUNT 
	(ID, NAME) VALUES
		(1,'Manas');
        
SELECT * FROM ACCOUNT;