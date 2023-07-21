create table Countries
(
Country_id int primary key,
Country_name varchar(30),
)
sp_help Countries

create table Format
(
Format_id int primary key,
Format_name varchar(30)
)
sp_help Format

create table Batsman
(
Player_id int primary key,
Player_name varchar(30),
age int,
Total_Runs int,
Total50s int,
Total100s int,
Player_Grade varchar(20),
Country_id int foreign key(Country_id)references Countries(Country_id)
)
sp_help BatsMan

Create table B_F_Mapping
(
id int,
Player_id int foreign key(Player_id)references BatsMan(Player_id),
Format_id int foreign key(Format_id)references Format(Format_id)
)
sp_help B_F_Mapping

select * from Countries 

insert into Countries values(1,'India')
insert into Countries values(2,'Australia')

select * from Format
insert into Format values(1,'T20')
insert into Format values(2,'ODI')
insert into Format values(3,'TEST')