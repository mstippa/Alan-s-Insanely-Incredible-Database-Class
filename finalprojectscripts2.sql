drop table if exists players;
drop table if exists teams;
drop table if exists teamsPlayers;
drop table if exists games;
drop table if exists regularSeason;
drop table if exists playoffGames;
drop table if exists conferenceFinals;
drop table if exists quarterFinals;
drop table if exists semiFinals;
drop table if exists finals;
drop table if exists playerStatsFirstQuarter;
drop table if exists playerStatsSecondQuarter;
drop table if exists playerStatsThirdQuarter;
drop table if exists playerStatsFourthQuarter;

-- players --
create table players (
  pid 		char(4) not null,
  firstName	text,
  lastName	text,
  dateOfBirth	date,
  heightInches	decimal(3,1),
 primary key (pid)
);  

-- teams --
create table teams (
  tid		char(4) not null,
  teamName	text,
  division	text,
 primary key (tid)
);  

-- teamsPlayers --
create table teamsPlayers (
  tid		char(4) not null references teams(tid),
  pid		char(4) not null references players(pid),
  season	integer not null,
  position	text not null,
 primary key (tid,pid,season,position)
);  

--games --
create table games (
  gid		char(4) not null,
  location	text,
  winnerTID	char(4),
  loserTID	char(4),
  ptDiff	integer,
  gameDate	date,
 primary key (gid)
);  

--regularSeason --
create table regularSeason (
  gid	char(4) not null references games(gid),
 primary key(gid)
);

-- playOffGames -- 
create table playoffGames (
  gid	char(4) not null references games(gid),
 primary key(gid)   
);
select * from conferencefinals
--conferenceFinals --
create table conferenceFinals (
  gid 	char(4) not null references playoffGames(gid),
 primary key(gid)
);

-- quarterFinals --
create table quarterFinals (
  gid 	char(4) not null references playoffGames(gid),
 primary key(gid)
);
select * from finals
-- semifinals --
create table semiFinals (
  gid 	char(4) not null references playoffGames(gid),
 primary key(gid)
);      

-- finals --
create table finals (
  gid 	char(4) not null references playoffGames(gid),
 primary key(gid)
);  

-- playerStatsFirstQuarter
create table playerStatsFirstQuarter (
  pid		char(4) not null references players(pid),
  gid 		char(4) not null references games(gid),
  PPQ1		integer,
  MPQ1		decimal(3,1),
  FGMQ1		integer,
  FGAQ1		integer,
  threePAQ1	integer,
  threePMQ1	integer,
  FTAQ1		integer,
  FTMQ1		integer,
  OREBQ1	integer,
  DREBQ1	integer,
  ASTQ1		integer,
  STLQ1		integer,
  BLKQ1		integer,
  PFQ1		integer,
  turnoversQ1	integer,
 primary key (pid, gid)
); 

-- playerStatsSecondQuarter
create table playerStatsSecondQuarter (
  pid		char(4) not null references players(pid),
  gid 		char(4) not null references games(gid),
  PPQ2		integer,
  MPQ2		decimal(3,1),
  FGMQ2		integer,
  FGAQ2		integer,
  threePAQ2	integer,
  threePMQ2	integer,
  FTAQ2		integer,
  FTMQ2		integer,
  OREBQ2	integer,
  DREBQ2	integer,
  ASTQ2		integer,
  STLQ2		integer,
  BLKQ2		integer,
  PFQ2		integer,
  turnoversQ2	integer,
 primary key (pid, gid)
); 

-- playerStatsThirdQuarter
create table playerStatsThirdQuarter (
  pid		char(4) not null references players(pid),
  gid 		char(4) not null references games(gid),
  PPQ3		integer,
  MPQ3		decimal(3,1),
  FGMQ3		integer,
  FGAQ3		integer,
  threePAQ3	integer,
  threePMQ3	integer,
  FTAQ3		integer,
  FTMQ3		integer,
  OREBQ3	integer,
  DREBQ3	integer,
  ASTQ3		integer,
  STLQ3		integer,
  BLKQ3		integer,
  PFQ3		integer,
  turnoversQ3	integer,
 primary key (pid, gid)
); 
select * from playerstatsfourthquarter
-- playerStatsFourthQuarter
create table playerStatsFourthQuarter (
  pid		char(4) not null references players(pid),
  gid 		char(4) not null references games(gid),
  PPQ4		integer,
  MPQ4		decimal(3,1),
  FGMQ4		integer,
  FGAQ4		integer,
  threePAQ4	integer,
  threePMQ4	integer,
  FTAQ4		integer,
  FTMQ4		integer,
  OREBQ4	integer,
  DREBQ4	integer,
  ASTQ4		integer,
  STLQ4		integer,
  BLKQ4		integer,
  PFQ4		integer,
  turnoversQ4	integer,
 primary key (pid, gid)
); 
select * from playersingame
--playersInGame -- 
create table playersInGame (
  pid		char(4) not null references players(pid),
  gid		char(4) not null references games(gid),
 primary key (pid, gid)
);  

