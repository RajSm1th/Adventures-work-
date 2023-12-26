use sales;
##1
create table salespeople(
snum int primary key,
sname varchar(20),
city varchar(20),
comm float
);

insert into salespeople values(1001,'Peel','London',0.12),
								(1002,'Serres','San Jose',0.13),
                                (1003,'Axelrod','New York',0.10),
                                (1004,'Motika','London',0.11),
                                (1007,'Rafkin','Barcelona',0.15);

select * from salespeople;

##2
create table cust (
cnum int primary key,
cname varchar(20),
city varchar(20),
rating int,
snum int,
foreign key(snum) references salespeople(snum)
);

insert into cust values(2001,"Hoffman","London",100,1001),
						(2002,'Giovanne','Rome',200,1003),
                        (2003,'Liu','San Jose',300,1002),
                        (2004,'Grass','Berlin',100,1002),
                        (2006,'Clemens','london',300,1007),
                        (2007,'Pereira','Rome',100,1004),
                        (2008,'James','London',200,1007);

##3
create table orders (
onum int,
amt float,
odate date,
cnum int,
snum int,
foreign key (cnum) references salespeople(cnum),
foreign key (snum) references cust(snum)
);

insert into orders values (3001,18.69,'1994-10-03',2008,1007),
						(3002,1900.10,'1994-10-03',2007,1004),
                        (3003,767.19,'1994-10-03',2001,1001),
                        (3005,5160.45,'1994-10-03',2003,1002),
                        (3006,1098.16,'1994-10-04',2008,1007),
                        (3007,75.75,'1994-10-05',2004,1002),
                        (3008,4723.00,'1994-10-05',2006,1001),
                        (3009,1713.23,'1994-10-04',2002,1003),
                        (3010,1309.95,'1994-10-06',2004,1002),
                        (3011,9891.88,'1944-10-06',2006,1001);

##4
select s.sname,c.cname,c.city from salespeople s inner join cust c on s.city=c.city;

##5
