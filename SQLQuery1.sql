create database FISGlobalDB
use FISGlobalDB

create table tblClients
(
   Client_id numeric(4) primary key,
   Cname varchar(40) not null,
   Adrs varchar(30),
   Email varchar(30) unique,
   Phone numeric(10),
   Business varchar(20) not null

)
sp_help tblClients

create table tblEmployees
(
   Empno numeric(4) primary key,
   Ename varchar(20) not null,
   Job varchar(15),
   Salary numeric(7) check(salary>0),
   Deptno numeric(2) references tblDepartments(Deptno)

)

create table tblDepartments
(
   Deptno numeric(2) primary key,
   Dname varchar(15) not null,
   Loc varchar(20)

)

create table tblProjects
(
   Project_id numeric(3) primary key,
   Descr varchar(30) not null,
   Srt_Date date,
   Planned_End_Date date,
   Actual_End_Date date 

)
alter table tblProjects
add constraint ckdate check (Actual_End_Date>Planned_End_Date)

create table tblEmpProjectTasks
(
   Project_id numeric(3) not null,
   Empno numeric(4) not null,
   Srt_Date date,
   Ed_Date date,
   Task varchar(25) not null,
   Stat varchar(15) not null,
   constraint cons_a primary key(Project_id,Empno),
   constraint cons_b foreign key(Empno) references tblEmployees(Empno),
   constraint cons_c foreign key(Project_id) references tblProjects(Project_id)

)

insert into tblClients values(1001,'ACME Utilities','Noida','contact@acmeutil.com',956788032,'Manufacturing'),
(1002,'Trackon Consultants','Mumbai','contact@trackon.com',8734210090,'Consultant'),
(1003,'MoneySaver Distributors','Kolkata','contact@moneysaver.com',7799886655,'Reseller'),
(1004,'Lawful Corp','Chennai','contact@lawful.com',9210342219,'Professional')

insert into tblEmployees values(7001,'Sandeep','Analyst',25000,10),
(7002,'Rajesh','Designer',30000,10),(7003,'Madhav','Developer',40000,20),
(7004,'Manoj','Developer',40000,20),(7005,'Abhay','Designer',35000,10),
(7006,'Uma','Tester',30000,30),(7007,'Gita','Tech.Writer',30000,40),
(7008,'Priya','Tester',35000,30),(7009,'Nutan','Developer',45000,20),
(7010,'Smita','Analyst',20000,10),(7011,'Anand','Project Mgr',65000,10)

insert into tblDepartments values(10,'Design','Pune'),(20,'Development','Pune'),(30,'Testing','Mumbai'),(40,'Document','Mumbai')

alter table tblProjects
add Budget numeric(10) check(budget>0)

alter table tblProjects
add Client_id numeric(4)

alter table tblProjects
add constraint cons foreign key(Client_id) references tblClients(Client_id)

insert into tblProjects values(401,'Inventory','2011-04-01','2011-10-01','2011-10-31',150000,1001)
insert into tblProjects(Project_id,Descr,Srt_Date,Planned_End_Date,Budget,Client_id) values(402,'Accounting','2011-08-01','2012-01-01',500000,1002)
insert into tblProjects(Project_id,Descr,Srt_Date,Planned_End_Date,Budget,Client_id) values(403,'Payroll','2011-10-01','2011-12-31',75000,1003)
insert into tblProjects(Project_id,Descr,Srt_Date,Planned_End_Date,Budget,Client_id) values(404,'Contact Mgmt','2011-11-01','2011-12-31',50000,1004)
sp_help tblProjects


insert into tblEmpProjectTasks values(401,7001,'2011-04-01','2011-04-20','System Analysis','Completed'),
(401,7002,'2011-04-21','2011-05-30','System Design','Completed'),
(401,7003,'2011-06-01','2011-07-15','Coding','Completed'),
(401,7004,'2011-07-18','2011-09-01','Coding','Completed'),
(402,7005,'2011-08-01','2011-08-20','System Analysis','Completed'),
(402,7006,'2011-08-22','2011-09-30','System Design','Completed')