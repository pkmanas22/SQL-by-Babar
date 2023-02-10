
-- COMMENT LINE

-- SELECT
SELECT 44+31;
SELECT  now();
select ucase('manas');
select * from  worker;

-- WHERE
select * from  worker where salary > 100000;
select * from  worker where DEPARTMENT = 'HR';

-- COMMENT LINE

select * from  worker where salary between 40000 and 60000;

-- REDUCE OR stamenents
-- HR, CEO
select * from  worker where DEPARTMENT = 'HR' or DEPARTMENT = 'CEO';

-- beter way
select * from  worker where DEPARTMENT in ('HR','CEO');

-- not
select * from  worker where DEPARTMENT not in  ('HR','CEO');

-- isnull
select * from  worker where salary is null;

-- wildcart
select * from  worker where first_name like '_s_';

-- order by
select * from worker order by SALARY desc;
select * from worker order by SALARY asc;		-- by default ascending

-- distinct
select department from worker;
select distinct department from worker;

-- AGGREGRATION
-- group by
select department from worker group by DEPARTMENT;		-- treat as distict 
 
 -- COUNT
 select department, COUNT(SALARY) from worker group by DEPARTMENT;
 
 -- AVERAGE SALARY PER DEPARTMENT
select department, AVG(SALARY) from worker group by DEPARTMENT;

-- MIN
select department, MIN(SALARY) from worker group by DEPARTMENT;

-- MAX
select department, MAX(SALARY) from worker group by DEPARTMENT;

-- SUM 
select department, SUM(SALARY) from worker group by DEPARTMENT;

-- GROUP BY HAVING
 select department, COUNT(SALARY) from worker group by DEPARTMENT HAVING COUNT(SALARY) > 2;