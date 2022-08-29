create database Sqltraining

create table tblEmp
(
   Empno numeric(5) primary key,
   Ename varchar(20) not null,
   Job varchar(15),
   Mgr_id numeric(5),
   Hiredate date not null,
   Salary numeric(7) check(salary>0),
   Comm numeric(6),
   Deptno numeric(2) references tblDept(Deptno)

)
create table tblDept
(
   Deptno numeric(2) primary key,
   Dname varchar(15) not null,
   Loc varchar(20)

)

insert into tblEmp(Empno,Ename,Job,Mgr_id,Hiredate,Salary,Deptno) values(7369,'Smith','Clerk',7902,'1980-12-17',800,20)
insert into tblEmp values(7499,'Allen','Salesman',7698,'1981-02-20',1600,300,10)
insert into tblEmp values(7521,'Ward','Salesman',7698,'1981-02-22',1250,500,30)
insert into tblEmp(Empno,Ename,Job,Mgr_id,Hiredate,Salary,Deptno) values(7566,'Jones','Manager',7839,'1981-04-02',2975,20)
insert into tblEmp values(7654,'Martin','Salesman',7698,'1981-09-28',1250,1400,30)
insert into tblEmp(Empno,Ename,Job,Mgr_id,Hiredate,Salary,Deptno) values(7698,'Blake','Manager',7839,'1981-05-01',2850,30)
insert into tblEmp(Empno,Ename,Job,Mgr_id,Hiredate,Salary,Deptno) values(7782,'Clark','Manager',7839,'1981-06-09',2450,10)
insert into tblEmp(Empno,Ename,Job,Mgr_id,Hiredate,Salary,Deptno) values(7788,'Scott','Analyst',7566,'1987-04-19',3000,20)
insert into tblEmp(Empno,Ename,Job,Hiredate,Salary,Deptno) values(7839,'King','President','1981-11-17',5000,10)
insert into tblEmp values(7844,'Turner','Salesman',7698,'1981-09-08',1500,0,30)
insert into tblEmp(Empno,Ename,Job,Mgr_id,Hiredate,Salary,Deptno) values(7876,'Adams','Clerk',7788,'1987-05-23',1100,20)
insert into tblEmp(Empno,Ename,Job,Mgr_id,Hiredate,Salary,Deptno) values(7900,'James','Clerk',7698,'1981-12-03',950,30)
insert into tblEmp(Empno,Ename,Job,Mgr_id,Hiredate,Salary,Deptno) values(7902,'Ford','Analyst',7566,'1981-12-03',3000,20)
insert into tblEmp(Empno,Ename,Job,Mgr_id,Hiredate,Salary,Deptno) values(7934,'Miller','Clerk',7782,'1982-01-23',1300,10)

sp_help tblEmp

insert into tblDept values(10,'Accounting','New York'),(20,'Research','Dallas'),
(30,'Sales','New York'),(40,'Operations','Boston')

sp_help tblDept

select * from tblDept

select * from tblEmp where Ename like 'A%'

select * from tblEmp where Mgr_id is null


select * from tblEmp where Salary between 1200 and 1400

select * from tblEmp
update tblEmp set Salary=Salary+(Salary*10/100) where Deptno=20
select * from tblEmp

select count(Ename) as Clerk_Count from tblEmp where Job='Clerk'

select avg(Salary),count(Ename) from tblEmp group by Job

select Ename,max(Salary) as max_sal,min(Salary) as min_sal from tblEmp group by Ename



select * from tblDept where Deptno not in (select Deptno from tblEmp)

select Ename,Salary from tblEmp where Job='Analyst' and Salary>12000 and Deptno=20 order by Ename

select Deptno,sum(Salary) from tblEmp group by Deptno

select Ename,Salary from tblEmp where Ename='Miller' or Ename='Smith'

select Ename from tblEmp where Ename like '[AM]%'

select Ename,sum(12*Salary) from tblEmp where Ename='Smith'

select Ename,Salary from tblEmp where Ename not in (select Ename from tblEmp where Salary between 1500 and 2850)

--continuation of task 3

select * from tblEmp where Job='Manager'

select Ename,Salary from tblEmp where Salary>1000 order by Salary

select Ename,Salary from tblEmp where Ename<>'James'

select * from tblEmp where Ename like 'S%'

select Ename from tblEmp where Ename like '%A%'

select Ename from tblEmp where Ename like '__L%'

select Ename,sum(Salary/30) as 'Daily salary' from tblEmp where Ename='Jones' group by Ename

select sum(Salary) as 'Total monthly Salary' from tblEmp 

select avg(12*Salary) as 'Average annual Salary' from tblEmp

select Ename,Job,Salary,Deptno from tblEmp where Job<>'Salesman' and Deptno<>30

select distinct(Deptno) as 'Unique Deptno' from tblEmp  

select Ename,Salary from tblEmp where Salary>1500 and Deptno in (10,30)

select Ename,Job,Salary from tblEmp where Job='Manager' or Job='Analyst' and Salary not in (1000,3000,5000)

select Ename,Salary,Comm from tblEmp where Comm >(Salary*10/100) 

select Ename from tblEmp where Ename like '%l%l%' and Deptno=30 or Mgr_id=7782

select Ename,Deptno,datediff(year,Hiredate,getdate()) from tblEmp where(datediff(year,Hiredate,getdate())>10) and (datediff(year,Hiredate,getdate())<20)

select * 
from tblEmp e
order by e.Deptno asc,
         e.Ename desc

select datediff(year,Hiredate,getdate()) as Experience from tblEmp where Ename='Miller'
