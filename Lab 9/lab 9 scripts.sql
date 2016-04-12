-- People --
create table people (
  pid		char(4) not null,
  firstName	text,
  lastName	text,
  ZIP		integer,
  state		text,
  city		text,
  phoneNumber	integer,
 primary key(pid)
);

-- head coaches --
create table headCoaches (
  hid		char(4) not null references people(pid),
 primary key(hid)
); 

-- teams --
create table teams (
  tid 		char(5) not null,
  ageGroup	numeric(1),  		   
  hid		char(4) references headCoaches(hid),
  teamName 	text,
 primary key(tid),
 constraint head_coaches unique(hid, ageGroup)
);  

-- players --
create table players (
  pid 		char(4) not null references people(pid),
  tid		char(5) references teams(tid),
 primary key(pid)
);

-- coaches --
create table coaches (
  pid		char(4) not null references people(pid),
  yearsCoached	integer,
 primary key(pid)
);

-- assistant coaches --
create table assistantCoaches (
  aid		char(4) not null references people(pid),
 primary key(aid)
);

-- teams assistant coaches --
create table teamsAssistantCoaches (
  tid		char(5) not null references teams(tid),
  aid		char(4) not null references assistantCoaches(aid), 
  ageGroup	numeric(1), 
 primary key(tid, aid),
 constraint assistant_coaches unique (aid, ageGroup)
);






     