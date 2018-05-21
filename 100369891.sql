CREATE TABLE STUDENTS(
STUD_NUMBER		NUMERIC(11) NOT NULL,
FIRST_NAME		CHAR(20) NOT NULL,
LAST_NAME       CHAR(20) NOT NULL,
PASSWORD		CHAR(18) NOT NULL,
CONSTRAINT STUDENTS_PRIMARY_KEY PRIMARY KEY (STUD_NUMBER),
CONSTRAINT STUD_NO CHECK (STUD_NUMBER=11));

INSERT INTO STUDENTS( STUD_NUMBER,FIRST_NAME,LAST_NAME,PASSWORD)
VALUES(12312312311,'JOHN','MACH','SPIDERMAN'),
(11112222232,'JIM','CARIG','LALACODE');

CREATE TABLE EVENTS(
EVENT_ID		NUMERIC(11) NOT NULL,
STUD_NUMBER		NUMERIC(11) NOT NULL,
EVENT_NAME      CHAR(20) NOT NULL,
EVENT_TIME		CHAR(5),
EVENT_DATE		CHAR(10) NOT NULL,
CONSTRAINT EVENTS_PRIMARY_KEY PRIMARY KEY (EVENT_ID),
CONSTRAINT EVENTS_FOREIGN_KEY FOREIGN KEY (STUD_NUMBER) REFERENCES STUDENTS (STUD_NUMBER));

INSERT INTO EVENTS
VALUES ( 772, 12312312311,'PARTY','12:00','12/11'),
(213,11112222232,'SOMETHING','11:22','32/11');

CREATE TABLE STAFF(
STAFF_ID NUMERIC(11) NOT NULL,
STAFF_NAME CHAR(20) NOT NULL,
PHONE_NO    NUMERIC(11),
EMAIL		CHAR (20),
LOCATION	CHAR(10),
STAFF_TIME  CHAR(11),
CONSTRAINT STAFF_PRIMARY_KEY PRIMARY KEY (STAFF_ID),
CONSTRAINT PHONE CHECK (PHONE_NO=11));

INSERT INTO STAFF
VALUES ( 321321,'MR LANA JOHN',12367809844,'MAGIC@MAIL.ORG','B204','10:00-12:00'),
( 123123,'MR SINATRA',09898989898,'LALA@MAIL.ORG','B203','11:00-12:00');

CREATE TABLE MODULES(
MODULE_CODE		CHAR(6) NOT NULL,
MODULE_NAME		CHAR(20) NOT NULL,
LEADER_ID       NUMERIC(11) NOT NULL,
DESCRIPTION		CHAR(40),
CONSTRAINT MODULES_FOREIGN_KEY FOREIGN KEY (LEADER_ID) REFERENCES STAFF (STAFF_ID),
CONSTRAINT MODULES_PRIMARY_KEY PRIMARY KEY (MODULE_CODE),
CONSTRAINT MODULE_CODES CHECK (MODULE_CODE=6));

INSERT INTO MODULES
VALUES ( 'B12312','PROGRAMMING',321321,'FIRST DESCRIPTION IS HERE'),
( 'C32132','CODING',123123,'SECOND DESCRIPTION IS HERE');

CREATE TABLE ENROLMENT(
STUD_NUMBER		NUMERIC(11) NOT NULL,
MODULE_CODE		CHAR(6)     NOT NULL,
CONSTRAINT ENR_STUD_FOREIGN_KEY FOREIGN KEY (STUD_NUMBER) REFERENCES STUDENTS (STUD_NUMBER),
CONSTRAINT ENR_MOD_FOREIGN_KEY FOREIGN KEY (MODULE_CODE) REFERENCES MODULES(MODULE_CODE));

INSERT INTO ENROLMENT
VALUES (12312312311,'B12312'),
(11112222232,'C32132');