------------------------
-- sample data values --
------------------------

--players--
insert into players(pid,firstname, lastname, dateofbirth, heightinches, weightlbs)
  values ('p001','Tim', 'Duncan', '1976-04-25', 83, 250);

insert into players(pid,firstname, lastname, dateofbirth, heightinches, weightlbs)
  values ('p002','Alan','Labouseur','1912-12-25', 95, 300);

insert into players(pid,firstname, lastname, dateofbirth, heightinches, weightlbs)
  values ('p003','Chris','Kaman','1982-04-28', 84, 265);

insert into players(pid,firstname, lastname, dateofbirth, heightinches, weightlbs)
  values ('p004','Stephen', 'Curry','1988-03-14',75,190);

insert into players(pid,firstname, lastname, dateofbirth, heightinches, weightlbs)
  values ('p005','Giannis','Antetokounmpo','1994-12-06',83,222);

insert into players(pid,firstname, lastname, dateofbirth, heightinches, weightlbs)
  values ('p006', 'Matt','Bonner','1980-04-05',82,235);

insert into players(pid,firstname, lastname, dateofbirth, heightinches, weightlbs)
  values ('p007', 'Boban', 'Marjanovic','1988-08-15',87, 290);

insert into players(pid,firstname, lastname, dateofbirth, heightinches, weightlbs)
  values ('p008','Lebron','James','1984-12-30',80,250);

insert into players(pid, lastname, dateofbirth, heightinches, weightlbs)
  values ('p009', 'Nene', '1982-09-13', 83, 250);

insert into players(pid,firstname, lastname, dateofbirth, heightinches, weightlbs)
  values ('p010','Kristaps','Porzingis','1995-08-02',87,240);   

-- teams --  
insert into teams(tid,teamname,division)
  values ('t001', 'San Antonio Spurs', 'Southwest');

insert into teams(tid,teamname,division)
  values ('t002','New York Knicks','Atlantic');

insert into teams(tid,teamname,division)
  values ('t003','Cleveland Cavaliers', 'Central');

insert into teams(tid,teamname,division)
  values ('t004','Miami Heat','Southeast');

insert into teams(tid,teamname,division)
  values ('t005','Washington Wizards','Southeast');

insert into teams(tid,teamname,division)
  values ('t006','Golden State Warriors','Pacific');

insert into teams(tid,teamname,division)
  values ('t007','Portland Trail Blazers','Northwest');

insert into teams(tid,teamname,division)
  values ('t008','Milwaukee Bucks','Central');

insert into teams(tid,teamname,division)
  values ('t009','Denver Nuggets','Northwest');

insert into teams(tid,teamname,division)
  values ('t010','Philadelphia 76ers','Atlantic');                 

--teamsplayers--
insert into teamsPlayers(tid, pid, season, playerPosition)
  values ('t001','p001', 1996, 'forward');

insert into teamsPlayers(tid, pid, season, playerPosition)
  values ('t001','p001', 2016, 'center');

insert into teamsPlayers(tid, pid, season, playerPosition)
  values ('t001','p001', 2015, 'center');

insert into teamsPlayers(tid, pid, season, playerPosition)
  values ('t001','p006', 2014, 'small-forward');
     
insert into teamsPlayers(tid, pid, season, playerPosition)
  values ('t001','p007', 2016, 'center');  

insert into teamsPlayers(tid, pid, season, playerPosition)
  values ('t002','p010', 2016, 'forward');

insert into teamsPlayers(tid, pid, season, playerPosition)
  values ('t010','p002', 1937, 'point guard');

insert into teamsPlayers(tid, pid, season, playerPosition)
  values ('t007','p003', 2016, 'center'); 

insert into teamsPlayers(tid, pid, season, playerPosition)
  values ('t006','p004', 2016, 'point guard');  

insert into teamsPlayers(tid, pid, season, playerPosition)
  values ('t006','p004', 2015, 'point guard');         

insert into teamsPlayers(tid, pid, season, playerPosition)
  values ('t008','p005', 2016, 'small-foward'); 

insert into teamsPlayers(tid, pid, season, playerPosition)
  values ('t003','p008', 2010, 'power-foward');  

