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
