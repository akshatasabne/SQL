create table Employee
(
id int,
empname varchar(25),--1 to 25
salary numeric(18,2)
)
sp_help Employee

alter table Employee add Qualification varchar(10)
alter table Employee alter column Qualification varchar(15)
alter table Employee drop column Qualification
sp_rename 'Employee.salary','empsalary'

sp_help Employee

alter table Employee alter column empname varchar(25)not null
alter table Employee alter empsalary numeric(12,2)not null
alter table Employee alter column id int not null

alter table Employee add email varchar(40) not null unique
alter table Employee add constraint un_emp unique(email)

alter table Employee add constraint un_emp unique(id,email)
alter table Employee drop constraint un_emp

alter table Employee add constraint pk_emp primary key(id)