USE leavemanage;

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

ALTER TABLE lms_book_details
MODIFY BOOK_CODE int not null auto_increment;

SELECT * FROM lms_book_issue;

INSERT INTO lms_book_details SET  BOOK_TITLE='BOOK1',CATEGORY='FICTION',AUTHOR='AUTHOR1',PUBLICATION='P1',
PUBLISH_DATE=20000224,BOOK_EDITION=3,PRICE=250,RACK_NUM='A',DATE_ARRIVAL=20040614,
SUPPLIER_ID='1';
INSERT INTO lms_book_details SET BOOK_TITLE='BOOK2',CATEGORY='NONFICTION',AUTHOR='AUTHOR2',PUBLICATION='P2',
PUBLISH_DATE=20000623,BOOK_EDITION=3,PRICE=300,RACK_NUM='A',DATE_ARRIVAL=20040724,
SUPPLIER_ID='1';
INSERT INTO lms_book_details SET BOOK_TITLE='BOOK3',CATEGORY='FICTION',AUTHOR='AUTHOR3',PUBLICATION='P3',
PUBLISH_DATE=20010122,BOOK_EDITION=2,PRICE=220,RACK_NUM='A',DATE_ARRIVAL=20040625,
SUPPLIER_ID='2';
INSERT INTO lms_book_details SET BOOK_TITLE='BOOK4',CATEGORY='NONFICTION',AUTHOR='AUTHOR1',PUBLICATION='P1',
PUBLISH_DATE=20030524,BOOK_EDITION=1,PRICE=350,RACK_NUM='B',DATE_ARRIVAL=20060614,
SUPPLIER_ID='3';

INSERT INTO lms_book_issue SET  MEMBER_ID='MEM1',BOOK_CODE='1001',DATE_ISSUE=20190702,DATE_RETURN=20190710,DATE_RETURNED=20190709,
BOOK_ISSUE_STATUS='Y',FINE_RANGE=3;
INSERT INTO lms_book_issue SET  MEMBER_ID='MEM2',BOOK_CODE='1002',DATE_ISSUE=20190921,DATE_RETURN=20190921,DATE_RETURNED=20190921,
BOOK_ISSUE_STATUS='N',FINE_RANGE=3;
INSERT INTO lms_book_issue SET  MEMBER_ID='MEM3',BOOK_CODE='1003',DATE_ISSUE=20190820,DATE_RETURN=20190921,DATE_RETURNED=20190921,
BOOK_ISSUE_STATUS='Y',FINE_RANGE=3;
INSERT INTO lms_book_issue SET  MEMBER_ID='MEM4',BOOK_CODE='1004',DATE_ISSUE=20190922,DATE_RETURN=20190921,DATE_RETURNED=20190921,
BOOK_ISSUE_STATUS='Y',FINE_RANGE=3;

SELECT * FROM lms_book_issue;