
--CREATING PROGRAMMER TABLE

CREATE TABLE PROGRAMMER (
PNAME VARCHAR(20) PRIMARY KEY,
DOB varchar(20),
DOJ varchar(20),
GENDER VARCHAR(2),
PROF1 VARCHAR(20),
PROF2 VARCHAR(20),
SALARY INT);

SELECT * FROM PROGRAMMER

--INSERTING DATA INTO PROGRAMMER

INSERT INTO PROGRAMMER VALUES
('ANAND', '12-Apr-66', '21-Apr-92', 'M', 'PASCAL', 'BASIC', 3200),
('ALTAF', '02-Jul-64', '30-Nov-90', 'M', 'CLIPPER', 'COBOL', 2800),
('JULIANA', '31-Jan-60', '21-Apr-90', 'F', 'COBOL', 'DBASE', 3000),
('KAMALA', '30-Oct-68', '02-Jan-92', 'F', 'C', 'DBASE', 2900),
('MARY', '24-Jun-70', '01-Feb-91', 'F', 'CPP', 'ORACLE', 4500),
('NELSON', '11-Sep-85', '11-Oct-89', 'M', 'COBOL', 'DBASE', 2500),
('PATTRICK', '10-Nov-65', '21-Apr-90', 'M', 'PASCAL', 'CLIPPER', 2800),
('QADIR', '31-Aug-65', '21-Apr-91', 'M', 'ASSEMBLY', 'C', 3000),
('RAMESH', '03-May-67', '28-Feb-91', 'M', 'PASCAL', 'DBASE', 3200),
('REBECCA', '01-Jan-67', '01-Dec-90', 'F', 'BASIC', 'COBOL', 2500),
('REMITHA', '19-Apr-70', '20-Apr-93', 'F', 'C', 'ASSEMBLY', 3600),
('REVATHI', '02-Dec-69', '02-Jan-92', 'F', 'PASCAL', 'BASIC', 3700),
('VIJAYA', '14-Dec-65', '02-May-92', 'F', 'FOXPRO', 'C', 3500);


--CREATING STUDIES TABLE--

CREATE TABLE STUDIES(
PNAME VARCHAR(20) FOREIGN KEY REFERENCES PROGRAMMER(PNAME),
INSTITUTE VARCHAR(20),
COURSE VARCHAR(20),
COURSE_FEE INT);

--INSERTING DATA --

INSERT INTO STUDIES VALUES
('ANAND', 'SABHARI', 'PGDCA', 4500),
('ALTAF', 'COIT', 'DCA', 7200),
('JULIANA', 'BDPS', 'MCA', 22000),
('KAMALA', 'PRAGATHI', 'DCA', 5000),
('MARY', 'SABHARI', 'PGDCA', 4500),
('NELSON', 'PRAGATHI', 'DAP', 6200),
('PATTRICK', 'PRAGATHI', 'DCAP', 5200),
('QADIR', 'APPLE', 'HDCA', 14000),
('RAMESH', 'SABHARI', 'PGDCA', 4500),
('REBECCA', 'BRILLIANT', 'DCAP', 11000),
('REMITHA', 'BDPS', 'DCS', 6000),
('REVATHI', 'SABHARI', 'DAP', 5000),
('VIJAYA', 'BDPS', 'DCA', 48000);

SELECT * FROM STUDIES

-- CREATING SOFTWARE TABLE--

CREATE TABLE SOFTWARE (
PNAME VARCHAR(20)FOREIGN KEY REFERENCES PROGRAMMER(PNAME),
TITLE VARCHAR(20),
DEVELOPIN VARCHAR(20),
SCOST FLOAT,
DCOST INT,
SOLD INT);

SELECT * FROM SOFTWARE

--INSERTING INTO SOFTWARE 

