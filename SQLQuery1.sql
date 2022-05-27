use master

create database Company
on(
  name = Company ,
  filename = 'E:\ITI2sessions\DataBase\seeeions\Day 3\Company-Data.mdf',
size = 10 ,
filegrowth = 10 ,
maxsize = 50 
)

log on (
name = Company_Log ,
filename = 'E:\ITI2sessions\DataBase\seeeions\Day 3\Company-Data.ldf',
size = 5 ,
filegrowth = 10 ,
maxsize = 40 
)

use Company

 create table Department(
 
  id int not null ,
  name varchar(10) not null ,
  location varchar(20) not null  ,
  phone char(20) not null
)

alter table Department
add constraint Dep_pk primary key (id)

create table Emp
(
   emp_no int not null ,
   emp_fname varchar(10) not null ,
   emp_lname varchar(10) not null ,
   dept_no int not null ,
   salary float not null check(salary > 700 and salary < 6000)  unique
)

alter table Emp
add constraint Emp_pk primary key (emp_no)

alter table Emp
add constraint Dep_fk_Emp foreign key (dept_no)
references Department (id) 
on delete cascade on update cascade

create table Project
(
  pro_no int primary key ,
  pro_name varchar(10) not null ,
  budget decimal 
)

create table works_on
(
  emp_no int  not null ,
  pro_no int  not null ,
  jop varchar(10) ,
  enter_date date not null default getdate()
)

alter table works_on
add constraint works_fk_Emp foreign key (emp_no)
references Emp(emp_no)
on delete cascade on update cascade

alter table works_on
add constraint works_fk_project foreign key (pro_no)
references project(pro_no)
on delete cascade on update cascade


alter table works_on
add constraint works_pk primary key (emp_no , pro_no)

alter table Emp
add phone varchar(15)

alter table Emp
drop column phone 

--create schema Company_schema

alter table Emp
drop column emp_no

insert into Department
values(1, 'A' , 'aswan' , '01100000'),
      (2, 'B' , 'cairo' , '01101000'),
      (3, 'C' , 'alex' , '01102000')

insert into Emp 
values
       (10102 , 'ann' , 'jones' ,3 , 3000),
	   (25348 , 'mathew' , 'smith' ,3 , 2500),
       (18316 , 'john' , 'barrie' ,1 , 2400)

insert into Emp 
values (10102 , 'ann' , 'jones' ,3 , 3000)

insert into Project
values(1 , 'apollo' , 120000)

insert into project 
values(2 , 'apollo' , 120000),
     (3, 'gemini' , 95000)
     

insert into works_on(emp_no , pro_no , jop)
values(10102 , 1 , 'analyst' ),
      (10102 , 3 , 'manager' ),
      (25348 , 2 , 'clerk' )


select * from works_on

select * from Project

select * from Emp


update  works_on
set emp_no = 11111
where emp_no = 10102
 -- error because it is a foreign key

alter table Emp
modify emp_no = 22222
where emp_no = 10102
-- error because modify is used to modify datatype


delete from Emp
where emp_no = 10102





