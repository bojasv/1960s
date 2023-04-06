-- Fetches most recent SPLF and parse it

-- DROP TABLE Qtemp.Testdds;
CREATE TABLE QTEMP.TESTDDS (MSGID CHAR(7), FLD_USE Char(5), REF_TYPE CHAR(10), FIELD CHAR(27), ATTRIBUTE CHAR(19), REFERENCED_AT_SEQ# CHAR(47));

DELETE FROM Qtemp.Testdds;

INSERT INTO QTEMP.TESTDDS (MSGID, FLD_USE, REF_TYPE, FIELD, ATTRIBUTE, REFERENCED_AT_SEQ#) (

SELECT SUBSTR(Testfr, 2, 7) AS MSGID,
       CASE WHEN SUBSTR(Testfr, 2, 7) = 'RNF7031' THEN 'UnRef'
            WHEN SUBSTR(Testfr, 2, 7) = ' ' THEN 'Ref'
            ELSE 'Xerr'
       END AS FLD_USE,
       CASE WHEN LOCATE('M ',SUBSTR(Testfr, 47, 47)) > 0 THEN 'Modified'
            WHEN LOCATE('D ',SUBSTR(Testfr, 47, 47)) > 0 THEN 'Defined'
            ELSE 'Referenced'
       END AS REF_TYPE,
       SUBSTR(Testfr, 10, 18) AS FIELD,
       SUBSTR(Testfr, 28, 19) AS ATTR,
       SUBSTR(Testfr, 47, 47) AS REF
  FROM Psrrpg.Testf
  WHERE SUBSTR(Testfr, 10, 1) NOT IN (' ', '*', '-')
  ORDER BY FLD_USE);

-- Check parsed data
SELECT * FROM Qtemp.Testdds;
-- Check usage of Count field (Note: field name has to be entered in upper case)
SELECT * FROM Qtemp.Testdds WHERE Field = 'COUNT';
-- Check all defined but un-used variables (filters SQL fields)
SELECT * FROM Qtemp.Testdds WHERE FLD_Use = 'UnRef' AND Field NOT LIKE 'SQ%';
-- Filter all Procedures (filters SQL procedures)
SELECT * FROM Qtemp.Testdds WHERE Attribute = 'PROTOTYPE' AND Field NOT LIKE 'SQL%';

-- SELECT SUBSTR(Testfr, 2, 7),
--        SUBSTR(Testfr, 10, 18),
--        SUBSTR(Testfr, 28, 19),
--        SUBSTR(Testfr, 47, 47)
--   FROM Psrrpg.Testf);