INSERT INTO SOFTWARE VALUES
('MARY', 'README', 'CPP', 300, 1200, 84),
('ANAND', 'PARACHUTES', 'BASIC', 399.95, 6000, 43),
('ANAND', 'VIDEO TITLING', 'PASCAL', 7500, 16000, 9),
('JULIANA', 'INVENTORY', 'COBOL', 3000, 3500, 0),
('KAMALA', ' PAYROLL PKG.', 'DBASE', 9000, 20000, 7),
('MARY', 'FINANCIAL ACCT.', 'ORACLE', 18000, 85000, 4),
('MARY', 'CODE GENERATOR ', 'C', 4500, 20000, 23),
('PATTRICK', 'README', 'CPP', 300, 1200, 84),
('QADIR', 'BOMBS AWAY ', 'ASSEMBLY', 750, 3000, 11),
('QADIR', 'VACCINES', 'C', 1900, 3100, 21),
('RAMESH', 'HOTEL MGMT.', 'DBASE', 13000, 35000, 4),
('RAMESH', 'DEAD LEE', 'PASCAL', 599.95, 4500, 73),
('REMITHA', 'PC UTILITIES', 'C', 725, 5000, 51),
('REMITHA', 'TSR HELP PKG', 'ASSEMBLY', 2500, 6000, 7),
('REVATHI', 'HOSPITAL MGMT', 'PASCAL', 1100, 75000, 2),
('VIJAYA', 'TSR EDITOR ', 'C', 900, 700, 6);


-------------------------------------------------------------------------------------

-------------------------------------TASKS TO BE DONE--------------------------------
/*
Problem Statement:
Consider yourself to be Sam and you have been given the below tasks to complete using 
the Table – STUDIES, SOFTWARE & PROGRAMMER. 
Tasks to be performed:*/

--1. Find out the selling cost AVG for packages developed in Pascal. 

SELECT DEVELOPIN, AVG(SCOST) FROM SOFTWARE WHERE DEVELOPIN ='PASCAL' GROUP BY DEVELOPIN

--2. Display Names, Ages of all Programmers.		
 
 SELECT	P.PNAME, DATEDIFF(YEAR, P.DOB, GETDATE()) AS AGE FROM PROGRAMMER AS P

--3. Display the Names of those who have done the DAP Course. 

SELECT PNAME, COURSE FROM STUDIES WHERE COURSE='DAP' GROUP BY COURSE , PNAME

--4. Display the Names and Date of Births of all Programmers Born in January. 

SELECT PNAME, DOB FROM PROGRAMMER WHERE MONTH(DOB) = 1

--5. What is the Highest Number of copies sold by a Package? 

SELECT TITLE, SOLD FROM SOFTWARE WHERE SOLD = (SELECT MAX(SOLD) FROM SOFTWARE) GROUP BY TITLE, SOLD 

--6. Display lowest course Fee. 

SELECT MIN(COURSE_FEE) AS MIN_FEE FROM STUDIES

--7. How many programmers done the PGDCA Course? 

SELECT COUNT(COURSE) AS PGDCA_PROGRAMMERS FROM STUDIES WHERE COURSE='PGDCA'

--8. How much revenue has been earned through sales of Packages Developed in C.

 SELECT DEVELOPIN, SUM((SCOST * SOLD)-DCOST) AS REVENUE FROM SOFTWARE WHERE DEVELOPIN='C' GROUP BY DEVELOPIN

--9. Display the Details of the Software Developed by Ramesh. 

SELECT * FROM SOFTWARE WHERE PNAME = 'RAMESH'

--10. How many Programmers Studied at Sabhari? 

SELECT COUNT(PNAME) AS NUM_OF_PROGRAMMER, INSTITUTE FROM STUDIES WHERE INSTITUTE ='SABHARI' GROUP BY INSTITUTE

--11. Display details of Packages whose sales crossed the 2000 Mark. 

SELECT * FROM SOFTWARE WHERE SCOST>2000				--doubt

--12. Display the Details of Packages for which Development Cost have been recovered. 

SELECT * FROM SOFTWARE WHERE DCOST<=SCOST			

--13. What is the cost of the costliest software development in Basic? 

SELECT DEVELOPIN, MAX(SCOST) AS MAX_COST FROM SOFTWARE GROUP BY DEVELOPIN HAVING DEVELOPIN = 'BASIC'

--14. How many Packages Developed in DBASE? 

SELECT COUNT(DEVELOPIN) AS DEVELOP_IN_DBASE FROM SOFTWARE WHERE DEVELOPIN = 'DBASE'

--15. How many programmers studied in Pragathi? 

SELECT PNAME, INSTITUTE FROM STUDIES WHERE INSTITUTE = 'PRAGATHI'

--16. How many Programmers Paid 5000 to 10000 for their course? 

SELECT * FROM STUDIES WHERE COURSE_FEE BETWEEN 5000 AND 10000

---17. What is AVG Course Fee 

SELECT COURSE, AVG(COURSE_FEE) AS AVG_FEE FROM STUDIES GROUP BY COURSE

--18. Display the details of the Programmers Knowing C.

