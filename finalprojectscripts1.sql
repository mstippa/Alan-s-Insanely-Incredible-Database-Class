-- Career Stats View -- 
create view careerStats as 
select  p.firstname as "First Name", p.lastname as "Last Name", 
	round(avg(q1.ppq1+q2.ppq2+q3.ppq3+q4.ppq4),1) as "Points",
	round(avg(q1.mpq1+q2.mpq2+q3.mpq3+q4.mpq4),1) as "Minutes Played",
	round(avg(q1.fgmq1+q2.fgmq2+q3.fgmq3+q4.fgmq4),1) as "FG Made",
	round(avg(q1.fgaq1+q2.fgaq2+q3.fgaq3+q4.fgaq4),1) as "FG Attempted",
	round(avg(q1.threepmq1+q2.threepmq2+q3.threepmq3+q4.threepmq4),1) as "3P Made",
	round(avg(q1.threepaq1+q2.threepaq2+q3.threepaq3+q4.threepaq4),1) as "3P Attempted",
	round(avg(q1.ftmq1+q2.ftmq2+q3.ftmq3+q4.ftmq4),1) as "FT Made",
	round(avg(q1.ftaq1+q2.ftaq2+q3.ftaq3+q4.ftaq4),1) as "FT Attempted",
	round(avg(q1.orebq1+q2.orebq2+q3.orebq3+q4.orebq4),1) as "Offensive Rebounds",
	round(avg(q1.drebq1+q2.drebq2+q3.drebq3+q4.drebq4),1) as "Defensive Rebounds",
	round(avg(q1.astq1+q2.astq2+q3.astq3+q4.astq4),1) as "Assists",
	round(avg(q1.stlq1+q2.stlq2+q3.stlq3+q4.stlq4),1) as "Steals",
	round(avg(q1.blkq1+q2.blkq2+q3.blkq3+q4.blkq4),1) as "Blocks",
	round(avg(q1.pfq1+q2.pfq2+q3.pfq3+q4.pfq4),1) as "Personal Fouls",
	round(avg(q1.turnoversq1+q2.turnoversq2+q3.turnoversq3+q4.turnoversq4),1) as "Turnovers"
from playerstatsfirstquarter q1 inner join players p on q1.pid=p.pid
				 inner join playerstatssecondquarter q2 on q1.pid=q2.pid
				 inner join playerstatsthirdquarter q3 on q1.pid=q3.pid
				 inner join playerstatsfourthquarter q4 on q1.pid=q4.pid
group by(p.firstname, p.lastname)	
order by p.lastname;


-- PlayersPosition View --
create view playersPosition as
select p.firstname as "First Name",p.lastname as "Last Name", tp.playerposition as "Position",tp.season, t.teamName as "Team Name"
from teamsPlayers tp inner join teams t on tp.tid=t.tid
		     inner join players p on tp.pid=p.pid 
order by p.lastname, tp.season	

-- Rebounds and blocks Report for centers, forwards and small forwards --
select p.firstname as "First Name", p.lastname as "Last Name", 
	round(avg(q1.drebq1+q1.orebq1+q2.drebq2+q2.orebq2+q3.drebq3+q3.orebq3+q4.drebq4+q4.orebq4),1) as "Rebounds Per Game",
	round(avg(q1.blkq1+q2.blkq2+q3.blkq3+q4.blkq4),1) as "Blocks Per Game"
from players p inner join teamsPlayers tp on p.pid=tp.pid
	       inner join playerstatsfirstquarter q1 on p.pid=q1.pid
	       inner join playerstatssecondquarter q2 on p.pid=q2.pid
	       inner join playerstatsthirdquarter q3 on p.pid=q3.pid
	       inner join playerstatsfourthquarter q4 on p.pid=q4.pid
where tp.playerposition='center'
or tp.playerposition='small-foward'
or tp.playerposition='foward'
group by(q1.pid,p.firstname,p.lastname)	     
order by "Rebounds Per Game" desc

-- Assists and steals Report for point guards
select p.firstname as "First Name", p.lastname as "Last Name", 
	round(avg(q1.astq1+q2.astq2+q3.astq3+q4.astq4),1) as "Assists Per Game",
	round(avg(q1.stlq1+q2.stlq2+q3.stlq3+q4.stlq4),1) as "Steals Per Game"
from players p inner join teamsPlayers tp on p.pid=tp.pid
	       inner join playerstatsfirstquarter q1 on p.pid=q1.pid
	       inner join playerstatssecondquarter q2 on p.pid=q2.pid
	       inner join playerstatsthirdquarter q3 on p.pid=q3.pid
	       inner join playerstatsfourthquarter q4 on p.pid=q4.pid
where tp.playerposition='point guard'
group by(q1.pid,p.firstname,p.lastname)	

