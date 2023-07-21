create table Movies
(
Mid int primary key,
MName varchar(30),
RelYear int,
BoxOffColl int,
)
sp_help Movies

create table Roles
(
Rid int primary key,
Rname varchar(30),
)
sp_help Roles

create table Celebrity
(
Cid int primary key,
Cname varchar(30),
DOB varchar(20),
phno int,
email varchar(20)
)
sp_help Celebrity

create table BollyWood
(
Bid int,
Cid int foreign key(Cid) references Celebrity(Cid),
Mid int foreign key(Mid) references Movies(Mid),
Rid int foreign key (Rid) references Roles(Rid)
)
sp_help BollyWood