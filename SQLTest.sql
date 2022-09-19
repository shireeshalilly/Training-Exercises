create database SQLTest;

use SQLTest;

create table customer(
customerid int AUTO_INCREMENT primary key,
firstname varchar(25) not null,
lastname varchar(25) not null,
phoneno varchar(10) not null,
emailid varchar(250) not null,
address varchar(250) not null);

create table flight(
flightid int primary key,
start varchar(250) not null,
destination varchar(250) not null,
traveldate date not null,
price int not null,
noofseats int not null);

create table booking(
t_id int AUTO_INCREMENT primary key,
flightid int not null,
customerid int not null,
foreign key(flightid) references flight(flightid),
foreign key(customerid) references customer(customerid));

insert into customer values
(NULL, 'Shireesha', 'Chauhan', '9445871812', 'shiri@gmail.com', 'Bengaluru'),
(NULL, 'Vaishnavi', 'N', '8966680887', 'vaish@gmail.com', 'Bengaluru'),
(NULL, 'Deekshith', 'A', '7890899760', 'deekshu@gmail.com', 'Rajasthan'),
(NULL, 'Kiran', 'M', '7799559987', 'kiran@gmail.com', 'Mysore');

insert into flight values
(101, 'Bengaluru', 'Rajasthan', '2022-09-04', 10000, 100),
(103, 'Mysore', 'Bengaluru', '2022-09-05', 15000, 150),
(105, 'Rajasthan', 'Mysore', '2022-09-6', 20000, 200),
(106, 'Bengaluru', 'Mysore', '2022-09-7', 10000, 130);

insert into booking values
(NULL,101,1),
(NULL,105,1),
(NULL,103,4),
(NULL,106,4);

alter table booking rename column flightid to Flightid;

create view customerdetails as
select c.customerid, c.firstname,c.lastname, f.flightid, f.destination, f.start, f.price, f.traveldate
from customer c, flight f, booking b
where c.customerid = b.customerid AND f.flightid=b.Flightid;

create view cust_per_flight as
select f.flightid,count(b.Flightid) from flight f, booking b where f.flightid=b.Flightid group by b.Flightid;

create view per_flight_revenue as
select f.flightid, f.price * count(b.Flightid) as revenue
from flight f, booking b
where f.flightid = b.Flightid
GROUP BY b.Flightid;


