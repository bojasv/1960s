**free

Dcl-S source_data Char(132) Inz;
Dcl-S source_ok  Ind Inz(*On);
Dcl-S count      Zoned(6) Inz;
Dcl-S wkRRN      Zoned(6) Inz(*HIVAL);

Exec Sql
  SET OPTION commit = *none;

Exec Sql
  call qcmdexc('CLRPFM QTEMP/TESTF');

Exec Sql
DECLARE c1 CURSOR for
  WITH my_spooled_files (
        job,
        FILE,
        file_number,
        user_data,
        create_timestamp)
        AS (SELECT job_name,
                   spooled_file_name,
                   file_number,
                   user_data,
                   create_timestamp
              FROM qsys2.output_queue_entries_basic
              WHERE user_name = USER
              ORDER BY create_timestamp DESC
              LIMIT 1)
     SELECT spooled_data
        FROM my_spooled_files,
             TABLE (
                systools.spooled_file_data(
                   job_name => job, spooled_file_name => FILE,
                   spooled_file_number => file_number)
             );
  Exec Sql OPEN c1;
  If SqlCode = -502;
    Exec Sql CLOSE c1;
    Exec Sql OPEN c1;
  EndIf;
  Exec Sql FETCH c1 INTO :source_data;
    Dow SqlCode = 0 Or SqlCode = 551 Or SqlCode = 462;
      reset source_ok;
      If %Scan(' 5770WDS ':source_data) = 1 Or
         %Scan('Line   <':source_data) = 1 Or
         %Scan('Number .':source_data) = 1 Or
         %Scan('        Page      ':source_data) = 112 ;
        source_ok = *Off;
      ElseIf %Scan('      Global Field References: ':source_data) = 1 ;
         wkRRN = Count+2;
      EndIf;
      If source_ok and Count >= wkRRN;
        Exec Sql
          INSERT INTO Qtemp.testf (testfr) values(:source_data);
      EndIf;
      Exec Sql FETCH c1 INTO :source_data;
      Count += 1;
    EndDo;
  Exec Sql CLOSE c1;

 *inLR = *oN;
