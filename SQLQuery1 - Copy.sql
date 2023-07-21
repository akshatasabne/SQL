create table Book
(
id int primary key,
name varchar(20)not null,
Aname varchar (25)not null,
price int not null,
)
sp_help Book

create table Department
(
did int primary key,
dname varchar(20),
)
create table Emp
(
empid int primary key,
ename varchar(30)not null,
did int,
constraint fk_dept_emp foreign key(did) references Department(did)
)
sp_help Emp