SELECT * FROM PROGRAMMER WHERE PROF1 = 'C' OR PROF2= 'C'

--19. How many Programmers know either COBOL or PASCAL. 

SELECT * FROM PROGRAMMER 
WHERE PROF1= 'COBOL' OR
PROF1 = 'PASCAL' OR
PROF2 = 'COBOL' OR
PROF2 = 'PASCAL'

--20. How many Programmers Don’t know PASCAL and C 

SELECT * FROM PROGRAMMER WHERE PROF1 <> 'C' AND
PROF1 <> 'PASCAL' AND
PROF2 <> 'C' AND
PROF2 <> 'PASCAL'

--21. How old is the Oldest Male Programmer. 

SELECT MAX(AGE) AS OLDEST_AGE FROM (
SELECT PNAME,GENDER, (DATEDIFF(YEAR, dOB, GETDATE())) AS AGE FROM PROGRAMMER WHERE GENDER = 'M') AS P

--22. What is the AVG age of Female Programmers? 

SELECT AVG(AGE) AS AVG_AGE FROM( SELECT GENDER, DATEDIFF(YEAR, DOB, GETDATE()) AS AGE FROM PROGRAMMER WHERE GENDER = 'F') AS P

--23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order. 

SELECT PNAME, DATEDIFF(YEAR, DOJ, GETDATE()) AS EXPERIENCE FROM PROGRAMMER ORDER BY PNAME DESC 

--24. Who are the Programmers who celebrate their Birthday’s During the Current Month? 

SELECT * FROM (SELECT PNAME, DATEPART(MONTH, DOB) AS BIRTH_MONTH  FROM PROGRAMMER) AS P WHERE BIRTH_MONTH = 6 

--25. How many Female Programmers are there? 

SELECT COUNT(PNAME) AS FEMALE_PROGRAMMER FROM PROGRAMMER WHERE GENDER = 'F'

--26. What are the Languages studied by Male Programmers. 

SELECT PROF1, PROF2 FROM PROGRAMMER WHERE GENDER = 'M'

--27. What is the AVG Salary? 

SELECT AVG(SALARY) AS AVG_SALARY FROM PROGRAMMER

--28. How many people draw salary 2000 to 4000? 

SELECT COUNT(PNAME) AS TOTAL_PEOPLE , SALARY FROM PROGRAMMER WHERE SALARY BETWEEN 2000 AND 4000 GROUP BY SALARY

--29. Display the details of those who don’t know Clipper, COBOL or PASCAL. 

SELECT * FROM PROGRAMMER WHERE 
PROF1 <> 'CLIPPER' AND
PROF1 <> 'COBOL' AND
PROF1 <> 'PASCAL' AND
PROF2 <> 'CLIPPER' AND
PROF2 <> 'COBOL' AND
PROF2 <> 'PASCAL' 

--30. Display the Cost of Package Developed By each Programmer. 

SELECT PNAME, SUM(DCOST) AS DEV_COST FROM SOFTWARE GROUP BY PNAME

--31. Display the sales values of the Packages Developed by the each Programmer. 

SELECT PNAME, (SCOST*SOLD )AS SALES FROM SOFTWARE		 

--32. Display the Number of Packages sold by Each Programmer. 

SELECT PNAME, COUNT(TITLE) AS PACKAGES_SOLD FROM SOFTWARE GROUP BY PNAME

--33. Display the sales cost of the packages Developed by each Programmer Language wise.

SELECT PNAME, DEVELOPIN, SUM(SCOST)FROM SOFTWARE GROUP BY PNAME, DEVELOPIN

--34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy. 

SELECT DEVELOPIN, AVG(DCOST) AS AVG_DEV_COST, AVG(SCOST) AS AVG_SELLING_COST, AVG(SOLD) AS AVG_PRICE_percopy
FROM SOFTWARE GROUP BY DEVELOPIN

--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her.

SELECT PNAME, MAX(DCOST) AS COSTLIEST, MIN(DCOST) AS CHEAPEST FROM SOFTWARE GROUP BY PNAME	

--36. Display each institute name with number of Courses, Average Cost per Course. 

SELECT INSTITUTE,COUNT(COURSE) AS NO_OF_COURSES, AVG(COURSE_FEE) AS AVG_FEE FROM STUDIES GROUP BY INSTITUTE

--37. Display each institute Name with Number of Students. 

SELECT INSTITUTE, COUNT(PNAME) AS NO_OF_STUDENTS FROM STUDIES GROUP BY INSTITUTE

