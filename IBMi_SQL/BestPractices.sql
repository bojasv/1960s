Minimize SQL requests from your application, as each time the statments executes, 
the data is sent from the current address space (say RPG or CL) to the DB2 address space

SELECT only required columns, or SELECT 'Y', avoid SELECT *  
Avoid un-necessary sorts (ORDER BY)  
While comparing columns with host variables, ensure fields-attributes are matched
Specify cursor use while a cursor is DECLARE. FOR FETCH ONLY, or FOR READ ONLY
Minimize OPEN/CLOSE of a CURSOR
  
[ ] WHERE Year(EmpDOJ) = 2022  
[x] WHERE EmpDOJ BETWEEN '2022-01-01' AND '2022-12-31'  
  
[ ] WHERE PayDate - 7 DAYS > :wk_Date  
[x] WHERE PayDate > :wk_Date + 7 DAYS

Use SQLSTATE over SQLCODE
Use SQLER3, over GET DIAGNOSTICS  
SELECT Column0 FROM Table1 (INSERT INTO Table0 (Column0, Column1) VALUES (NEXT VALUES FOR Column0, 'Test Data'));
Use of MERGE, rather SELECT, 'IF-Else-EndIf' block, INSERT and UPDATE

-- Check Current Number of Records
SELECT COUNT(*) FROM TSTLIB.TSTFILE;
-- Check If any deleted record. If DELETED_RCDS > 0, i.e. RRN can't be same as Sequence#
SELECT (MAX(RRN(a))-COUNT(*)) AS DELETED_RCDS FROM TSTLIB.TSTFILE a;
-- Look at the recent 10 records
-- Look at the Column Names, Type and Size
SELECT * FROM TSTLIB.TSTFILE a WHERE RRN(a) > (SELECT MAX(RRN(a))-11 FROM TSTLIB.TSTFILE a);
-- Look for any NULL column (it may require NULL handling)
SELECT COUNT(*) FROM TSTLIB.TSTFILE WHERE COL1 IS NULL OR COL2 IS NULL;
-- Look for duplicate key records, if present order them by the frequence of their duplicacy. Say COL1 is the key-field 
SELECT COL1, COUNT(*) AS Freq FROM TSTLIB.TSTFILE GROUP BY COL1 HAVING COUNT(*)  > 1 ORDER BY Freq DESC;
-- Look for the earliest dated record
SELECT MIN(COL_DATE) FROM TSTLIB.TSTFILE;
-- Look for the latest date record
SELECT MAX(COL_DATE) FROM TSTLIB.TSTFILE;
