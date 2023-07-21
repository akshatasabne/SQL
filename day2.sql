create table users
(
Uid int primary key,
Uname varchar(25)not null
)
sp_help users

create table Product
(
pid int primary key,
pname varchar(25)not null
)

sp_help Product
create table Orders
(
Oid int primary key,
Uid int foreign key(Uid)references Users(Uid),
pid int foreign key(pid) references Product(pid)
)
sp_help Orders

create table Author
(
Aid int primary key,
Aname varchar(25),
city varchar (25),
country varchar(25)
)
sp_help Author

create table Category
(
Cid int primary key,
Description varchar(25)
)
sp_help Category

create table BookInfo
(
bid int primary key,
title varchar(20),
year int,
price int,
publisher varchar(20),
Rating int,
Aid int foreign key (Aid) references Author(Aid),
Cid int foreign key (Cid) references Category(Cid)
)
sp_help BookInfo

create table Order_Details
(
OrdNo int primary key,
Qty int,
bid int foreign key (bid) references BookInfo(bid),
)
sp_help Order_Details

------------------------------ II nd Database-------------------------------------
create table AuthorInfo
(
aid int primary key,
aname varchar(25),
PhoNo int,
email varchar(25),
address varchar(30),
city varchar(25)
)
sp_help AuthorInfo

create table Book_Details
(
Bid int primary key,
Bname varchar(20),
price int,
aid int foreign key (aid) references AuthorInfo (aid)
)
sp_help Book_Details

create table Award
(
awid int,
awardtype varchar(25),
year int,
Bid int foreign key (Bid)references Book_Details(Bid),
aid int foreign key (aid) references AuthorInfo (aid)
)
sp_help Award

create table AwardMaster
(
ATypid int primary key,
Awname varchar(30),
Aprice int,
)
sp_help AwardMaster