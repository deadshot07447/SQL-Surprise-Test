-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
-- ans.
select * from org.worker ;
select first_name worker_name from org.worker;
 
-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
-- ans.
select upper(first_name) from org.worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
-- ans.
select distinct department from org.worker;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
-- ans.
select left(first_name ,3) from org.worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
-- ans.
select instr(first_name , 'b') from org.worker where first_name = 'amitabh';

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
--ans.
select rtrim(first_name) as first_name from org.worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
--ans.
select ltrim(first_name) as first_name from org.worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
--ans.
select distinct department , length(department) from org.worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
--ans.
select replace(first_name, 'a' , 'A') from org.worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
--ans.
select concat ( first_name  ," " ,LAST_NAME) from org.worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
--ans.
select * from org.worker order by first_name ;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
--ans.
mysql> select * from org.worker order by first_name asc , department desc;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
--ans.
select * from org.worker where first_name = 'vipul' and first_name = 'satish' ;

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
--ans.
select * from org.worker where first_name <> 'vipul' and first_name <> 'satish';

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
--ans.
select * from org.worker where department = 'admin';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
--ans.
select * from org.worker where first_name like '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
--ans.
select * from org.worker where first_name like '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
--ans.
select * from org.worker where first_name like  '%h' and first_name like '______';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
--ans.
select * from org.worker where salary between 100000 and 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
--ans.
select * from org.worker where month(joining_date) = 2;

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
--ans.
select count(first_name) from org.worker where department = 'admin'; 

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
--ans.
select first_name , LAST_NAME from org.worker where salary >= 50000 and salary <= 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
-- ans.
select department , count(department) from org.worker group by department order by department desc ;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
--ans.
select * from org.worker as T1 inner join org.title as T2 on T1.worker_id = T2.WORKER_REF_ID where T2.WORKER_TITLE = 'manager';

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
--ans.
select WORKER_REF_ID from title d where salary = (select salary from org.worker where salary = d.salary and first_name <> d.first_name);

-- Q-26. Write an SQL query to show only odd rows from a table.
-- ans.
select * from org.worker where worker_id%2 <> 0;


-- Q-27. Write an SQL query to show only even rows from a table. 
--ans.
select * from org.worker where worker_id%2 = 0;


-- Q-28. Write an SQL query to clone a new table from another table.
--ans.
CREATE table worker_clone like worker;
INSERT into worker_clone  select * from worker;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
--ans.
select * from worker T1 inner join  title T2 on T1.worker_id = T2.WORKER_REF_ID ;

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS
--ans.
select * from worker T1 left join bonus T2 on T1.worker_id = T2.WORKER_REF_ID ;

-- Q-31. Write an SQL query to show the current date and time.
-- DUAL
--ans.
SELECT CURRENT_DATE();

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
--ans.
select * from org.worker  order by salary desc limit 5; 

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
--ans.
select * from org.worker order by salary desc limit 5;

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
--ans.
select salary from worker d where 5 = (select count(salary) from worker where salary > d.salary );

-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
--ans.
select first_name from worker d where salary = (select salary from org.worker where salary = d.salary and first_name <> d.first_name);

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
--ans.
select nam from (select max(salary) as high , first_name as nam from org.worker group by first_name order by max(salary) desc) as will  where high < (select max(salary) from org.worker) limit 1;

-- Q-37. Write an SQL query to show one row twice in results from a table.
--ans.
select * from org.worker  
union all
select * from org.worker;


-- Q-38. Write an SQL query to list worker_id who does not get bonus.
--ans.
select T1.worker_id from org.worker T1 left join org.bonus T2 on T1.worker_id = T2.WORKER_REF_ID where T2.bonus_amount is null ;

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
--ans.
select * from org.worker where worker_id <= (select count(worker_id)/2 from worker) ;

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
--ans.
select department from org.worker group by department having count(department) < 4;


-- Q-41. Write an SQL query to show all departments along with the number of people in there.
--ans.
select department , count(department) as no_of_people from org.worker group by department;

-- Q-42. Write an SQL query to show the last record from a table.
--ans.
select * from org.worker  order by worker_id desc limit 1;

-- Q-43. Write an SQL query to fetch the first row of a table.
--ans.
select * from org.worker order by worker_id limit 1;

-- Q-44. Write an SQL query to fetch the last five records from a table.
--ans.
select * from org.worker order by worker_id desc limit 5;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
--ans.
select first_name , salary from org.worker where salary in(select max(salary) from org.worker group by department);

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery
-- ans.
select big from (select max(salary) big , first_name from org.worker group by first_name) as will order by big limit 3;


-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery
-- ans.
select small from (select min(salary) small , first_name from org.worker group by first_name) as will order by small limit 3;

-- Q-48. Write an SQL query to fetch nth max salaries from a table.
-- Ans.
select distinct salary from org.worker T1 where 5 =(select count(distinct salary) from org.worker T2 where T1.salary<T2.salary) order by salary desc;

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
-- ans.
select department , sum(salary) from org.worker group by department;

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
-- ans.
select nam from (select max(salary) as high , first_name as nam from org.worker group by first_name order by max(salary) desc) as will  where high = (select max(salary) from org.worker);
