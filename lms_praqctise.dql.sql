create database lib;
use lib;

Create Table LMS_BOOK_ISSUE(
BOOK_ISSUE_NO int not null auto_increment PRIMARY KEY,
MEMBER_ID varchar(10),
BOOK_CODE VARCHAR(10),
DATE_ISSUE DATE,
DATE_RETURN DATE,
DATE_RETURNED DATE,
BOOK_ISSUE_STATUS VARCHAR(20),
FINE_RANGE VARCHAR(3)
);

select * from LMS_BOOK_ISSUE;

ALTER TABLE lms_book_details
MODIFY BOOK_CODE int not null auto_increment;

alter table LMS_BOOK_ISSUE
add memFk int;

alter table LMS_BOOK_ISSUE
add foreign key (memFk) references lms_members(MEMBER_ID);

alter table LMS_BOOK_ISSUE
modify BidFk varchar(10);

alter table LMS_BOOK_ISSUE
add foreign key (BidFk) references lms_book_details(BOOK_CODE);

alter table LMS_BOOK_ISSUE
add FrFk int(11);

alter table LMS_BOOK_ISSUE
add foreign key (FrFk) references lms_fine_details(FINE_RANGE);

alter table lms_book_details
add SidFk int(11);

alter table lms_book_details
add foreign key (SidFk) references lms_supplier_details(SUPPLIER_ID);



SELECT * FROM lms_book_issue WHERE BOOK_ISSUE_STATUS='Y';

select MEMBER_ID,BOOK_CODE from lms_book_issue where BOOK_CODE='1001';

INSERT INTO lms_book_issue SET  MEMBER_ID='MEM1',BOOK_CODE='1001',DATE_ISSUE=20190702,DATE_RETURN=20190710,DATE_RETURNED=20190709,
BOOK_ISSUE_STATUS='Y',FINE_RANGE=3;
INSERT INTO lms_book_issue SET  MEMBER_ID='MEM2',BOOK_CODE='1002',DATE_ISSUE=20190921,DATE_RETURN=20190921,DATE_RETURNED=20190921,
BOOK_ISSUE_STATUS='N',FINE_RANGE=3;
INSERT INTO lms_book_issue SET  MEMBER_ID='MEM3',BOOK_CODE='1003',DATE_ISSUE=20190820,DATE_RETURN=20190921,DATE_RETURNED=20190921,
BOOK_ISSUE_STATUS='Y',FINE_RANGE=3;
INSERT INTO lms_book_issue SET  MEMBER_ID='MEM4',BOOK_CODE='1004',DATE_ISSUE=20190922,DATE_RETURN=20190921,DATE_RETURNED=20190921,
BOOK_ISSUE_STATUS='Y',FINE_RANGE=3;


SELECT MEMBER_ID,BOOK_ISSUE_STATUS FROM lms_book_issue;

/*Problem8*/
SELECT MEMBER_ID,DATE_ISSUE FROM lms_book_issue where DATE_ISSUE=20190922 ;

create table LMS_BOOK_DETAILS
(
	BOOK_CODE VARCHAR(10),
    BOOK_TITLE VARCHAR(50),
    CATEGORY VARCHAR(15),
    AUTHOR VARCHAR(30),
    PUBLICATION VARCHAR(3),
    PUBLISH_DATE DATE,
    BOOK_EDITION INT,
    PRICE INT,
    RACK_NUM VARCHAR(3),
    DATE_ARRIVAL DATE,
    SUPPLIER_ID int(3),
    PRIMARY KEY (BOOK_CODE)
);

insert into  LMS_BOOK_DETAILS(BOOK_CODE,BOOK_TITLE,CATEGORY,AUTHOR,PUBLICATION,PUBLISH_DATE,BOOK_EDITION,PRICE,RACK_NUM,DATE_ARRIVAL)
values('BL000022','Java','XComputers','Sanchit','p1','20190704','2','1099','8','20190712');