--38. Display Names of Male and Female Programmers. Gender also. 

SELECT PNAME, GENDER FROM PROGRAMMER

--39. Display the Name of Programmers and Their Packages. 

SELECT PNAME, TITLE FROM SOFTWARE

--40. Display the Number of Packages in Each Language Except C and C++. 

SELECT COUNT(TITLE) AS NO_OF_PACKAGE, DEVELOPIN FROM SOFTWARE 
GROUP BY DEVELOPIN 
HAVING DEVELOPIN <> 'C' AND DEVELOPIN <> 'C++'

--41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.

SELECT COUNT(TITLE) AS NO_OF_PACKAGE, DEVELOPIN FROM SOFTWARE 
GROUP BY DEVELOPIN , DCOST
HAVING DCOST<1000

--42. Display AVG Difference between SCOST, DCOST for Each Package. 

SELECT TITLE, (AVG(DCOST)-AVG(SCOST)) AS AVG_DIFFERENCE FROM SOFTWARE GROUP BY TITLE

--43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer 
--for Those Whose Cost has not yet been Recovered. 

SELECT PNAME, SUM(SCOST) AS S_COST, SUM(DCOST) D_COST, ((SCOST*SOLD)-DCOST) AS AMT_TOBE_RECOVERED FROM SOFTWARE
WHERE (SCOST*SOLD)<DCOST GROUP BY PNAME ,SCOST,DCOST ,SOLD

--44. Display Highest, Lowest and Average Salaries for those earning more than 2000. 

SELECT MAX(SALARY) AS HIGHEST, MIN(SALARY) AS LOWEST, AVG(SALARY) AS AVERAGE FROM PROGRAMMER WHERE SALARY>2000 

--  45. Who is the Highest Paid C Programmers? 

SELECT PNAME,SALARY FROM PROGRAMMER WHERE SALARY = (SELECT MAX(SALARY) FROM PROGRAMMER WHERE PROF1 = 'C' OR PROF2= 'C')
 
--46. Who is the Highest Paid Female COBOL Programmer? 

SELECT PNAME,SALARY FROM PROGRAMMER
WHERE SALARY = (SELECT MAX(SALARY) FROM PROGRAMMER WHERE (PROF1 = 'COBOL' OR PROF2= 'COBOL')) AND GENDER = 'F'

--47. Display the names of the highest paid programmers for each Language.			

SELECT DISTINCT PNAME, SALARY, PROF1 FROM PROGRAMMER WHERE (SALARY) IN 
(SELECT MAX(SALARY) FROM PROGRAMMER GROUP BY PROF1)

--48. Who is the least experienced Programmer. 

SELECT MIN(DATEDIFF(YEAR, DOJ, GETDATE())) AS EXPERIENCE FROM PROGRAMMER 

--49. Who is the most experienced male programmer knowing PASCAL.			--DOUBT

SELECT PNAME, MAX(DATEDIFF(YEAR, DOJ, GETDATE())) AS EXPERIENCE FROM PROGRAMMER 
 WHERE PROF1 = 'PASCAL' OR PROF2 = 'PASCAL' AND GENDER = 'M' GROUP BY PNAME

Select max(DATEDIFF(year,DOJ,getdate())) as EXPce
		From PROGRAMMER
		where PROF1 = 'Pascal' or PROF2 = 'Pascal'
				And Gender = 'M'

select pname from Programmer where doj=(select max(doj) from programmer where gender='m' and (prof1='Pascal' or prof2='Pascal'))

--50. Which Language is known by only one Programmer? 

SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING PROF1 NOT IN (SELECT PROF2 FROM PROGRAMMER)AND COUNT(PROF1)=1 
UNION SELECT PROF2 FROM PROGRAMMER 
GROUP BY PROF2 HAVING PROF2 NOT IN (SELECT PROF1 FROM PROGRAMMER) AND COUNT(PROF2)=1


--51. Who is the Above Programmer Referred in 50? 

SELECT PNAME FROM PROGRAMMER 
WHERE PROF1 IN (SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING PROF1 NOT IN
(SELECT PROF2 FROM PROGRAMMER)AND COUNT(PROF1)=1 
UNION
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 
HAVING PROF2 NOT IN (SELECT PROF1 FROM PROGRAMMER)AND COUNT(PROF2)=1)
UNION 
SELECT PNAME FROM PROGRAMMER
WHERE PROF2 IN (SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 
HAVING PROF1 NOT IN (SELECT PROF2 FROM PROGRAMMER)AND COUNT(PROF1)=1 
UNION
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING PROF2 NOT IN (SELECT PROF1 FROM PROGRAMMER)AND COUNT(PROF2)=1)


