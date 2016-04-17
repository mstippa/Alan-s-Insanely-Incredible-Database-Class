-- Morgan Stippa  
-- Last Lab OMG 

-- 1.) function PreReqsFor(courseNum) - Returns the immediate	prerequisites for the passed-in course	number.	
create or replace function PreReqsFor(courseNum integer, refcursor) returns refcursor as 
$$
declare
   courseID int          := $1;
   resultset  refcursor  := $2;
begin
   open resultset for
   select prereqnum
      from   Prerequisites
      where  courseID = Prerequisites.courseNum;
    return resultset;
end;
$$ 
language plpgsql;

select PreReqsFor(499, 'results');
fetch all from results;

-- 2.) function	IsPreReqFor(courseNum)	- Returns the courses for which the passed-in 
--     course number is an immediate pre-requisite.	
create or replace function IsPreReqFor(courseNum integer, refcursor) returns refcursor as $$
declare
  courseID integer	:=$1;
  resultset refcursor	:=$2;
begin
  open resultset for
    select Prerequisites.courseNum
    from Prerequisites
    where courseID = Prerequisites.preReqNum;
  return resultset;
end
$$
language plpgsql;

select IsPreReqFor(120, 'results');
fetch all from results;
      