insert into  LMS_BOOK_DETAILS(BOOK_CODE,BOOK_TITLE,CATEGORY,AUTHOR,PUBLICATION,PUBLISH_DATE,BOOK_EDITION,PRICE,RACK_NUM,DATE_ARRIVAL)
values('BL000001','C++','XComputers','Sahil','p2','20190704','1','999','6','20190712');

insert into  LMS_BOOK_DETAILS(BOOK_CODE,BOOK_TITLE,CATEGORY,AUTHOR,PUBLICATION,PUBLISH_DATE,BOOK_EDITION,PRICE,RACK_NUM,DATE_ARRIVAL)
values('BL000003','Java','XComputers','Sanchit','p3','20190704','3','1000','5','20190712');

insert into  LMS_BOOK_DETAILS(BOOK_CODE,BOOK_TITLE,CATEGORY,AUTHOR,PUBLICATION,PUBLISH_DATE,BOOK_EDITION,PRICE,RACK_NUM,DATE_ARRIVAL)
values('BL000004','C++','XComputers','Sahil','p4','20190704','2','599','2','20190712');

insert into  LMS_BOOK_DETAILS(BOOK_CODE,BOOK_TITLE,CATEGORY,AUTHOR,PUBLICATION,PUBLISH_DATE,BOOK_EDITION,PRICE,RACK_NUM,DATE_ARRIVAL)
values('BL000005','C','XComputers','Sanchit','p5','20190704','1','899','1','20190712');


insert into  LMS_BOOK_DETAILS(BOOK_CODE,BOOK_TITLE,CATEGORY,AUTHOR,PUBLICATION,PUBLISH_DATE,BOOK_EDITION,PRICE,RACK_NUM,DATE_ARRIVAL)
values('BL000006','Java','XComputers','Sanchit','p6','20190704','2','1099','8','20190712');


insert into  LMS_BOOK_DETAILS(BOOK_CODE,BOOK_TITLE,CATEGORY,AUTHOR,PUBLICATION,PUBLISH_DATE,BOOK_EDITION,PRICE,RACK_NUM,DATE_ARRIVAL)
values('BL000007','Python','XComputers','Sanchit','p7','20190704','2','1099','5','20190712');


insert into  LMS_BOOK_DETAILS(BOOK_CODE,BOOK_TITLE,CATEGORY,AUTHOR,PUBLICATION,PUBLISH_DATE,BOOK_EDITION,PRICE,RACK_NUM,DATE_ARRIVAL)
values('BL000008','Java','XComputers','Sanchit','p8','20190704','2','1099','4','20190712');

insert into  LMS_BOOK_DETAILS(BOOK_CODE,BOOK_TITLE,CATEGORY,AUTHOR,PUBLICATION,PUBLISH_DATE,BOOK_EDITION,PRICE,RACK_NUM,DATE_ARRIVAL)
values('BL0000012','Java','XComputers','Sanchit','p1','20190704','2','1099','1','20120401');

/*Problem4*/
SELECT BOOK_CODE,BOOK_TITLE,AUTHOR FROM LMS_BOOK_DETAILS WHERE AUTHOR like's%';

/*Problem5*/
select count(*) as No_of_books from LMS_BOOK_DETAILS where BOOK_TITLE='Java' ;

/*Problem6*/
select count(*) as No_of_books from LMS_BOOK_DETAILS where PUBLICATION='p1' ;

/*Problem7*/
select BOOK_CODE,BOOK_TITLE from LMS_BOOK_DETAILS where PUBLICATION='p1' ;

SELECT BOOK_CODE,BOOK_TITLE,SUPPLIER_NAME
  FROM LMS_BOOK_DETAILS JOIN LMS_SUPPLIER_DETAILS ;


select MEMBER_ID,(select MEMBER_NAME from LMS_MEMBERS where MEMBER_ID=t1.MEMBER_ID )
as MEMBER_NAME,BOOK_CODE,(select BOOK_TITLE from LMS_BOOK_DETAILS where BOOK_CODE=t1.BOOK_CODE)
as BOOK_TITLE from LMS_BOOK_ISSUE t1 ;

/*Problem13*/
select AVG(PRICE) from LMS_BOOK_DETAILS ;