CREATE TABLE ASSESMENTS(
ASSESMENT_ID	NUMERIC(11) NOT NULL,
MODULE_CODE		CHAR(6) NOT NULL,
DEADLINE 		CHAR (10) NOT NULL,
DESCRIPTION		CHAR(40),
CONSTRAINT ASSESMENT_PRIMARY_KEY PRIMARY KEY (ASSESMENT_ID),
CONSTRAINT ASSESMENTS_FOREIGN_KEY FOREIGN KEY (MODULE_CODE) REFERENCES MODULES (MODULE_CODE),
CONSTRAINT ASSESMENTS CHECK (ASSESMENT_ID = 11));

INSERT INTO ASSESMENTS
VALUES(09876543211,'B12312','11/21','ONE DESCRIPTION HERE'),
(12345678900,'C32132','21/11','NEW PROJECT FOR THIS ASSESMENT');

CREATE TABLE SESSION_TYPE(
SESSION_TYPE CHAR (10) NOT NULL,
DESCRIPTION  CHAR(20),
CONSTRAINT SESSION_PRIMARY_KEY PRIMARY KEY (SESSION_TYPE));

INSERT INTO SESSION_TYPE
VALUES ( 'TUTORIAL' , ' THIS IS A TUTORIAL'),
('LECTURE','THIS IS A LECTURE');

CREATE TABLE DAYS(
DAY_NUMBER NUMERIC(2) NOT NULL,
DAY_TEXT   CHAR (10) NOT NULL,
CONSTRAINT DAYS_PRIMARY_KEY PRIMARY KEY (DAY_NUMBER));

INSERT INTO DAYS
VALUES (1,'MON'),
(2,'TUE'),
(3,'WED'),
(4,'THU'),
(5,'FRI'),
(6,'SAT'),
(7,'SUN');

CREATE TABLE SCHEDULE(
SCHEDULE_ID CHAR(6) NOT NULL,
TERM 		CHAR (3) NOT NULL,
MODULE_CODE CHAR(6) NOT NULL, 
LOCATION    CHAR (10) NOT NULL,
DAYS        NUMERIC(1) NOT NULL,
CLASS_TIME  CHAR (20),
SESSION_TYPE CHAR (10) NOT NULL,
STAFF_ID	NUMERIC(11),
CONSTRAINT SCHEDULE_PRIMARY_KEY PRIMARY KEY (SCHEDULE_ID),
CONSTRAINT DAYS_FOREIGN_KEY FOREIGN KEY (DAYS) REFERENCES DAYS (DAY_NUMBER),
CONSTRAINT SCHEDULE_ST_FOREIGN_KEY FOREIGN KEY (SESSION_TYPE) REFERENCES SESSION_TYPE (SESSION_TYPE),
CONSTRAINT SCHEDULE_FOREIGN_KEY FOREIGN KEY (MODULE_CODE) REFERENCES MODULES (MODULE_CODE),
CONSTRAINT SCHEDULE_STAFF_FOREIGN_KEY FOREIGN KEY (STAFF_ID) REFERENCES STAFF (STAFF_ID),
CONSTRAINT SCHEDULE CHECK (SCHEDULE_ID=6));

INSERT INTO SCHEDULE
VALUES ( 'BB1231','SUM','B12312','HEAP',1,'11:00','TUTORIAL',321321),
( 'CC1231','WIN','C32132','B201',6,'08:00','LECTURE',123123);

CREATE TABLE SPECIFIC_TUTORIAL(
SCHEDULE_ID 	CHAR(6) NOT NULL,
STUD_NUMBER		NUMERIC(11) NOT NULL,
MODULE_CODE 	CHAR(6) NOT NULL, 
CONSTRAINT SPECIFIC_SCHEDULE_FOREIGN_KEY FOREIGN KEY(SCHEDULE_ID) REFERENCES SCHEDULE (SCHEDULE_ID),
CONSTRAINT SPECIFIC_STUD_FOREIGN_KEY FOREIGN KEY (STUD_NUMBER) REFERENCES STUDENTS (STUD_NUMBER),
CONSTRAINT SPECIFIC_MODULE_FOREIGN_KEY FOREIGN KEY (MODULE_CODE) REFERENCES MODULES (MODULE_CODE));

INSERT INTO SPECIFIC_TUTORIAL
VALUE ('BB1231',12312312311,'B12312');




