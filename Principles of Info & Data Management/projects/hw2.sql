Drop table if exists students;
Drop table if exists courses;
Drop table if exists professors;
Drop table if exists enrollment;
Drop table if exists teaches;


Create table students(
sid varchar(11),
name varchar(50),
age int,
gpa float,
primary key (sid));

Create table courses(
cid varchar(11),
deptid varchar(15),
name   varchar(50),
primary key (cid));

Create table professors(
ssn int,
name varchar(50),
address varchar(50),
phone varchar(15),
deptid varchar(15),
primary key (ssn));

Create table enrollment(
sid varchar(11),
cid varchar(11),
section int,
grade varchar(2),
primary key (sid, cid),
foreign key (sid) references students(sid),
foreign key (cid) references courses(cid),
foreign key (cid ,section) references teaches);

Create table teaches(
cid varchar(10),
section int,
ssn int,
primary key (cid, section),
foreign key (cid) references courses,
foreign key (ssn) references professors);