/*LMS_SUPPLIE_DETAILS*/
CREATE TABLE LMS_SUPPLIER_DETAILS
(
	SUPPLIER_ID int(3) auto_increment,
    SUPPLIER_NAME VARCHAR(30),
    ADDRESS VARCHAR(50),
    CONTACT VARCHAR(20),
    EMAIL VARCHAR(30),
    PRIMARY KEY(SUPPLIER_ID)
);
select *from LMS_BOOK_DETAILS;
select *from LMS_SUPPLIER_DETAILS;

INSERT INTO LMS_SUPPLIER_DETAILS(SUPPLIER_NAME,ADDRESS,CONTACT,EMAIL) VALUES ('ABC STORE','ABC ROAD','9858745855','ABC@gmail.com');
INSERT INTO LMS_SUPPLIER_DETAILS(SUPPLIER_NAME,ADDRESS,CONTACT,EMAIL) VALUES ('ABC STORE','ABC ROAD','9858745855','ABC@gmail.com');
INSERT INTO LMS_SUPPLIER_DETAILS(SUPPLIER_NAME,ADDRESS,CONTACT,EMAIL) VALUES ('XYZ STORE','ABC ROAD','9858745855','ABC@gmail.com');

create table LMS_members
(
MEMBER_ID int(20) not null auto_increment,
MEMBER_NAME VARCHAR(30),
CITY VARCHAR(20),
DATE_REGISTER DATE,
DATE_EXPRE DATE,
MEMBERSHIP_STATUS VARCHAR(15),
PRIMARY KEY (MEMBER_ID)
);
create table LMS_FINE_DETAILS
(

FINE_RANGE int auto_increment,
FINE_AMOUNT INT,
PRIMARY KEY (FINE_RANGE)
);
select * from LMS_FINE_DETAILS;

insert into LMS_FINE_DETAILS(FINE_AMOUNT)
values (50);

insert into LMS_FINE_DETAILS(FINE_AMOUNT)
values (1000);
insert into LMS_FINE_DETAILS(FINE_AMOUNT)
values (5000);
insert into LMS_FINE_DETAILS(FINE_AMOUNT)
values (20);
insert into LMS_FINE_DETAILS(FINE_AMOUNT)
values (5);
insert into LMS_FINE_DETAILS(FINE_AMOUNT)
values (99);
insert into LMS_FINE_DETAILS(FINE_AMOUNT)
values (100);

select *from LMS_members;
insert into LMS_members(MEMBER_NAME,CITY,DATE_REGISTER,DATE_EXPRE,MEMBERSHIP_STATUS)
values('Sahil','jammu','19980717','20050714','Permanent');

insert into LMS_members(MEMBER_NAME,CITY,DATE_REGISTER,DATE_EXPRE,MEMBERSHIP_STATUS)
values('sanchit','bombay','19980917','20060714','Temporary');

insert into LMS_members(MEMBER_NAME,CITY,DATE_REGISTER,DATE_EXPRE,MEMBERSHIP_STATUS)
values('Sahil1','italy','19980817','20090714','Permanent');

insert into LMS_members(MEMBER_NAME,CITY,DATE_REGISTER,DATE_EXPRE,MEMBERSHIP_STATUS)
values('Sahil2','tokyo','19980317','20030714','Temporary');

insert into LMS_members(MEMBER_NAME,CITY,DATE_REGISTER,DATE_EXPRE,MEMBERSHIP_STATUS)
values('Sahil3','china','19980706','20170714','Permanent');

insert into LMS_members(MEMBER_NAME,CITY,DATE_REGISTER,DATE_EXPRE,MEMBERSHIP_STATUS)
values('Sahil4','paris','19980719','20180714','Temporary');


insert into LMS_members(MEMBER_NAME,CITY,DATE_REGISTER,DATE_EXPRE,MEMBERSHIP_STATUS)
values('Sahil5','gadigad','19980719','20180714','Permanent');

insert into LMS_members(MEMBER_NAME,CITY,DATE_REGISTER,DATE_EXPRE,MEMBERSHIP_STATUS)
values('Sahil6','jabalpur','19980719','20180714','Temporary');

