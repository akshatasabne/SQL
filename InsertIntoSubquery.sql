create table InsertData1
(
id int,
name varchar(20),
city varchar(20)
)


insert into InsertData1 values(101,'Suhana','Nashik')

create table InsertData2
(
id_2 int,
name varchar(20),
L_name varchar(20)
)

insert into InsertData2 values(102,'Johny','Pune')


INSERT INTO InsertData1
SELECT * FROM  InsertData2
WHERE name='Johny'


select * from InsertData1