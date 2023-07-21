create table FBUsers
(
Fid int primary key,
Fname varchar(20),
email varchar(20),
phno int,
TotalPost int,
)
sp_help FBUsers

create table Post
(
Pid int primary key,
PCont varchar(20),
PImage varchar(20),
PVdo varchar(20),
Fid int foreign key(Fid) references FBUsers(Fid),

)
sp_help Post

create table FriendshipStatus
(
StatusCode int primary key,
Status varchar(20)
)
sp_help FriendshipStatus

create table Friendship
(
frid int primary key,
Fid int foreign key(Fid) references FBUsers(Fid),
StatusCode int foreign key(StatusCode) references FriendshipStatus(StatusCode)
)
sp_help Friendship