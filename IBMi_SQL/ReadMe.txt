-- Use any test library name instead 'OXBLIB'
-- All the file sources will be created in the given lib only
-- This could be a lib that doesn't already exist on the sys

CALL QSYS.CREATE_SQL_SAMPLE ('OXBLIB')

-- Similarly for XML tables, use the following

CALL QSYS.CREATE_XML_SAMPLE ('OXBXMLLIB')

Creates following 13 tables
ACT
CL_SCHED
DEPARTMENT
EMP_PHOTO
EMP_RESUME
EMPLOYEE
EMPPROJACT
IN_TRAY
ORG
PROJACT
PROJECT
SALES
STAFF

Here's command to delete these tables
SET SCHEMA X ;
DROP TABLE ACT ;
DROP TABLE CL_SCHED ;
DROP TABLE DEPARTMENT ;
DROP TABLE EMP_PHOTO ;
DROP TABLE EMP_RESUME ;
DROP TABLE EMPLOYEE ;
DROP TABLE EMPPROJACT ;
DROP TABLE IN_TRAY ;
DROP TABLE ORG ;
DROP TABLE PROJACT ;
DROP TABLE PROJECT ;
DROP TABLE SALES ;
DROP TABLE STAFF ;