--52. Who is the Youngest Programmer knowing DBASE? 

SELECT pname, prof1, prof2, datediff(YEAR, dob, getdate()) as age
from programme 
where dob = (SELECT max(dob) from programmer where prof1='dbase' or prof2='dbase');

--53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE? 

SELECT *FROM PROGRAMMER WHERE 
PROF1<> 'C' AND
PROF2 <>'C' AND
PROF1 <> 'ORACLE' AND
PROF2 <> 'ORACLE' AND
PROF1 <> 'DBASE' AND 
PROF2 <> 'DBASE' AND
GENDER = 'F' AND
SALARY >3000


--54. Which Institute has most number of Students? 

SELECT TOP 1 INSTITUTE, COUNT(PNAME) FROM STUDIES GROUP BY INSTITUTE ORDER BY COUNT(PNAME) DESC

--55. What is the Costliest course? 

SELECT TOP 1 COURSE, MAX(COURSE_FEE) FROM STUDIES GROUP BY COURSE ORDER BY MAX(COURSE_FEE) DESC

--56. Which course has been done by the most of the Students? 

SELECT TOP 2 COURSE, COUNT(PNAME) FROM STUDIES GROUP BY COURSE ORDER BY COUNT(PNAME) DESC

--57. Which Institute conducts costliest course. 

SELECT TOP 1 INSTITUTE, MAX(COURSE_FEE) AS FEES FROM STUDIES  GROUP BY INSTITUTE ORDER BY FEES DESC

--58. Display the name of the Institute and Course, which has below AVG course fee. 

SELECT INSTITUTE, COURSE_FEE FROM STUDIES WHERE COURSE_FEE < (SELECT AVG(COURSE_FEE) FROM STUDIES)

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee

SELECT COURSE, COURSE_FEE FROM STUDIES WHERE COURSE_FEE <(SELECT AVG(COURSE_FEE)+1000 FROM STUDIES) AND
COURSE_FEE>(SELECT AVG(COURSE_FEE)-1000 FROM STUDIES)

--60. Which package has the Highest Development cost? 

SELECT TITLE,DCOST FROM SOFTWARE WHERE DCOST= (SELECT MAX(DCOST) FROM SOFTWARE)

--61. Which course has below AVG number of Students? 

CREATE TABLE STUDENTS_COUNT (COURSE_NAME VARCHAR(20), NO_OF_STUDENTS INT)

INSERT INTO STUDENTS_COUNT SELECT COURSE, COUNT(PNAME) FROM STUDIES GROUP BY COURSE

SELECT COURSE_NAME, NO_OF_STUDENTS FROM STUDENTS_COUNT
WHERE NO_OF_STUDENTS<=(SELECT AVG(NO_OF_STUDENTS) FROM STUDENTS_COUNT)
--DROP TABLE STUDENTS_COUNT

--62. Which Package has the lowest selling cost? 

SELECT TITLE, SCOST FROM SOFTWARE WHERE SCOST = (SELECT MIN(SCOST) FROM SOFTWARE) 

--63. Who Developed the Package that has sold the least number of copies? 

SELECT PNAME, SOLD FROM SOFTWARE WHERE SOLD = (SELECT MIN(SOLD) FROM SOFTWARE) 

--64. Which language has used to develop the package, which has the highest sales amount? 

SELECT DEVELOPIN, TITLE FROM SOFTWARE WHERE SCOST = (SELECT MAX(SCOST) FROM SOFTWARE) 

--65. How many copies of package that has the least difference between development and selling cost where sold. 

SELECT TITLE, SOLD FROM SOFTWARE WHERE (DCOST-SCOST)= (SELECT MIN(DCOST-SCOST) FROM SOFTWARE)

--66. Which is the costliest package developed in PASCAL. 

SELECT TITLE, DCOST FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE) 

--67. Which language was used to develop the most number of Packages. 

SELECT TOP 1 DEVELOPIN, COUNT(TITLE) AS NO_OF_PACKAGES FROM SOFTWARE GROUP BY DEVELOPIN ORDER BY COUNT(TITLE) DESC 

--68. Which programmer has developed the highest number of Packages?

