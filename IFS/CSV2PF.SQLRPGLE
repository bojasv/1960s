**free
dcl-s command char(200) inz;
dcl-s file1 char(50) inz('''/HOME/TSTUSER/EDItest (1).csv'' ');

exec sql set option commit = *none;
//exec sql call QSYS2.QCMDEXC('CHGJOB CCSID(37)');

exec sql drop table QTEMP/CSVUP;

exec sql
  create table QTEMP/CSVUP(
         ediFile char (10),
         ediMember char (8),
         regionName char (50),
         regionNum numeric (2),
         docenvLoc char (1));

command = 'CPYFRMIMPF FROMSTMF(' + %trim(File1) + ') TOFILE(QTEMP/CSVUP) ' +
          'RCDDLM(*CRLF) STRDLM(*NONE) RMVCOLNAM(*YES)';

exec sql
  call QSYS2.QCMDEXC(:command);

if sqlcode = 0;
  dsply 'CSVUP PF created';
endif;

*inlr = *on;
