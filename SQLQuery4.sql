-----1
create table books(id int primary key,title varchar(30),author varchar(30),isbn int,published_date date)
insert into books values(1,'My first SQL book','Mary Parker',101,'2012-02-22')
insert into books values(2,'My Second SQL book','John Mayer',102,'1972-07-03')
insert into books values(3,'My third SQL book','Cary Flint',103,'2012-02-22')

select * from books where author like'%er'

-----2
create table reviews(id int primary key,book_id int foreign key references books(id),
reviewer_name varchar(30),content varchar(30),rating int,published_date date)
insert into reviews values(1,1,'John Smith','My first review',4,'2017-12-10')
insert into reviews values(2,2,'John Smith','My second review',4,'2017-10-13')
insert into reviews values(3,2,'Alice Walker','Another review',4,'2017-10-22')

select books.title,books.author,reviews.reviewer_name from books,reviews
where books.id=reviews.book_id

-----3
select reviewer_name from  reviews  group by reviewer_name having count(reviewer_name)>1

----4
create table customers(id int primary key,name varchar(30),age int,address varchar(30),salary int)
insert into customers values(1,'Ramesh',32,'Ahmedabad',2000)
insert into customers values(2,'Khilan',25,'Delhi',1500)
insert into customers values(3,'Kaushik',23,'Kota',2000)
insert into customers values(4,'Chaitali',25,'Mumbai',6500)
insert into customers values(5,'Hardik',27,'Bhopal',8500)
insert into customers values(6,'Komal',22,'Mp',4500)
insert into customers values(7,'Muffy',24,'Indore',10000)

select name from customers where address like '%o%'

----5
create table orders(oid int primary key,date_ date,customer_id int foreign key references customers(id),amount int)
insert into orders values(102,'2009-10-08',3,3000)
insert into orders values(100,'2009-10-08',3,1500)
insert into orders values(101,'2009-11-20',2,1560)
insert into orders values(103,'2008-05-20',4,2060)

select date_,count(*) as total_cust from orders group by date_ having count(*)>1

----6

create table employee(id int primary key,name varchar(30),age int,address_ varchar(30),salary int)
insert into employee values(1,'Ramesh',32,'Ahmedabad',2000)
insert into employee values(2,'Khilan',25,'Delhi',1500)
insert into employee values(3,'Kaushik',23,'Kota',2000)
insert into employee values(4,'Chaitali',25,'Mumbai',6500)
insert into employee values(5,'Hardik',27,'Bhopal',8500)
insert into employee values(6,'Komal',22,'Mp',null)
insert into employee values(7,'Muffy',24,'Indore',null)

select lower(name) from employee where salary is null

-----7


drop table Studentdet


create table Studentdet(RegisterNo numeric(10) primary key,Sname varchar(30),age numeric(10),qualification varchar(30),mobileno numeric(20),mailid varchar(50),Loc varchar(20),Gender varchar(6))
insert into Studentdet values(2,'Sai',22,'BE',9678537789,'Sai@gmail.com','Chennai','M')
insert into Studentdet values(3,'Kumar',20,'BSc',9678533451,'Kumar@gmail.com','Madurai','M')
insert into Studentdet values(4,'Selvi',22,'BTech',9687537789,'Selvi@gmail.com','Selam','F')
insert into Studentdet values(5,'Nisha',22,'ME',9678327789,'Nisha@gmail.com','Theni','F')
insert into Studentdet values(6,'SaiSaran',21,'BA',9678537789,'Saisaran@gmail.com','Madurai','F')
insert into Studentdet values(7,'Tom',23,'BCA',9672137789,'tom@gmail.com','Pune','M')


select count(Gender) as male_count,count(Gender) as female_count from Studentdet 

------8






create table coursedet(C_id varchar(20) primary key,C_name varchar(30),Start_dt date,End_dt date,fee numeric(10))
insert into coursedet values('DN003','Dotnet','2018/02/01','2018/02/28',15000)
insert into coursedet values('DV004','DataVisualisation','2018/03/01','2018/04/15',15000)
insert into coursedet values('JA002','AdvancedJava','2018/01/02','2018/01/20',10000)
insert into coursedet values('JC001','CoreJava','2018/02/01','2018/02/12',3000)

create table coursereg(RegisterNo numeric(10),C_id varchar(20),batch varchar(10),foreign key(C_id) references coursedet(C_id),foreign key(RegisterNo) references Studentdet(RegisterNo))



insert into coursereg values(2,'DN003','FN')
insert into coursereg values(3,'DV004','AN')
insert into coursereg values(4,'JA002','FN')
insert into coursereg values(2,'JA002','AN')
insert into coursereg values(5,'JC001','FN')

select C_name,count(coursereg.C_id) as no_of_students from coursedet inner join coursereg on coursedet.C_id=coursereg.C_id
where Start_dt between '2018/01/02' and '2018/02/28'
group by C_name,coursereg.C_id
order by coursereg.C_id desc

----9

create table cust(Customer_id int primary key,First_name varchar(20),Last_Name varchar(10))
insert into cust values(1,'George','Washington')
insert into cust values(2,'John','Adams')
insert into cust values(3,'Thomas','Jefferson')
insert into cust values(4,'James','Maddison')
insert into cust values(5,'James','Monroe')

create table ord(order_id int primary key,order_date date,amount numeric(10),Customer_id int,foreign key(Customer_id) references cust(Customer_id))
insert into ord values(1,'1776/04/07',234.56,1)
insert into ord values(2,'1760/03/14',78.50,3)
insert into ord values(3,'1784/05/23',124.00,2)
insert into ord values(4,'1790/03/09',65.50,3)
insert into ord values(5,'1795/07/21',25.50,10)
insert into ord values(6,'1787/11/27',14.40,9)

select First_name,Last_Name from cust inner join ord on cust.Customer_id=ord.Customer_id
group by First_name,Last_Name
having count(cust.Customer_id)=2


---10
create table Studentdt(RegisterNo numeric(10) primary key,Sname varchar(30),age numeric(10),qualification varchar(30),mobileno numeric(20),mailid varchar(50),Loc varchar(20),Gender varchar(6))
insert into Studentdt values(2,'Sai',22,'BE',9678537789,'Sai@gmail.com','Chennai','M')
insert into Studentdt values(3,'Kumar',20,'BSc',9678533451,'Kumar@gmail.com','Madurai','M')
insert into Studentdt values(4,'Selvi',22,'BTech',9687537789,'Selvi@gmail.com','Selam','F')
insert into Studentdt values(5,'Nisha',22,'ME',9678327789,'Nisha@gmail.com','Theni','F')
insert into Studentdt values(6,'SaiSaran',21,'BA',9678537789,'Saisaran@gmail.com','Madurai','F')
insert into Studentdt values(7,'Tom',23,'BCA',9672137789,'tom@gmail.com','Pune','M')

select Sname,upper(Loc) from Studentdt order by Sname desc


----11

create table orde(Id int primary key,order_date date,order_number int,cust_id int,total_amount int)
create table orderitem(Id int primary key,order_id int,product_id int,unit_price int,quantity int)
create table prod(Id int primary key,prod_name varchar(20),supplier_id int,unit_price int,package int,isDiscontinued varchar(5))

create view myview 
as
select prod.prod_name,orderitem.quantity,orde.order_number 
from prod,orderitem,orde

select * from myview


---12

--tables already created in previous questions 



select C_name from ((coursereg inner join Studentdet on coursereg.RegisterNo=Studentdet.RegisterNo) inner join coursedet on coursereg.C_id=coursedet.C_id)
where Sname='Nisha'