SELECT TOP 1 PNAME, COUNT(TITLE) AS NO_OF_PACKAGES FROM SOFTWARE GROUP BY PNAME ORDER BY COUNT(TITLE) DESC 

---69. Who is the Author of the Costliest Package? 

SELECT PNAME, TITLE FROM SOFTWARE WHERE DCOST= (SELECT MAX(DCOST) FROM SOFTWARE)

--70. Display the names of the packages, which have sold less than the AVG number of copies. 

SELECT TITLE, SOLD FROM SOFTWARE WHERE SOLD < (SELECT AVG(SOLD) FROM SOFTWARE) 

--71. Who are the authors of the Packages, which have recovered more than double the Development cost? 

SELECT PNAME, TITLE FROM SOFTWARE WHERE (SCOST*SOLD) > (2*DCOST)

--72. Display the programmer Name and the cheapest packages developed by them in each language. 

SELECT PNAME, TITLE , DEVELOPIN FROM SOFTWARE WHERE DCOST IN (SELECT MIN(DCOST) FROM SOFTWARE GROUP BY DEVELOPIN)

--73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package. 

SELECT DEVELOPIN, MIN(SCOST) AS MIN_COST, MAX(SCOST) AS MAX_COST FROM SOFTWARE GROUP BY DEVELOPIN

--74. Who is the youngest male Programmer born in 1965? 

SELECT TOP 1 PNAME, DATEPART(YEAR, DOB) AS YEAROFBIRTH, GENDER, DATEDIFF(YEAR, DOB, GETDATE()) FROM PROGRAMMER 
WHERE DATEPART(YEAR, DOB) = '1965' AND GENDER = 'M'

--75. Who is the oldest Female Programmer who joined in 1992?

SELECT PNAME, DATEPART(YEAR, DOB) AS YEAROFBIRTH, GENDER, DATEDIFF(YEAR, DOB, GETDATE()) FROM PROGRAMMER 
WHERE DATEPART(YEAR, DOB) = '1965' AND GENDER = 'F'

--76. In which year was the most number of Programmers born. 

SELECT TOP 1 DATEPART(YEAR, DOB) AS YEAROFBIRTH, COUNT(DATEPART(YEAR, DOB)) AS NO_OF_BIRTH
FROM PROGRAMMER GROUP BY (DATEPART(YEAR,DOB)) ORDER BY COUNT(DATEPART(YEAR, DOB)) DESC

--77. In which month did most number of programmers join? 

SELECT TOP 1 DATEPART(MONTH, DOJ) AS JOINING_MONTH, COUNT(DATEPART(MONTH, DOJ)) AS NO_OF_JOININGS
FROM PROGRAMMER GROUP BY (DATEPART(MONTH, DOJ)) ORDER BY COUNT(DATEPART(MONTH,DOJ)) DESC

--78. In which language are most of the programmer’s proficient. 

SELECT TOP 1 PROF1, COUNT(PROF1) FROM PROGRAMMER GROUP BY PROF1 ORDER BY PROF1 DESC
UNION
SELECT TOP 1 PROF2, COUNT(PROF2) FROM PROGRAMMER GROUP BY PROF2 ORDER BY COUNT(PROF2) DESC

--79. Who are the male programmers earning below the AVG salary of Female Programmers? 

SELECT PNAME FROM PROGRAMMER WHERE GENDER ='M' AND SALARY <(SELECT AVG(SALARY) FROM PROGRAMMER WHERE GENDER ='F')

--80. Who are the Female Programmers earning more than the Highest Paid? 

SELECT PNAME FROM PROGRAMMER WHERE GENDER ='F' AND SALARY>(SELECT MAX(SALARY) FROM PROGRAMMER WHERE GENDER='M')

--81. Which language has been stated as the proficiency by most of the Programmers? 

SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1
HAVING PROF1 = (SELECT MAX(PROF1) FROM PROGRAMMER)

--82. Display the details of those who are drawing the same salary. 

select Pname, salary from programmer 
where salary = any(select salary from programmer p group by salary having salary=p.salary and count(*)>1);

--83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-. 

SELECT S.PNAME, S.DEVELOPIN, P.GENDER,P.SALARY FROM SOFTWARE AS S 
JOIN PROGRAMMER AS P
ON S.PNAME=P.PNAME
WHERE P.SALARY>3000 AND P.GENDER='M'

--84. Display the details of the packages developed in Pascal by the Female Programmers. 

