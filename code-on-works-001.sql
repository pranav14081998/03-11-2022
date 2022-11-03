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
 
 -- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
 
 Select FIRST_NAME AS WORKER_NAME from Worker;
 
 -- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
 
 Select upper(FIRST_NAME) from Worker;
 
 -- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
 
 Select distinct DEPARTMENT from Worker;
 
 -- Q-4. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
 
 Select CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'COMPLETE_NAME' from Worker;
 
 -- Q-5. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
 
 Select * from Worker order by FIRST_NAME asc;
 
 -- Q-6. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
 
 Select * from Worker order by FIRST_NAME asc,DEPARTMENT desc;
 
 -- Q-7. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
 
 Select * from Worker where FIRST_NAME in ('Vipul','Satish');
 
 -- Q-8. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
 
 Select * from Worker where FIRST_NAME not in ('Vipul','Satish');
 
 -- Q-9. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
 
 Select * from Worker where DEPARTMENT like 'Admin%';
 
 -- Q-10. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
 
 Select * from Worker where FIRST_NAME like '%a%';
 
 -- Q-11. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
 
 Select * from Worker where FIRST_NAME like '%a';
 
 -- Q-12. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
 
 Select * from Worker where FIRST_NAME like '_____h';
 
 -- Q-13. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
 
 Select * from Worker where SALARY between 100000 and 500000;
 
 -- Q-14. Write an SQL query to print details of the Workers who have joined in Feb’2014.
 
 Select * from Worker where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;
 
 -- Q-15. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
 
 SELECT COUNT(*) FROM worker WHERE DEPARTMENT = 'Admin';
 
 -- Q-16. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
 
 SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM worker 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM worker 
WHERE Salary BETWEEN 50000 AND 100000);

-- Q-17. Write an SQL query to fetch the no. of workers for each department in the descending order.

SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers 
FROM worker 
GROUP BY DEPARTMENT 
ORDER BY No_Of_Workers DESC;

-- Q-18. Write an SQL query to print details of the Workers who are also Managers.

SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');

-- Q-19. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

-- Q-20. Write an SQL query to show only odd rows from a table.

SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) <> 0;

-- Q-21. Write an SQL query to show only even rows from a table.

SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) = 0;

-- Q-22. Write an SQL query to show the current date and time.

SELECT NOW();

-- Q-23. Write an SQL query to show the top n (say 10) records of a table.

SELECT * FROM Worker
 ORDER BY Salary DESC 
LIMIT 10;

-- Q-24. Write an SQL query to determine the nth (say n=5) highest salary from a table.

SELECT first_name, salary FROM Worker 
ORDER BY salary DESC 
LIMIT 5;

-- Q-25. Write an SQL query to fetch the list of employees with the same salary.

Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID;

-- Q-26. Write an SQL query to show the second highest salary from a table.

Select max(Salary) from Worker 
where Salary not in (Select max(Salary) from Worker);

-- Q-27. Write an SQL query to fetch the first 50% records from a table.

SELECT * FROM WORKER
WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker);

-- Q-28. Write an SQL query to fetch the departments that have less than five people in it.

SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers'
 FROM Worker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5;

-- Q-29. Write an SQL query to show all departments along with the number of people in there.

SELECT DEPARTMENT, COUNT(DEPARTMENT) as 'Number of Workers'
 FROM Worker GROUP BY DEPARTMENT;
 
 -- Q-30. Write an SQL query to show the last record from a table.
 
 Select * from Worker
 where WORKER_ID = (SELECT max(WORKER_ID) from Worker);
 
 -- Q-31. Write an SQL query to fetch the first row of a table.
 
 Select * from Worker
 where WORKER_ID = (SELECT min(WORKER_ID) from Worker);
 
 -- Q-32. Write an SQL query to fetch three max salaries from a table.
 
 SELECT distinct Salary
 from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary)
 order by a.Salary desc;
 
 -- Q-33. Write an SQL query to fetch three min salaries from a table.
 
 SELECT distinct Salary 
 from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary >= b.Salary)
 order by a.Salary desc;
 
 -- Q-34. Write an SQL query to fetch departments along with the total salaries paid for each of them.
 
  SELECT DEPARTMENT, sum(Salary)
  from worker
  group by DEPARTMENT;
  
  -- Q-35. Write an SQL query to fetch the names of workers who earn the highest salary.

SELECT FIRST_NAME, SALARY
 from Worker
 WHERE SALARY=(SELECT max(SALARY) from Worker);
 