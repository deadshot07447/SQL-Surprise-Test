-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select FIRST_NAME as WORKER_NAME from org.worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select upper(first_name) from org.worker;


-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct department from org.worker;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
select substring(first_name,1,3) from org.worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.


-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select rtrim(first_name) from org.worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select ltrim(first_name) from org.worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct department, length(department) as dep_length from org.worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.


-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
select concat(first_name,'   ',LAST_NAME) as COMPLETE_NAME from org.worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from org.worker order by first_name asc;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
select * from org.worker order by first_name asc, department desc;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from org.worker where first_name in ('vipul','satish');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from org.worker where first_name NOT in ('vipul','satish');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
select * from org.worker where department = 'Admin';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from org.worker where first_name like '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from org.worker where first_name like '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from org.worker where first_name like '%h' and length (first_name) = 6;

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from org.worker where salary between 100000 and 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select * from org.worker where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(*) from org.worker where department = 'Admin';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
select concat(FIRST_NAME,'  ', LAST_NAME) from org.worker where salary >= 50000 and salary <= 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
select department , count(*) as worker_count from org.worker group by department order by worker_count desc;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
select * from org.worker w join org.title t on w.worker_id = t.WORKER_REF_id where t.WORKER_TITLE = 'Manager';

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
select WORKER_TITLE, count(*) from org.title group by WORKER_TITLE having count(*)>1;

-- Q-26. Write an SQL query to show only odd rows from a table.
select * from org.worker where mod(worker_id,2)= 1;

-- Q-27. Write an SQL query to show only even rows from a table. 
select * from org.worker where mod(worker_id,2)= 0;


-- Q-28. Write an SQL query to clone a new table from another table.
create table org.NewWorker as select * from org.worker;
select * from org.NewWorker;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
select * from org.worker w inner join org.bonus b on w.worker_id = b.WORKER_REF_ID; 

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS
select * from org.worker where worker_id not in(select WORKER_REF_id from org.bonus);

-- Q-31. Write an SQL query to show the current date and time.
-- DUAL
select now();

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
select * from org.worker order by salary desc LIMIT 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select distinct salary from org.worker order by salary desc LIMIT 1 offset 4;

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
select distinct salary from org.worker w1 where 4 = (select count(distinct salary )from worker w2 where w2.salary>w1.salary);
 
-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
select * from org.worker w join(select salary from org.worker group by salary having count(*)>1)as s on w.salary = s.salary;

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
select max(salary) as second_Salary from org.worker where salary < (select max(salary) from org.worker);

-- Q-37. Write an SQL query to show one row twice in results from a table.
select * from org.worker union all select * from org.worker LIMIT 1;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.
select worker_id from org.worker where worker_id not in (select worker_id from org.bonus);

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
select  count(*)/2 from org.worker;

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
select department from org.worker group by department having count(*)<4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
select department, count(*) from org.woker group by department;

-- Q-42. Write an SQL query to show the last record from a table.
select * from org.worker order by worker_id desc LIMIT 1;

-- Q-43. Write an SQL query to fetch the first row of a table.
select * from org.woker limit 1;

-- Q-44. Write an SQL query to fetch the last five records from a table.
select * from org.woker order by worker_id desc limit 5;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
select first_name from org.worker w1 where salary = (select max(SALARY) from org.worker w2 where w1.department = w2.department);

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery
select distinct salary from org.worker w1 where 3 >(select count(distinct salary) from org.worker w2 where w1.salary<w2.salary) order by salary desc;

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery
select distinct salary from org.worker w1 where 3 >(select count(distinct salary) from org.worker w2 where w1.salary>w2.salary) order by salary desc;

-- Q-48. Write an SQL query to fetch nth max salaries from a table.
select distinct salary from org.worker w1 where n =(select count(distinct salary) from org.worker w2 where w1.salary<w2.salary) order by salary desc;


-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select department, sum(salary) from org.worker group by department;

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
select first_name from org.worker where salary=(select max(salary) from org.worker);