insert into teamsPlayers(tid, pid, season, playerPosition)
  values ('t004','p008', 2007, 'small-foward');             

insert into teamsPlayers(tid, pid, season, playerPosition)
  values ('t004','p008', 2015, 'small-foward');  

insert into teamsPlayers(tid, pid, season, playerPosition)
  values ('t004','p008', 2016, 'small-foward');  

insert into teamsPlayers(tid, pid, season, playerPosition)
  values ('t009','p009', 2011, 'center');      

insert into teamsPlayers(tid, pid, season, playerPosition)
  values ('t005','p009', 2016, 'center');   
select * from teams
-- games --
insert into games(gid,location,winnertid,losertid, ptdiff, gamedate)
  values ('g001', 'Miami', 't001','t004',5,'2015-11-24');

insert into games(gid,location,winnertid,losertid, ptdiff, gamedate)
  values ('g002', 'Miami', 't004','t002',10,'2015-10-20'); 

insert into games(gid,location,winnertid,losertid, ptdiff, gamedate)
  values ('g003', 'Denver', 't009','t008',13,'2016-1-24');   

insert into games(gid,location,winnertid,losertid, ptdiff, gamedate)
  values ('g004', 'Washington', 't005','t003',7,'2014-12-20');

insert into games(gid,location,winnertid,losertid, ptdiff, gamedate)
  values ('g005', 'New York', 't001','t002',5,'2016-3-24'); 

insert into games(gid,location,winnertid,losertid, ptdiff, gamedate)
  values ('g006', 'New York', 't002','t001',15,'2016-2-15');

insert into games(gid,location,winnertid,losertid, ptdiff, gamedate)
  values ('g007', 'Oakland', 't006','t007',25,'2016-4-11');

insert into games(gid,location,winnertid,losertid, ptdiff, gamedate)
  values ('g008', 'Philadelphia', 't006','t010',36,'2015-11-15');   

insert into games(gid,location,winnertid,losertid, ptdiff, gamedate)
  values ('g009', 'Portland', 't009','t007',1,'2016-1-10');

insert into games(gid,location,winnertid,losertid, ptdiff, gamedate)
  values ('g010', 'San Antonio', 't001','t006',1,'2016-5-1');    

insert into games(gid,location,winnertid,losertid, ptdiff, gamedate)
  values ('g011', 'Cleveland', 't005','t003',10,'2016-4-20'); 

insert into games(gid,location,winnertid,losertid, ptdiff, gamedate)
  values ('g012', 'Milwaukee', 't008','t010',4,'2016-4-30');

insert into games(gid,location,winnertid,losertid, ptdiff, gamedate)
  values ('g013', 'Oakland', 't001','t006',24,'2016-6-2');

insert into games(gid,location,winnertid,losertid, ptdiff, gamedate)
  values ('g014', 'Philadelphia', 't002','t010',75,'2016-5-27');    

insert into games(gid,location,winnertid,losertid, ptdiff, gamedate)
  values ('g015', 'Portland', 't002','t007',9,'2016-5-10');  

insert into games(gid,location,winnertid,losertid, ptdiff, gamedate)
  values ('g016', 'New York', 't002','t009',22,'2016-6-12');  

insert into games(gid,location,winnertid,losertid, ptdiff, gamedate)
  values ('g017', 'Miami', 't004','t003',10,'2016-5-19');  

insert into games(gid,location,winnertid,losertid, ptdiff, gamedate)
  values ('g018', 'Cleveland', 't006','t003',30,'2016-6-15');  
    
-- regularseason --
insert into regularSeason(gid)
  values('g001');   

insert into regularSeason(gid)
  values('g002');

insert into regularSeason(gid)
  values('g003');     

insert into regularSeason(gid)
  values('g004');  
      
insert into regularSeason(gid)
  values('g005');      
   
insert into regularSeason(gid)
  values('g006');      
        
insert into regularSeason(gid)
  values('g008');      

insert into regularSeason(gid)
  values('g009');      

--playoffgames--
insert into playoffGames(gid, seriesWinner)
  values('g010','San Antonio Spurs');

insert into playoffGames(gid, seriesWinner)
  values('g011','Washington Wizards');  

insert into playoffGames(gid, seriesWinner)
  values('g012','Milwaukee Bucks');

insert into playoffGames(gid, seriesWinner)
  values('g013','Golden State Warriors');  

insert into playoffGames(gid, seriesWinner)
  values('g014','New York Knicks');   

insert into playoffGames(gid, seriesWinner)
  values('g015','Portland Trail Blazers'); 

insert into playoffGames(gid, seriesWinner)
  values('g016','Denver Nuggets');    

