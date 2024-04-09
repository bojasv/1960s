CL: CRTSRCPF FILE(QTEMP/QRPGLESRC) RCDLEN(112) TEXT('RPGLE Source Members') ;
CL: ADDPFM FILE(QTEMP/QRPGLESRC) MBR(ORDFIL) TEXT('File to test SETLL, SETGT, and CHAIN') SRCTYPE(PF);
INSERT INTO QTEMP.QRPGLESRC VALUES(000001, 000000, '                R TESTFR');
INSERT INTO QTEMP.QRPGLESRC VALUES(000002, 000000, '                  ORDER          3S 0       TEXT(''ORDER#'')');
INSERT INTO QTEMP.QRPGLESRC VALUES(000003, 000000, '                  ITEM          20          TEXT(''ITEM#'')');
INSERT INTO QTEMP.QRPGLESRC VALUES(000004, 000000, '                K ORDER');
CL: CRTPF FILE(TSTLIB/ORDFIL) SRCFILE(QTEMP/QRPGLESRC) SRCMBR(ORDFIL);
INSERT INTO TSTLIB.ORDFIL
  VALUES (100,'1st record of 100'),
  (100,'2nd record of 100'),
  (100,'3rd record of 100'),
  (101,'1st record of 101'),
  (101,'2nd record of 101'),
  (101,'3rd record of 101'),
-- (102,'1st record of 102'),
-- (102,'2nd record of 102'),
  (103,'1st record of 103'),
  (103,'2nd record of 103');
