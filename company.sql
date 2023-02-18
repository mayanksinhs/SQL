CREATE DATABASE company;
USE company;

CREATE TABLE `Orders` (
  `order_id` INT NOT NULL,
  `customer_name` VARCHAR(255),
  `city` VARCHAR(255),
  `order_total` DECIMAL(5,2),
  `order_date` VARCHAR(255),
  PRIMARY KEY (order_id)
);
INSERT INTO `Orders` 
(`order_id`,`customer_name`,`city`,`order_total`,`order_date`) VALUES
 (1080,"Nell L. Aguirre","Hanam","109.31","2020-04-11
 11:32:51"),(1081,"Dustin Love","Minucciano","29.57","2020-06-28
 06:39:49"),(1082,"Judah Frazier","Monte San Savino","28.57","2020-05-24
 18:44:27"),(1083,"Macey Ingram","Rouen","68.68","2020-07-24
 17:09:53"),(1084,"Jayme H. Blackburn","San Giorgio 
Albanese","45.98","2020-08-29 02:21:02"),(1085,"Xavier
 Gould","Eluru","92.44","2020-06-25 08:43:08"),(1086,"Desiree
 Buckley","Rotem","37.64","2020-11-11 21:28:12"),(1087,"Elvis
 Contreras","Montluçon","28.15","2020-04-10 05:56:04"),(1088,"Felix Q.
 Whitaker","Bristol","40.79","2020-03-21 03:13:03"),(1089,"Katell
 Willis","Quarona","101.34","2020-02-03 02:05:00");
INSERT INTO `orders`
 (`order_id`,`customer_name`,`city`,`order_total`,`order_date`) VALUES
 (1090,"Austin T. Casey","Cardiff","108.22","2020-05-06 
11:55:54"),(1091,"Dalton Q. Sims","Cefalà Diana","104.04","2020-06-08
 01:50:00"),(1092,"Althea C. Townsend","Ruda","44.65","2020-10-12
 07:46:17"),(1093,"Ruby Rivas","Colico","108.03","2020-07-09 
18:34:27"),(1094,"Fletcher H. Moses","Leugnies","69.27","2020-01-16
 22:59:23"),(1095,"Britanney D. Pitts","Minneapolis","86.91","2020-09-23
 01:17:49"),(1096,"Ginger A. Roth","Beho","106.51","2020-11-08
 16:54:30"),(1097,"Merritt A. Humphrey","Pomarolo","50.84","2020-07-25
 01:10:52"),(1098,"Ina Rush","Herne","84.31","2020-08-17
 23:27:09"),(1099,"Dana Rasmussen","Gary","57.83","2020-09-06 12:48:52");

select * from orders; 
-- IF() Function
 SELECT customer_name, 
 IF(order_total>100,"yes","no") AS is_high_value
 FROM orders 
 where order_date>'2020-09-01';
 
SELECT customer_name 
FROM orders 
WHERE IF(order_total>100,"yes","no") = "yes"
AND order_date>'2020-09-01';
 
-- IF() function with aggregate function
SELECT 
SUM(IF(city LIKE 'H%', order_total, 0)) AS total 
FROM orders;

-- Using COUNT with IF to group againts Ranges
SELECT 
    COUNT(IF(order_total < 50, 1, NULL)) AS low_value_customer,
    COUNT(IF(order_total > 50 AND order_total < 100,
        1,
        NULL)) AS high_value_customer,
    COUNT(IF(order_total > 100, 1, NULL)) AS premium_customer
FROM
    orders;

-- IF ELSE


create table author (author_id integer primary key, 
                            authorName varchar(30), 
                            email varchar (25), gender varchar (6));

create table book (BookId integer not null unique, 
                        ISBN integer primary key, 
                       book_name varchar (30) not null, 
                        author integer, ed_num integer, 
                      price integer, pages integer, 
         foreign key (author) references author (author_id) on delete cascade);
         
insert into author values 
              (1, "Kraig Muller", "Wordnewton@gmail.com", "Male");
insert into author values
              (2, "Karrie Nicolette", "karrie23@gmail.com", "Female");
insert into book values
              (1, 001, "Glimpses of the past", 1, 1, 650, 396);
insert into book values
              (2, 002, "Beyond The Horizons of Venus", 1, 1, 650, 396);
insert into book values
              (3, 003, "Ultrasonic Aquaculture", 2, 1, 799, 500);
insert into book values
              (4, 004, "Cyrogenic Engines", 2, 1, 499, 330); 
              
delimiter //
create procedure display_book() 
begin 
	select *from book; 
end //
call display_book(); //

delimiter //
create procedure update_price (IN temp_ISBN varchar(10), IN new_price integer)
begin
	update book set price=new_price where ISBN=temp_ISBN;
end; //
call update_price(001, 600);


create table IfelseDemo(
id int,
FirstName varchar(100)
);

insert into IfelseDemo values(1,'John'), (2,'Carol'), (3,'John'), (4,'Carol'), (5,'John');

-- CASE
SELECT id, FirstName, 
(case when (id = 2 and FirstName = 'Carol')
then
'Welcome Carol'
else
'You are not Carol with id 2'
end)as Message 
from IfelseDemo;

select id,
	if (subject='Computer', B.Tech, Null)
from student_info;