insert into playoffGames(gid, seriesWinner)
  values('g017','Miami Heat');

insert into playoffGames(gid, seriesWinner)
  values('g018','Golden State Warriors');    

-- quarterfinals -- 
insert into quarterFinals(gid)
  values('g011');

insert into quarterFinals(gid)
  values('g012');

-- semifinals--
insert into semiFinals(gid)
  values('g010');

insert into semiFinals(gid)
  values('g015');

--conferencefinals--
insert into conferenceFinals(gid)
  values('g014');

insert into conferenceFinals(gid)
  values('g017');

--finals--
insert into finals(gid)
  values('g013');

insert into finals(gid)
  values('g016');

insert into finals(gid)
  values('g018');
  
--playerstatsfirstquarter--
insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p001','g001',12,6,6,8,0,0,0,0,1,4,1,0,2,0,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p001','g005',5,6,1,1,0,0,4,3,0,3,0,2,2,1,1);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p001','g006',10,5,5,5,0,0,0,0,4,3,1,0,2,0,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p001','g010',24,10,10,10,0,0,4,4,0,1,0,0,1,0,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p001','g013',9, 5, 4, 8, 0,0,2,1,2,2,1,0,1,1,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p002','g008',0,12,0,15,15,0,10,0,0,0,0,0,0,2,10);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p002','g012',0,12,0,10,12,0,14,0,0,0,0,0,0,1,12);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p002','g014',1,12,0,10,12,0,14,1,0,0,0,0,0,1,13);                

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p003','g007',2,5,1,1,0,0,0,0,2,4,1,0,2,1,1);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p003','g009',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p003','g015',3,3,1,3,0,0,2,1,0,2,1,0,0,0,1);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p004','g007',12,8,2,3,2,4,2,2,0,1,3,2,0,0,1);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p004','g008',9,9,0,2,3,3,0,0,0,1,4,2,1,1,3);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p004','g010',3,10,0,0,1,1,0,0,0,1,4,0,1,1,4);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p004','g013',0,8,4,0,3,0,0,0,1,2,3,0,0,1,2);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p004','g018',13,9,2,2,4,2,4,3,0,1,2,1,1,1,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p005','g003',5,9,2,4,0,0,2,1,3,0,1,0,1,1,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p005','g012',0,4,0,1,0,0,0,0,0,1,0,0,0,2,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p006','g001',3,2,0,0,1,1,0,0,1,2,1,0,2,0,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p006','g005',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p006','g006',5,3,1,2,1,1,0,0,0,3,0,0,1,1,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p006','g010',2,4,1,3,0,0,2,4,0,1,0,0,1,0,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p006','g013',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); 

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p007','g001',2,6,1,3,0,0,0,0,1,3,0,2,0,0,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p007','g005',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p007','g006',0,3,0,2,0,0,0,0,2,3,0,0,1,1,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p007','g010',4,3,2,2,0,0,2,3,0,1,0,0,1,0,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p007','g013',0,1,0,0,0,0,0,0,0,2,0,0,0,0,0);  

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p008','g004',9,12,2,5,3,1,2,2,0,2,3,1,0,0,3);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p008','g011',10,12,4,8,0,0,2,2,0,1,3,1,2,1,1);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p008','g017',0,11,0,5,2,0,0,0,0,1,3,1,1,1,1);   

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p008','g018',6,12,0,1,3,2,0,0,0,2,2,1,1,0,2);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p009','g004',4,7,2,3,0,0,0,0,2,3,0,0,1,1,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p009','g011',5,7,2,4,0,0,2,1,0,3,0,0,1,0,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p010','g002',13,8,4,5,2,1,2,2,3,0,1,0,2,1,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p010','g005',6,7,0,2,2,2,0,0,2,1,1,0,1,0,0);

insert into playerstatsfirstquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq1, threepmq1, ftaq1, ftmq1, orebq1, drebq1, astq1, stlq1, blkq1, pfq1, turnoversq1)
  values('p010','g006',6,8,2,2,0,0,2,2,1,1,1,0,1,1,0);

--playerStatsSecondQuarter--
insert into playerstatssecondquarter(pid, gid, ppq2, mpq2, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p001','g001',10,6,5,7,0,0,0,0,2,4,1,0,2,0,0);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p001','g005',5,5,1,1,0,0,4,3,0,3,0,2,1,1,1);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq1, fgmq1, fgaq1, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p001','g006',12,5,6,6,0,0,0,0,4,3,1,0,2,0,1);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq1, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p001','g010',2,4,1,1,0,0,0,0,0,2,0,0,1,0,0);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq1, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p001','g013',3, 5, 0, 0, 1,1,0,0,1,2,1,0,1,1,0);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq1, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p002','g008',0,12,0,20,20,0,10,0,0,0,0,0,0,2,15);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq1, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p002','g012',0,12,0,15,16,0,14,0,0,0,0,0,0,1,13);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq1, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p002','g014',1,12,0,20,15,0,14,1,0,0,0,0,0,1,16);                