insert into LMS_members(MEMBER_NAME,CITY,DATE_REGISTER,DATE_EXPRE,MEMBERSHIP_STATUS)
values('Sahil7','fukechak','19980719','20180714','Permanent');

insert into LMS_members(MEMBER_NAME,CITY,DATE_REGISTER,DATE_EXPRE,MEMBERSHIP_STATUS)
values('Sahil8','jammu','19980719','20180714','Temporary');

insert into LMS_members(MEMBER_NAME,CITY,DATE_REGISTER,DATE_EXPRE,MEMBERSHIP_STATUS)
values('Sahil9','jammu','19980719','20180714','Permanent');

Select Count(*) from LMS_members;

/*Problem1*/
Select MEMBER_ID,MEMBER_NAME,CITY,MEMBERSHIP_STATUS from LMS_members where MEMBERSHIP_STATUS = 'Permanent';

/*Problem11*/
Select MEMBER_ID,MEMBER_NAME,CITY,MEMBERSHIP_STATUS from LMS_members where CITY = 'JAMMU' OR CITY = 'BOMBAY';

/*Problem10*/
Select MEMBER_ID,MEMBER_NAME,CITY,MEMBERSHIP_STATUS,DATE_REGISTER from LMS_members where MEMBERSHIP_STATUS = 'Temporary' 
between 19980718 and 20180714 ;

SELECT COUNT(SUPPLIER_NAME) FROM LMS_SUPPLIER_DETAILS WHERE MAX(SUPPLIER_NAME) ;

/*Average Problem 1*/

select LMS_members.MEMBER_ID,LMS_members.MEMBER_NAME,LMS_BOOK_DETAILS.BOOK_CODE,LMS_BOOK_DETAILS.BOOK_TITLE from LMS_members join LMS_BOOK_DETAILS;

/*Average Problem 2*/
select count(*) from lms_book_issue as “NO_OF_BOOKS_AVAILABLE”  where BOOK_ISSUE_STATUS = 'Y';
/*Average Problem 3*/
select LMS_members.MEMBER_ID,LMS_members.MEMBER_NAME,LMS_FINE_DETAILS.FINE_RANGE,LMS_FINE_DETAILS.FINE_AMOUNT from LMS_members join LMS_FINE_DETAILS where FINE_AMOUNT<100;

/*Average Problem 4*/
select LMS_BOOK_DETAILS.BOOK_CODE ,LMS_BOOK_DETAILS.BOOK_TITLE,LMS_BOOK_DETAILS.BOOK_TITLE,lms_book_issue.BOOK_ISSUE_STATUS
from LMS_BOOK_DETAILS join lms_book_issue where BOOK_ISSUE_STATUS ='Y' and BOOK_TITLE ='Java';
/*Average Problem 5*/
SELECT BOOK_CODE,BOOK_TITLE,RACK_NUM FROM LMS_BOOK_DETAILS where RACK_NUM='5' ORDER BY BOOK_TITLE ASC ;
/*Average Problem 6*/
SELECT MEMBER_ID,
(SELECT MEMBER_NAME FROM LMS_MEMBERS WHERE MEMBER_ID=T1.MEMBER_ID)AS MEMBER_NAME,DATE_RETURN AS DUE_DATE,DATE_RETURNED 
FROM LMS_BOOK_ISSUE T1 WHERE DATE_RETURN < DATE_RETURNED ;
/*Average Problem 7*/
SELECT T1.MEMBER_ID,MEMBER_NAME,DATE_REGISTER 
FROM LMS_MEMBERS T1 LEFT JOIN LMS_BOOK_ISSUE T2 
ON T1.MEMBER_ID = T2.MEMBER_ID 
WHERE T2.MEMBER_ID IS NULL ;
/*Average Problem 8*/
select t1.MEMBER_ID,t2.MEMBER_NAME from LMS_BOOK_ISSUE t1 join LMS_MEMBERS t2 on t1.MEMBER_ID=t2.MEMBER_ID where t1.DATE_RETURN>=t1.DATE_RETURNED and YEAR(t1.DATE_RETURNED)=2012 ;

