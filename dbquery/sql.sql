show databases;
create database Laba;
use Laba;



create table adminusers(id int primary key auto_increment,fname varchar(250),lname varchar(250),location varchar(250),profile_pic varchar(250),email varchar(250),password varchar(250),auth varchar(250)) ;
create table books(id int primary key auto_increment,pr_name varchar(200),pr_price int,pr_des varchar(255),pr_avil varchar(20),pr_pic varchar(60),pr_author varchar(150));



create table cart(email varchar(100),pr_id int,quantity int,price int,total int,address varchar(200),mobile bigint,status varchar(30),orderdate varchar(100),pickupdate varchar(100),returndate varchar(100),cart_id bigint auto_increment primary key,cancelleddate varchar(255));





create table users(id int primary key auto_increment,fname varchar(100),lname varchar(100),email varchar(200),password varchar(100),city varchar(100),profile_pic varchar(100),phone bigint);


create table pickuplocation(id int primary key auto_increment,name varchar(250),city varchar(250));

insert into pickuplocation(name,city) values("the Story Store","Kharghar"),("the Kid Store","Kanpur");
insert into adminusers(fname,lname,location,email,password,auth) values("admin","laba","Kharghar","admin@gmail.com","12345678","admin");

select * from users;
select * from adminusers;
select * from cart;

