--Student - rollno , sname , degree , birthdate , course id , batch id , fees paid , Remark, is placed
--Course – course id , course name, duration (in months), trainer id , total fees 
--Trainer – Trainer id , trainer name , join date , email , experience in years

create table Trainer(
Tid int primary key,
Tname varchar(25),
Join_Date Date,
Email varchar(25),
Experience_In_Years int
)
sp_help Trainer

insert into Trainer values(1,'Raj','2023-12-12','raj@gmail.com',12)
insert into Trainer values(2,'Deepa','2023-11-12','deepa@gmail.com',10)
insert into Trainer values(3,'Jyoti','2023-10-12','jyoti@gmail.com',15)
insert into Trainer values(4,'Vijay','2023-09-12','vijay@gmail.com',05)
insert into Trainer values(5,'Swati','2023-08-12','swati@gmail.com',11)


create table Course(
Cid int primary key,
CourseName varchar(40),
Duration varchar(20),
Tid int foreign key(Tid) references Trainer(Tid),
Total_Fees int
)
sp_help Course

insert into Course values(101,'dot Net','Three months',1,15000)
insert into Course values(102,'Java Full Stack','One month',2,15000)
insert into Course values(103,'Phython','1.5 months',4,3000)
insert into Course values(104,'C programing','6 months',3,40000)
insert into Course values(105,'Data Science','5 months',5,50000)

create table Student(
RollNo int,
Sname varchar(25),
Degree varchar(25),
Cid int foreign key(Cid) references Course(Cid),
BatchId int,
Fees_Paid float,
Remark varchar(20),
PlacedAt varchar(25)
)
sp_help Student

alter table Student add age int

Insert into Student values(1,'Akshata','B.Com',105,11,20000,'Good','SkillMine')
Insert into Student values(2,'Anjali','B.E',104,12,20000,'Excellent','Prorigo')
Insert into Student values(3,'Vidyashree','B.Tech',103,13,2900,'Average','Zenser')
Insert into Student values(4,'Shruti','BCA',102,14,15000,'Good','OneXTel')
Insert into Student values(5,'Harish','BSc',101,15,10000,'Average','Infosys') 

delete from Student where RollNo in(1,2,3,4,5)

update Student set age=20 where RollNo=1
update Student set age=22 where RollNo=2
update Student set age=21 where RollNo=3
update Student set age=23 where RollNo=4
update Student set age=24 where RollNo=5


select * from Trainer
select * from Course
select * from Student



--Assume that one student is enrolled in only one course.
--Please write following queries.
-------------------------------------------------------------------------------------------------------------------------------------------
--1. Show list of students. List contains roll no , student name , course name , trainer name in 
--order of course name and student name.
select s.RollNo,s.Sname,c.CourseName
from Student s
inner join Course c on s.Cid=c.Cid
-------------------------------------------------------------------------------------------------------------------------------------------
--2. Show list of students who have pending fees more than 1000rs . List should have student 
--name , course name , balance fees . Show this list in descending order of balance fees.
select s.Sname,c.CourseName,(c.Total_Fees-s.Fees_Paid) as 'Balance fees'
from Student s
inner join Course c on c.Cid=s.Cid
where (c.Total_Fees-s.Fees_Paid)>1000
order by (c.Total_Fees-s.Fees_Paid)
-------------------------------------------------------------------------------------------------------------------------------------------
--3. Append letter ‘_spl’ to all batch ids of trainer ‘Deepa’.


------------------------------------------------------------------------------------------------------------------------------------------
--4. Update table student. Update ‘remark’ field. Remark should be ‘Eligible for exam’ if fees paid 
--by student is more than 60%.
select s.,c. 
from Student s
inner join Course c on c.Cid=s.Cid
update Student set Remark='Eligible for Exam' 
where c.Total_fees-s.Fees_Paid
-----------------------------------------------------------------------------------------------------------------------------------------
--5. Create a index to make retrieval faster based on course name.
create unique index index_crs on Course(CourseName)
------------------------------------------------------------------------------------------------------------------------------------------
--6. List name of course for which more than 20 students are enrolled.

select * from Course where Cid in(select Cid from Student group by Cid having count(*)>1) 
select s.Sname,c.Cid,c.CourseName
from Student s
inner join Course c on c.Cid=s.Cid
group by c.CourseName
having count(c.Cid)>2
------------------------------------------------------------------------------------------------------------------------------------------
--7. List name of course for which maximum revenue was generated. ( max fee collection)
select CourseName from Course where Cid in(select top(1) Cid,count(*) from Student Group by Cid Order by sum(Fees_Paid)desc)
-----------------------------------------------------------------------------------------------------------------------------------------
--8. Select name of student who are in same batch as ‘Atul’.
select Sname  from Student where BatchId in(select BatchId from Student where Sname='Atul')
--------------------------------------------------------------------------------------------------------------------------------------------
--9. Delete all students who are in course which is less than 2 months duration.
delete from Student where Cid in (select Cid from Course where Duration<'2 months')
-----------------------------------------------------------------------------------------------------------------------------------------
--10. Delete all students for whom is placed is ‘yes’ and who have paid all the fees of their course.
delete from Student  where PlacedAt='yes' (select CourseName from Course where Total_Fees-Fees_Paid)
-----------------------------------------------------------------------------------------------------------------------------------------
--11. Create a trigger to add student data in ex-student table if student is deleted from student 
--table.

-----------------------------------------------------------------------------------------------------------------------------------------
--12. Create a view which shows name of trainer and number of students he is training.

-----------------------------------------------------------------------------------------------------------------------------------------
--13. Show names of students who are more than 20 years old.
-----------------------------------------------------------------------------------------------------------------------------------------
--14. Show names of students who have paid all the fees. 
-----------------------------------------------------------------------------------------------------------------------------------------
--15. Write a procedure which accepts student id and returns his balance fees.
