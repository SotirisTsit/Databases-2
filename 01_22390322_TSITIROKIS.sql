create database personnel;
use personnel;

--ΕΡΩΤΗΜΑ 5
create table DEPT(
DEPTNO int(2) not null,
DNAME varchar (30),
LOC varchar(30),
primary key (DEPTNO));

create table JOB(
JOBCODE int(3) not null,
JOB_DESCR varchar(30),
SAL int(6),
primary key(JOBCODE));

create table EMP(
EMPNO int(2) not null,
NAME varchar(30),
JOBNO int(3),
DEPTNO int(2),
COMM int(6),
primary key(EMPNO),
foreign key(JOBNO) references JOB(JOBCODE),
foreign key(DEPTNO) references DEPT(DEPTNO));

describe DEPT;
describe JOB;
describe EMP;

insert into DEPT values (50, 'ΠΩΛΗΣΕΙΣ', 'ΑΘΗΝΑ'), (60, 'ΛΟΓΙΣΤΗΡΙΟ', 'ΑΘΗΝΑ'), (70, 'ΜΙΣΘΟΔΟΣΙΑ', 'ΒΟΛΟΣ');
insert into JOB values (100, 'ΠΩΛΗΤΗΣ', 2200), (200, 'ΑΝΑΛΥΤΗΣ', 2000), (300, 'ΧΕΙΡΙΣΤΗΣ', 1000);
insert into EMP values (10, 'ΣΠΥΡΟΥ', 100, 50, 450), (20, 'ΧΡΗΣΤΟΥ', 200, 50, null), (30, 'ΝΙΚΟΥ', 300, 60, null), (40, 'ΣΠΥΡΟΥ', 200, 50, null);

--ΕΡΩΤΗΜΑ 6
select EMPNO, NAME, JOB_DESCR, SAL, DEPTNO from EMP join JOB on JOBNO = JOBCODE where JOB_DESCR = 'ΠΩΛΗΤΗΣ';

--ΕΡΩΤΗΜΑ 7
select max(SAL) as MAX_SAL, min(SAL) as MIN_SAL, avg(SAL) as AVG_SAL, count(SAL) as CNT_SAL, count(COMM) as CNT_COMM, count(*) as CNT_ALL
from EMP join JOB on JOBNO = JOBCODE;

--ΕΡΩΤΗΜΑ 8
select max(SAL), avg(SAL) from EMP join JOB on JOBNO = JOBCODE
where JOB_DESCR = 'ΑΝΑΛΥΤΗΣ';

--ΕΡΩΤΗΜΑ 9
select EMPNO, NAME, JOB_DESCR, SAL, DEPT_NO from EMP join JOB on JOBNO = JOBCODE
where JOB_DESCR = 'ΑΝΑΛΥΤΗΣ' and SAL between 1000 and 2500;

--ΕΡΩΤΗΜΑ 10
select EMPNO, NAME, JOB_DESCR, SAL, DEPT_NO from EMP join JOB on JOBNO = JOBCODE
where NAME like '%Ρ';

--ΕΡΩΤΗΜΑ 11
select EMPNO, NAME, JOB_DESCR, SAL, DEPTNO from EMP join JOB on JOBNO = JOBCODE
order by DEPTNO, SAL;

--ΕΡΩΤΗΜΑ 12
select DEPTNO, avg(SAL), count(*) from EMP join JOB on JOBNO = JOBCODE
group by DEPTNO;

--ΕΚΤΕΛΕΣΗ ΕΡΩΤΗΜΑΤΩΝ