-- Points Per Game Report -- 
select  p.firstname as "First Name", p.lastname as "Last Name", 
	sum(q1.ppq1+q2.ppq2+q3.ppq3+q4.ppq4) as "Points", g.gamedate as "Game Date",
	t.teamname as "Winning Team", g.location
from games g inner join playerstatsfirstquarter q1 on 	g.gid=q1.gid
	     inner join playerstatssecondquarter q2 on g.gid=q2.gid
	     inner join playerstatsthirdquarter q3 on g.gid=q3.gid
	     inner join playerstatsfourthquarter q4 on g.gid=q4.gid
     	     inner join teams t on g.winnertid=t.tid, 
players p				
where q1.pid=q2.pid
and q1.pid=q3.pid
and q1.pid=q4.pid
and q1.pid=p.pid	
group by(q1.gid, p.firstname, p.lastname, g.gamedate, t.teamname, g.location)	
order by p.lastname, g.gamedate

-- Field Goal Percentage Report --
select p.firstname as "First Name", p.lastname as "Last Name",
	avg((q1.fgmq1/q1.fgaq1)*100) as "1st Qtr Shooting %",
	avg((q2.fgmq2/q2.fgaq2)*100) as "2nd Qtr Shooting %",
	avg((q3.fgmq3/q3.fgaq3)*100)
from playerstatsfirstquarter q1 inner join playerstatssecondquarter q2 on q1.gid=q2.gid
				 inner join playerstatsthirdquarter q3 on q1.gid=q3.gid
				 inner join playerstatsfourthquarter q4 on q1.gid=q4.gid,
players p
where p.pid=q1.pid
and q1.pid=q2.pid
and q1.pid=q3.pid
and q1.pid=q4.pid				 	
group by(p.firstname,p.lastname)

select 	* 
from playerstatsfirstquarter q1 inner join playerstatssecondquarter q2 on q1.gid=q2.gid
				 inner join playerstatsthirdquarter q3 on q1.gid=q3.gid
				 inner join playerstatsfourthquarter q4 on q1.gid=q4.gid,
players p	
where p.pid=q1.pid
and q1.pid=q2.pid
and q1.pid=q3.pid
and q1.pid=q4.pid	

-- Stored Procedure Playoff Games --
create or replace function NumberOfPlayoffGames(firstname text, lastname text, refcursor) returns refcursor as
$$
declare
  playerfirstname text	:=$1;
  playerlastname  text	:=$2;
  resultset refcursor	:=$3;
begin
  open resultset for
  select count(gid) as "Playoff Games"
  from playoffGames
  where gid in (select gid
		from playerstatsfirstquarter
		where pid in (select pid
			      from players
			      where players.firstname=playerfirstname
			      and players.lastname=playerlastname
			     )); 
  return resultset;
 end;
$$
language plpgsql;
select NumberOfPlayOffGames('Tim','Duncan','results');
fetch all from results  			     


-- Stored Procedure Position --
create or replace function PlayersInPosition( text, refcursor) returns refcursor as
$$
declare 
  positionOfPlayer    text	  :=$1;
  resultset   refcursor  :=$2;
begin 
  open resultset for
  select p.firstname, p.lastname, tp.season 
  from teamsplayers tp inner join players p on tp.pid=p.pid
  where tp.playerposition=positionOfPlayer
  group by (p.firstname, p.lastname, tp.season)
  order by p.lastname;
  return resultset;
 end;
$$
language plpgsql;
select PlayersInPosition('center','results');
fetch all from results  	

-- stored procedure points  --
create or replace function Points(int, refcursor) returns refcursor as
$$
declare
  pointMin    int     :=$1;
  resultset refcursor :=$2;
begin
 open resultset for
  select p.firstname, p.lastname,  round(avg(q1.ppq1+q2.ppq2+q3.ppq3+q4.ppq4),1) as "Points" 
  from playerstatsfirstquarter q1 inner join playerstatssecondquarter q2 on q1.gid=q2.gid
				   inner join playerstatsthirdquarter q3 on q1.gid=q3.gid
				   inner join playerstatsfourthquarter q4 on q1.gid=q4.gid,
     	       
  players p				
  where q1.pid=q2.pid
  and q1.pid=q3.pid
  and q1.pid=q4.pid
  and q1.pid=p.pid
  group by (p.firstname, p.lastname)
  having avg(q1.ppq1+q2.ppq2+q3.ppq3+q4.ppq4) > pointMin;
 return resultset;
end; 
$$
language plpgsql;
select Points(25,'results');
fetch all from results

-- drop trigger ShotsAttempted on playerstatsfirstquarter
create trigger ShotsAttempted 
before insert 
on playerstatsfirstquarter
for each row
execute procedure setNull_fgaq1();

--drop function setNull()
create or replace function setNull_fgaq1() returns trigger
as $$
begin
  if (new.fgaq1 = 0) then
    update playerstatsfirstquarter
    set fgaq1=null; 
  end if;
end;  
$$ language plpgsql;


