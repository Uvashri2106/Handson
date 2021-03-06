CREATE DATABASE ORG;
USE ORG
CREATE TABLE EMPLOYEE(EMPLOYEE_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, FIRST_NAME CHAR(25),LAST_NAME CHAR(25),
SALARY INT,JOINING_DATE DATETIME,DEPARTMENT CHAR(25))
INSERT INTO Employee VALUES (001, 'Monika', 'Arora', 100000, '2014.02.20 09:00:00','HR'),(002, 'Niharika', 'Verma', 80000, '2014.06.11 09:00:00','Admin');
INSERT INTO Employee VALUES (003, 'Vishal', 'Singhal', 300000, '2014.02.20 09:00:00','HR'),(004,'Amitabh', 'Singh', 500000, '2014.02.20 09:00:00','Admin'),
(005,'Vivek', 'Bhati', 500000, '2014.06.11 09:00:00','Admin'),(006,'Vipul', 'Diwan', 200000, '2014.06.11 09:00:00','Account'),
(007,'Satish', 'Kumar', 75000, '2014.01.20 09:00:00','Account'),(008,'Geetika', 'Chauhan', 90000, '2014.04.11 09:00:00','Admin')
SELECT *FROM EMPLOYEE 
CREATE TABLE Bonus (Employee_REF_ID INT,BONUS_AMOUNT INT,BONUS_DATE DATETIME,
FOREIGN KEY (Employee_REF_ID) REFERENCES Employee(Employee_ID) ON DELETE CASCADE);
INSERT INTO Bonus VALUES (001, 5000, '2016.02.20'),(002, 3000, '2016.06.11');
INSERT INTO Bonus VALUES(003, 4000, '2016.02.20'),(001, 4500, '2016.02.20'),(002, 3500, '2016.06.11');

CREATE TABLE Title (Employee_REF_ID INT,Employee_TITLE CHAR(25),AFFECTED_FROM DATETIME,
FOREIGN KEY (Employee_REF_ID) REFERENCES Employee(Employee_ID)ON DELETE CASCADE);

INSERT INTO Title(Employee_REF_ID, Employee_TITLE,AFFECTED_FROM) VALUES(001, 'Manager', '2016.02.20 00:00:00'),
(002, 'Executive', '2016.06.11 00:00:00'),(008, 'Executive', '2016.06.11 00:00:00'),
(005, 'Manager', '2016.06.11 00:00:00'),(004, 'Asst. Manager', '2016.06.11 00:00:00'),
(007, 'Executive', '2016.06.11 00:00:00'),(006, 'Lead', '2016.06.11 00:00:00'),(003, 'Lead', '2016.06.11 00:00:00');

Select FIRST_NAME AS EMPLOYEE_NAME from EMPLOYEE;
Select upper(FIRST_NAME) from EMPLOYEE;
Select distinct DEPARTMENT from EMPLOYEE;
Select substring(FIRST_NAME,1,3) from EMPLOYEE;
Select INSTR(FIRST_NAME, BINARY'a') from EMPLOYEE where FIRST_NAME = 'Amitabh';
Select RTRIM(FIRST_NAME) from EMPLOYEE;
Select LTRIM(DEPARTMENT) from EMPLOYEE;
Select distinct length(DEPARTMENT) from EMPLOYEE;
Select REPLACE(FIRST_NAME,'a','A') from EMPLOYEE;
Select CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'COMPLETE_NAME' from EMPLOYEE;
Select * from EMPLOYEE order by FIRST_NAME asc;
Select * from EMPLOYEE order by FIRST_NAME asc,DEPARTMENT desc;
Select * from EMPLOYEE where FIRST_NAME in('Vipul','Satish');
Select * from EMPLOYEE where FIRST_NAME not in('Vipul','Satish');
Select * from EMPLOYEE where DEPARTMENT like 'Admin%';
Select * from EMPLOYEE where FIRST_NAME like '%a%';
Select * from EMPLOYEE where FIRST_NAME like '%a';
Select * from EMPLOYEE where FIRST_NAME like '_____h';
Select * from EMPLOYEE where SALARY between 100000 and 500000;
Select * from EMPLOYEE where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;
SELECT COUNT(*) FROM EMPLOYEE WHERE DEPARTMENT = 'Admin';
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As EMPLOYEE_Name,
Salary FROM EMPLOYEE WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM EMPLOYEE WHERE Salary BETWEEN 50000 AND 100000);
SELECT DEPARTMENT, count(EMPLOYEE_ID) No_Of_EMPLOYEEs FROM EMPLOYEE GROUP BY DEPARTMENT ORDER BY No_Of_EMPLOYEEs DESC;
SELECT DISTINCT W.FIRST_NAME,T.EMPLOYEE_TITLE FROM EMPLOYEE W
INNER JOIN Title T ON W.EMPLOYEE_ID = T.EMPLOYEE_REF_ID AND T.EMPLOYEE_TITLE in ('Manager');
SELECT EMPLOYEE_TITLE, AFFECTED_FROM,COUNT(*) FROM Title
GROUP BY EMPLOYEE_TITLE, AFFECTED_FROM HAVING COUNT(*) > 1;
SELECT * FROM EMPLOYEE WHERE MOD (EMPLOYEE_ID, 2) <> 0;
SELECT * FROM EMPLOYEE WHERE MOD (EMPLOYEE_ID, 2) = 0;
SELECT CURDATE();
SELECT NOW();
SELECT * FROM EMPLOYEE ORDER BY Salary DESC LIMIT 5;
SELECT distinct Salary from EMPLOYEE a WHERE 3 >= (SELECT count(distinct Salary)
from EMPLOYEE b WHERE a.Salary <= b.Salary) order by a.Salary desc;











