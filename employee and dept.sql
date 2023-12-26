use employee;
create table employee(
empno int not null,
ename varchar(100),
job varchar(100) default 'clerk',
mgr int,
hiredate date,
sal float, check (sal>0),
comm float,
foreign key (deptno) references dept(deptno),
deptno int
);
select *from employee;
drop table dept;
create table dept(
deptno int primary key,
dname varchar(20),
loc varchar(20)
);

select *from dept;

insert into dept (deptno,dname,loc) values
(10,'operations','BOSTAN'),
(20,'research','DALLAS'),
(30,'sales','CHICAGO'),
(40,'accounting','NEWYORK');
select *from dept;

insert into Employee values(7369,'SMITH','CLERK',7902,'1890-12-17',800.00,NULL ,20),
					       (7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600.00,300.00,30),
                            (7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500.00,30),
                            (7566,'JONES','MANAGER',7839,'1981-04-02',2975.00,NULL,20),
                            (7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250.00,1400.00,30),
                            (7698,'BLAKE','MANAGER',7839,'1981-05-01',2850.00,NULL,30),
                            (7782,'CLARK','MANAGER',7839,'1981-06-09',2450.00,NULL,10),
                            (7788,'SCOTT','ANALYST',7566,'1987-04-19',3000.00,NULL,20),
                            (7839,'KING','PRESIDENT',NULL,'1981-11-17',5000.00,NULL,10),
                            (7844,'TURNER','SALESMAN',7698,'1981-09-08',1500.00,0.00,30),
                            (7876,'ADAMS','CLERK',7788,'1987-05-23',1100.00,NULL,20),
                            (7900,'JAMES','CLERK',7698,'1981-12-03',950.00,NULL,30),
                            (7902,'FORD','ANALYST',7566,'1981-12-03',3000.00,NULL,20),
                            (7934,'MILLER','CLERK',7782,'1982-01-23',1300.00,NULL,10);

###3
select empno,ename,sal from employee where sal>1000;
truncate employee;

###4
select ename from employee where hiredate<'1981-09-01';

##5
select ename from employee where ename like'_a%';

##6
select ename,sal,Allowances,PF,(sal+Allowances+PF) as NetSalary from(
select ename,sal,(10/100*sal) as Allowances,(10/100*sal) as PF from employee)A;

##7
select ename,mgr from employee where mgr is null;

##8
select empno,ename,sal from employee order by sal asc;

##9
select count(job) from employee;

##10
select sum(sal) from employee where job='Salesman';

##11
select avg(sal) from employee group by job;

##12
select ename,sal,dname from employee e inner join dept d on e.deptno=d.deptno;

##13
create table Jobgrades(
grade varchar(10),
Lowest_sal int,
Highest_sal int
);

insert into Jobgrades values('A',0,999),
							('B',1000,1999),
                            ('C',2000,2999),
                            ('D',3000,3999),
                            ('E',4000,5000);
select *from jobgrades;
drop table jobgrades;
##14
select ename,sal,grade from(select ename,sal,(
case
when sal<999 then "Grade A"
when sal>1000 and sal<1999 then "Grade B"
when sal>2000 and sal<2999 then "Grade C"
when sal>3000 and sal<3999 then "Grade D"
when sal>4000 and sal<5000 then "Grade E"
end) as grade from employee)a order by sal asc;

##15
select b.mgr,(b.ename) as Emp,(a.ename) as mgr from employee A,employee B where a.empno=b.mgr;

##16
select ename,sal+comm as total_sal from employee;

##17
select ename,sal from employee where empno%2=1;

##18
select ename,rank_sal,rank_dept from(select ename,rank() over (partition by deptno order by sal desc) as rank_sal,
rank() over (partition by deptno order by sal desc)as rank_dept from employee)a; 

##19
select ename from employee order by sal desc limit 3;

##20
select e.ename,e.deptno from employee e where e.sal in(select max(sal) from employee group by deptno);
