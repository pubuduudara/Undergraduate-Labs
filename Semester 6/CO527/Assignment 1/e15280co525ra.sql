/* E_15_280 Premathilaka M.P.U */



/*if database already exists drop it & create new database*/
DROP DATABASE if exists COMPANY; 
CREATE DATABASE COMPANY;
USE COMPANY; 

/*if employee table exists, drop it & create new employee table*/
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
	`fname` varchar(10) NOT NULL,
	`minit` char(1) NOT NULL,
	`LNAME` varchar(10) NOT NULL,
	`ssn` int NOT NULL,
	`bdate` date NOT NULL,
	`address` varchar(30) NOT NULL,
	`sex` char(1) NOT NULL,
	`salary` int NOT NULL,
	`superssn` int,
	`dno` tinyint NOT NULL,
	PRIMARY KEY (`ssn`),
	FOREIGN KEY (dno) REFERENCES deptartment(dno),
	/*superssn is manager's ssn number. Since manager is an employee, superssn is a forign key  that references the employee relation itself */
	FOREIGN KEY (superssn) REFERENCES employee(ssn)
);
/*insert values to the table*/
INSERT INTO employee (fname,minit,LNAME,ssn,bdate,address,sex,salary,superssn,dno)
VALUES ('John','B','Smith',123456789,'1965-01-09','731 Fondren, Houston, TX','M',30000,333445555,5),
		('Franklin','T','Wong',333445555,'1955-12-08','638 Voss, Houston, TX','M',40000,888665555,5),
		('Alicia','J','Zelaya',999887777,'1968-07-19','3321 Castle, Spring, TX','F',2500,987654321,4),
		('Jennifer','S','Wallace',987654321,'1941-06-20','291Berry, Bellaire, TX','F',43000,888665555,4),
		('Ramesh','K','Narayan',666884444,'1962-09-15','975 Fire Oak, Humble, TX','M',3800,333445555,5),
		('Joyce','A','English',453453453,'1972-07-31','5631 Rice, Houston, TX','F',25000,333445555,5),
		('Ahmad','V','Jabbar',987987987,'1969-03-29','980 Dallas, Houston, TX','M',2500,987654321,4),
		('James','E','Borg',888665555,'1937-11-10','450 Stone, Houston, TX','M',5500,NULL,1);



DROP TABLE IF EXISTS `dept_locations`;
CREATE TABLE `dept_locations` (
	`dno` tinyint NOT NULL,
	`dlocation` varchar(10) NOT NULL
);

INSERT INTO dept_locations (dno,dlocation)
VALUES (1,'Houston'),
		(4,'Stafford'),
		(5,'Bellaire'),
		(5,'Sugarland'),
		(5,'Houston');


DROP TABLE IF EXISTS `deptartment`;
CREATE TABLE `deptartment` (
	`dname` varchar(20) NOT NULL,
	`dno` tinyint NOT NULL,
	`mgr_ssn` int NOT NULL,
	`mgr_start_date` date NOT NULL,
	PRIMARY KEY (`dno`)
);

INSERT INTO deptartment (dname,dno,mgr_ssn,mgr_start_date)
VALUES ('Research',5,333445555,'1988-05-22'),
		('Administration',4,987654321,'1995-01-01'),
		('Headquarters',1,888665555,'1981-06-19');

DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
	`pname` varchar(30) NOT NULL,
	`pno` tinyint NOT NULL,
	`plocation` varchar(10) NOT NULL,
	`dno` tinyint NOT NULL,
	PRIMARY KEY (`pno`),
	FOREIGN KEY (dno) REFERENCES deptartment(dno)
	
);
INSERT INTO project (pname,pno,plocation,dno)
VALUES ('ProductX',1,'Bellaire',5),
		('ProductY',2,'Sugarland',5),
		('ProductZ',3,'Houston',5),
		('Computerization',10,'Stafford',4),
		('Reorganization',20,'Houston',1),
		('Newbenefits',30,'Stafford',4);
		
DROP TABLE IF EXISTS `works_on`;
CREATE TABLE `works_on` (
	`essn` int NOT NULL,
	`pno` tinyint NOT NULL,
	`hours` decimal(3,1),
	FOREIGN KEY (pno) REFERENCES project(pno),
	FOREIGN KEY (essn) REFERENCES employee(ssn)
);
INSERT INTO works_on (essn,pno,hours)
VALUES (123456789,1,32.5),
		(123456789,2,7.5),
		(666884444,3,40.0),
		(453453453,1,20.0),
		(453453453,2,20.0),
		(333445555,2,10.0),
		(333445555,3,10.0),
		(333445555,10,10.0),
		(333445555,20,10.0),
		(999887777,30,30.0),
		(999887777,10,10.0),
		(987987987,10,35.0),
		(987987987,30,5.0),
		(987654321,30,20.0),
		(987654321,20,15.0),
		(888665555,20,NULL);
		
DROP TABLE IF EXISTS `dependent`;		
CREATE TABLE `dependent` (
	`ssn` int NOT NULL,
	`dependent_name` varchar(50) NOT NULL,
	`sex` char(1) NOT NULL,
	`bdate` date NOT NULL,
	`relationship` varchar(10) NOT NULL,
	FOREIGN KEY (ssn) REFERENCES employee(ssn)
	
);

INSERT INTO dependent (ssn,dependent_name,sex,bdate,relationship)
VALUES (333445555,'Alice','F','1986-04-05','Daughter'),
		(333445555,'Theodore','M','1983-10-25','Son'),
		(333445555,'Joy','F','1958-05-03','Spouse'),
		(987654321,'Abner','M','1942-02-28','Spouse'),
		(123456789,'Michael','M','1988-01-04','Son'),
		(123456789,'Alice','F','1988-12-30','Daughter'),
		(123456789,'Elizabeth','F','1967-05-05','Spouse');