SELECT S.PNAME, S.TITLE, S.DEVELOPIN, P.GENDER FROM SOFTWARE AS S 
JOIN PROGRAMMER AS P
ON S.PNAME=P.PNAME
WHERE S.DEVELOPIN = 'PASCAL' AND P.GENDER='F'

--85. Display the details of the Programmers who joined before 1990. 

SELECT *, DATEPART(YEAR,DOJ) AS JOINING_DATE FROM PROGRAMMER WHERE DATEPART(YEAR,DOJ)<1990

--86. Display the details of the Software Developed in C By female programmers of Pragathi. 

SELECT S.* FROM SOFTWARE S, STUDIES ST, PROGRAMMER P WHERE S.PNAME=ST.PNAME AND P.PNAME=S.PNAME AND GENDER='F'
AND ST.INSTITUTE = 'PRAGATHI'

--87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise. 

SELECT  ST.INSTITUTE, COUNT(S.TITLE) AS NO_OFPACKAGE, COUNT(S.SOLD) AS NO_OF_COPIES, SUM(S.SCOST*S.SOLD) AS SALES
FROM SOFTWARE AS S, STUDIES AS ST 
WHERE S.PNAME=ST.PNAME
GROUP BY ST.INSTITUTE

--88. Display the details of the software developed in DBASE by Male Programmers, who 
--belong to the institute in which most number of Programmers studied. 

SELECT S.*, ST.INSTITUTE FROM SOFTWARE S, PROGRAMMER P, STUDIES ST 
WHERE S.PNAME=P.PNAME AND S.PNAME=ST.PNAME AND
GENDER ='M' AND S.DEVELOPIN = 'DBASE'

--89. Display the details of the software Developed by the male programmers Born 
--before 1965 and female programmers born after 1975. 

SELECT S.* ,P.GENDER, DATEPART(YEAR,P.DOB) AS YEAROFBIRTH FROM SOFTWARE S, PROGRAMMER P
WHERE S.PNAME=P.PNAME AND 
(P.GENDER='F' AND DATEPART(YEAR, P.DOB)> '1975') AND
(P.GENDER ='M' AND DATEPART(YEAR, P.DOB) < '1964')

/*(SHOWING NO RESULT AS THERE IS ONLY ALTAF WHO IS BORN BEFORE THE YEAR 1965 BUT THERE IS NO DATA ABOUT HIM IN 
SOFTWARE TABLE.
FOR FEMALES, THERE IS NO FEMALE PROGRAMMER BORN AFTER 1975 AS PER PROGRAMMER TABLE, HENCE THE OUTPUT IS BLANK COLUMNS)*/


--90. Display the details of the software that has developed in the language which is
--neither the first nor the second proficiency of the programmers. 

SELECT S.* FROM SOFTWARE S, PROGRAMMER P 
WHERE S.PNAME=P.PNAME AND P.PROF1<>S.DEVELOPIN AND P.PROF2<>S.DEVELOPIN

--91. Display the details of the software developed by the male students of Sabhari.

SELECT S.*, P.GENDER, ST.INSTITUTE FROM SOFTWARE S, PROGRAMMER P, STUDIES ST 
WHERE S.PNAME=P.PNAME AND S.PNAME=ST.PNAME AND
P.GENDER ='M' AND ST.INSTITUTE ='SABHARI'

--92. Display the names of the programmers who have not developed any packages. 

SELECT PNAME FROM PROGRAMMER 
WHERE PNAME NOT IN(SELECT PNAME FROM SOFTWARE)

--93. What is the total cost of the Software developed by the programmers of Apple? 

SELECT ST.PNAME ,SUM(S.SCOST) AS COST
FROM SOFTWARE S, STUDIES ST WHERE
S.PNAME=ST.PNAME AND ST.INSTITUTE='APPLE' GROUP BY ST.PNAME

--94. Who are the programmers who joined on the same day? 

SELECT P.PNAME, V.DOJ FROM PROGRAMMER P, PROGRAMMER V
WHERE P.PNAME<>V.PNAME AND P.DOJ=V.DOJ ORDER BY V.DOJ 

--95. Who are the programmers who have the same Prof2? 

SELECT DISTINCT(P.PNAME), V.PROF2 FROM PROGRAMMER P, PROGRAMMER V
WHERE P.PNAME<>V.PNAME AND P.PROF2=V.PROF2 ORDER BY V.PROF2

--96. Display the total sales value of the software, institute wise. 