insert into playerstatssecondquarter(pid, gid, ppq1, mpq1, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p003','g007',3,5,1,1,0,0,2,1,1,3,1,0,2,1,1);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq1, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p003','g009',5,5,2,3,0,0,2,1,0,2,0,0,0,0,0);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq1, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p003','g015',3,4,1,3,0,0,2,1,0,2,1,0,0,1,0);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq1, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p004','g007',10,5,1,3,2,4,2,2,0,1,3,2,0,0,1);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq1, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p004','g008',6,9,0,2,2,2,0,0,0,1,4,2,1,1,1);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq1, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p004','g010',6,10,0,0,3,2,0,0,0,1,4,0,2,0,1);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq1, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p004','g013',2,5,3,1,3,0,0,0,1,2,3,0,0,1,1);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq1, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p004','g018',5,9,2,1,2,0,2,1,0,1,2,1,1,1,0);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq1, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p005','g003',5,9,2,4,0,0,2,1,3,0,2,0,1,1,1);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq1, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p005','g012',2,3,1,2,0,0,0,0,0,1,0,0,0,2,0);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq1, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p006','g001',0,2,0,0,1,0,0,0,1,2,1,0,1,0,0);

insert into playerstatssecondquarter(pid, gid, ppq2, mpq2, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p006','g005',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

insert into playerstatssecondquarter(pid, gid, ppq2, mpq2, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p006','g006',4,3,2,2,0,0,0,0,0,2,0,0,1,1,0);

insert into playerstatssecondquarter(pid, gid, ppq2, mpq2, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p006','g010',2,5,1,3,0,0,2,4,0,1,0,0,2,0,0);

insert into playerstatssecondquarter(pid, gid, ppq2, mpq2, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p006','g013',0,2,0,0,0,0,0,0,0,0,0,0,1,0,1); 

insert into playerstatssecondquarter(pid, gid, pp21, mpq2, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p007','g001',6,6,2,2,0,0,2,2,3,1,0,2,0,0,1);

insert into playerstatssecondquarter(pid, gid, ppq2, mpq2, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p007','g005',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq1, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p007','g006',4,3,2,4,0,0,0,0,1,4,0,0,1,1,0);

insert into playerstatssecondquarter(pid, gid, ppq2, mpq2, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p007','g010',4,5,2,2,0,0,0,5,0,0,0,0,1,0,0);

insert into playerstatssecondquarter(pid, gid, ppq2, mpq2, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p007','g013',2,5,1,3,0,0,0,0,1,5,0,0,0,0,0);  

insert into playerstatssecondquarter(pid, gid, ppq2, mpq2, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p008','g004',3,10,1,2,1,0,2,1,0,2,2,1,0,0,3);

insert into playerstatssecondquarter(pid, gid, ppq2, mpq2, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p008','g011',12,8,5,8,0,0,2,2,0,0,2,1,2,1,1);

insert into playerstatssecondquarter(pid, gid, ppq2, mpq2, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p008','g017',6,11,3,3,2,0,0,0,0,1,2,1,1,1,0);   

insert into playerstatssecondquarter(pid, gid, ppq2, mpq2, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p008','g018',8,12,1,1,3,0,4,4,0,1,2,1,1,0,1);

insert into playerstatssecondquarter(pid, gid, ppq2, mpq2, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p009','g004',3,6,1,3,0,0,2,1,2,1,0,0,1,1,0);

insert into playerstatssecondquarter(pid, gid, ppq2, mpq2, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p009','g011',4,3,2,4,0,0,1,1,0,2,0,0,1,0,1);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq2, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p010','g002',8,8,4,4,0,0,0,0,3,0,1,0,2,1,0);

insert into playerstatssecondquarter(pid, gid, ppq1, mpq2, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p010','g005',10,5,0,2,2,2,6,6,2,3,1,0,1,0,0);

insert into playerstatssecondquarter(pid, gid, ppq2, mpq2, fgmq2, fgaq2, threepaq2, threepmq2, ftaq2, ftmq2, orebq2, drebq2, astq2, stlq2, blkq2, pfq2, turnoversq2)
  values('p010','g006',12,6,2,2,2,1,6,5,1,3,1,0,1,1,0);  
                                     