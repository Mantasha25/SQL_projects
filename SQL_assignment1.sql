
---------------------------------------SQL ASSIGNMENT-----------------------------------

-- CREATING EMPLOYEE TABLE
Create table Employee (
Employee_id int not null primary key,
First_name varchar(20),
Last_name varchar(20),
Salary int,
Joining_date datetime,
Department varchar (20)); 

--INSERTING DATA INTO EMPLOYEE TABLE
Insert into Employee values
(1, 'Anika' , 'Arora',100000,'2020-02-14 9:00:00', 'HR'),
(2, 'Veena' , 'Veram',80000,'2011-06-15 9:00:00', 'Admin'),
(3, 'Vishal' , 'Singhal',300000,'2020-02-16 9:00:00', 'HR'),
(4, 'Sushanth' , 'Singh',500000,'2020-02-17 9:00:00', 'Admin'),
(5, 'Bhupal' , 'Bhati',500000,'2011-06-18 9:00:00', 'Admin'),
(6, 'Dheeraj' , 'Diwan',200000,'2011-06-19 9:00:00', 'Account'),
(7, 'Karan' , 'Kumar',75000,'2020-01-14 9:00:00', 'Account'),
(8, 'CHanrika' , 'Chauhan',90000,'2011-04-15 9:00:00', 'Admin');

Select * from Employee


--CREATING EMPLOYEE BONUS TABLE
Create Table Employee_bonus (
Employee_ref_id int foreign key references Employee(Employee_id),
Bonus_amount int,
Bonus_date Datetime);

--INSERTING DATA INTO EMPLOYEE_BONUS TABLE
Insert into Employee_bonus values
(1,5000,'2020-02-16 0:00:00'),
(2,3000,'2011-06-16 0:00:00'),
(3,4000,'2020-02-16 0:00:00'),
(1,4500,'2020-02-16 0:00:00'),
(2,3500,'2011-06-16 0:00:00');

Select * from Employee_bonus

--CREATING EMPLOYEE TITLE TABLE
Create Table Employee_title (
Employee_ref_id int foreign key references Employee(Employee_id),
Emp_title varchar(20),
Affective_date datetime);


--INSERTING DATA INTO EMPLOYEE_TITLE TABLE
Insert into Employee_title values
(1, 'Manager', '2016-02-20 0:00:00'),
(2, 'Executive', '2016-06-11 0:00:00'),
(8, 'Executive', '2016-06-11 0:00:00'),
(5, 'Manager', '2016-06-11 0:00:00'),
(4, 'Asst. Manager', '2016-06-11 0:00:00'),
(7, 'Executive', '2016-06-11 0:00:00'),
(6, 'Lead', '2016-06-11 0:00:00'),
(3, 'Lead', '2016-06-11 0:00:00');

Select * from Employee_title

/*
select * from Employee
Select * from Employee_bonus
Select * from Employee_title
*/

-----------------------------------TASK TO BE PERFORMED-------------------------------------

--1 Display the “FIRST_NAME” from Employee table using the alias name as Employee_name.

Select First_name as Employee_name from Employee

--2 Display “LAST_NAME” from Employee table in upper case.

Select upper(Last_name) from Employee

--3 Display unique values of DEPARTMENT from EMPLOYEE table.

Select distinct(Department) from Employee

--4 Display the first three characters of LAST_NAME from EMPLOYEE table.

Select Substring(Last_name,1,3) as Last_name from Employee

--5 Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.

Select  Department, Len(department) from Employee group by Department

--6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME. a space char should separate them.

Select Concat(First_name, ' ' , Last_name) as Full_name from Employee

--7 DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending.

Select * from Employee order by First_name 

--8. Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.

Select * from Employee order by First_name ASC, Department DESC 

--9 Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table.

SELECT * FROM EMPLOYEE WHERE FIRST_NAME IN ('VEENA', 'KARAN')

--10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”.

SELECT * FROM EMPLOYEE WHERE DEPARTMENT = 'ADMIN'

--11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.

SELECT * FROM EMPLOYEE WHERE FIRST_NAME LIKE '%V%'

--12 DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000.

SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 100000 AND 500000

--13 Display details of the employees who have joined in Feb-2020.

SELECT * FROM EMPLOYEE WHERE JOINING_DATE BETWEEN '2020-02-01' AND '2020-02-28'

--14 Display employee names with salaries >= 50000 and <= 100000.

SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS NAME, SALARY FROM EMPLOYEE WHERE SALARY >= 50000 AND SALARY <= 100000

--16 DISPLAY details of the EMPLOYEES who are also Managers.

SELECT * FROM EMPLOYEE INNER JOIN EMPLOYEE_TITLE
ON EMPLOYEE.EMPLOYEE_ID=EMPLOYEE_TITLE.EMPLOYEE_REF_ID
WHERE EMP_TITLE ='MANAGER'

--17 DISPLAY duplicate records having matching data in some fields of a table.

SELECT EMP_TITLE, AFFECTIVE_date, COUNT(*) AS NUM_DUPLICATESFROM Employee_titleGROUP BY EMP_TITLE, Affective_dateHAVING COUNT(*) > 1
--18 Display only odd rows from a table.

SELECT * FROM EMPLOYEE WHERE (EMPLOYEE_ID %2)=1

--19 Clone a new table from EMPLOYEE table.

CREATE TABLE new_employee 
(employee_id int, 
first_name varchar(20), 
last_name varchar(20),
salary int,
joining_date datetime, 
department varchar(20))
insert into new_employee select * from Employee

select * from new_employee

--20 DISPLAY the TOP 2 highest salary from a table.

SELECT TOP 2 SALARY FROM EMPLOYEE ORDER BY SALARY DESC

--21. DISPLAY the list of employees with the same salary.
	
Select distinct E.employee_id, E.FIRST_NAME, E.Salary from EMPLOYEE E, EMPLOYEE E1 where E.Salary = E1.Salary and E.Employee_id!= E1.Employee_id;


--22 Display the second highest salary from a table.

SELECT MAX(SALARY) FROM EMPLOYEE WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEE)

--23 Display the first 50% records from a table.

SELECT *FROM EMPLOYEEWHERE employee_id <= (SELECT count(Employee_id)/2 from EMPLOYEE);

--24. Display the departments that have less than 4 people in it.

SELECT DEPARTMENT , COUNT(EMPLOYEE_ID) FROM EMPLOYEE GROUP BY DEPARTMENT HAVING COUNT(EMPLOYEE_ID)<4

--25. Display all departments along with the number of people in there.

SELECT DEPARTMENT , COUNT(EMPLOYEE_ID) FROM EMPLOYEE GROUP BY DEPARTMENT

--26 Display the name of employees having the highest salary in each department.

select department, first_name, Salary from Employee where Salary in (select max(salary) from Employee group by Department)
--27 Display the names of employees who earn the highest salary.

SELECT FIRST_NAME, SALARY FROM Employee WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE)

--28 Diplay the average salaries for each department

SELECT DISTINCT(DEPARTMENT), AVG(SALARY) FROM EMPLOYEE GROUP BY DEPARTMENT 

--29 display the name of the employee who has got maximum bonus

SELECT E.FIRST_NAME, B.BONUS_AMOUNT FROM Employee AS E JOIN Employee_bonus AS B
ON E.Employee_id=B.Employee_ref_id
WHERE B.Bonus_amount= (SELECT MAX(Bonus_amount) FROM Employee_bonus)

--30 Display the first name and title of all the employees

SELECT E.First_name, T.EMP_TITLE FROM Employee AS E JOIN Employee_title AS T
ON E.Employee_id=T.Employee_ref_id 