SELECT  ST.INSTITUTE, SUM(S.SCOST*S.SOLD) AS TOTAL_SALES FROM SOFTWARE S, STUDIES ST
WHERE S.PNAME=ST.PNAME GROUP BY ST.INSTITUTE

--97. In which institute does the person who developed the costliest package studied. 

SELECT S.PNAME, ST.INSTITUTE FROM  SOFTWARE S, STUDIES ST
WHERE S.PNAME = ST.PNAME AND S.DCOST=(SELECT MAX(DCOST) FROM SOFTWARE)
GROUP BY ST.INSTITUTE,S.PNAME

--98. Which language listed in prof1, prof2 has not been used to develop any package. 

SELECT PROF1 FROM PROGRAMMER WHERE PROF1 NOT IN(SELECT DEVELOPIN FROM SOFTWARE)
UNION
SELECT PROF2 FROM PROGRAMMER WHERE PROF2 NOT IN(SELECT DEVELOPIN FROM SOFTWARE)

--99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo. 

SELECT P.PNAME, P.SALARY, ST.COURSE FROM  STUDIES ST, PROGRAMMER P
WHERE P.PNAME=ST.PNAME AND P.SALARY= (SELECT MAX(SALARY) FROM PROGRAMMER)

--100. What is the AVG salary for those whose software sales is more than 50,000/-. 

SELECT P.PNAME, AVG(P.SALARY) AS AVG_SALARY FROM SOFTWARE S, PROGRAMMER P
WHERE S.PNAME=P.PNAME AND (S.SCOST*S.SOLD) > 50000
GROUP BY P.PNAME

--101. How many packages were developed by students, who studied in institute that charge the lowest course fee? 

SELECT S.PNAME, ST.INSTITUTE, COUNT(S.TITLE) AS NO_OF_PACKAGES FROM SOFTWARE S, STUDIES ST
WHERE S.PNAME=ST.PNAME AND ST.COURSE_FEE=(SELECT MIN(COURSE_FEE) FROM STUDIES)
GROUP BY S.PNAME, ST.INSTITUTE

--102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study? 

SELECT S.PNAME, ST.INSTITUTE, COUNT(S.TITLE) AS NO_OF_PACKAGES FROM SOFTWARE S, STUDIES ST
WHERE S.PNAME=ST.PNAME AND S.DCOST=(SELECT MIN(DCOST) FROM SOFTWARE)
GROUP BY S.PNAME, ST.INSTITUTE

--103. How many packages were developed by the female programmers earning more than the highest paid male programmer? 

SELECT COUNT(S.DEVELOPIN) AS NO_OF_PACKAGES FROM SOFTWARE S, PROGRAMMER P
WHERE S.PNAME=P.PNAME AND GENDER ='F' AND SALARY>(SELECT MAX(SALARY) FROM PROGRAMMER WHERE GENDER='M')

--104. How many packages are developed by the most experienced programmer form BDPS. 

SELECT COUNT(S.TITLE) AS NO_OF_PACKAGES FROM SOFTWARE S, PROGRAMMER P, STUDIES ST
WHERE P.PNAME=S.PNAME AND S.PNAME=ST.PNAME AND
ST.INSTITUTE='BDPS' AND DOJ=(SELECT MIN(DOJ) FROM PROGRAMMER)

--105. List the programmers (from the software table) and the institutes they studied. 

SELECT DISTINCT(S.PNAME), ST.INSTITUTE FROM SOFTWARE S
JOIN STUDIES ST ON S.PNAME=ST.PNAME
ORDER BY ST.INSTITUTE

--106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF. 

SELECT DISTINCT(P.PROF1), COUNT(P.PNAME) AS NO_OF_PROGRAMMER, COUNT(S.DEVELOPIN) AS NO_OF_PACKAGE
FROM PROGRAMMER P, SOFTWARE S
WHERE P.PNAME=S.PNAME
GROUP BY P.PROF1 
UNION
SELECT DISTINCT(P.PROF2), COUNT(P.PNAME) AS NO_OF_PROGRAMMER, COUNT(S.DEVELOPIN) AS NO_OF_PACKAGE
FROM PROGRAMMER P, SOFTWARE S
WHERE P.PNAME=S.PNAME
GROUP BY P.PROF2

--107. List the programmer names (from the programmer table) and No. Of Packages each has developed.

SELECT P.PNAME, COUNT(S.DEVELOPIN) AS PACKAGE_DEVELOPED FROM PROGRAMMER P
JOIN SOFTWARE S
ON S.PNAME=P.PNAME
GROUP BY P.PNAME