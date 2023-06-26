drop table qtemp.qsqlsrc;
create table qtemp.qsqlsrc (srcseq num(6,2), srcdat num(6,0), srcdta char(100)) rcdfmt testfa;
insert into qtemp.qsqlsrc (srcdta) values('    create  or   replace   procedure'),( '    create '), ('    or '), ('  replace '), ('     procedure ');
select * from qtemp.qsqlsrc;

-- dec is packed
-- num is zoned
-- declare a column as 'int' to use 'NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 230101, INCREMENT BY 1), '
-- use RCDFMT keywords in order to avoid following errors
-- *RNF2121 30 a      000200  Record format TESTF in file TESTF already defined; record
--                            format is ignored.                                       
-- *RNF2109 40 b      000200  All Record Formats for externally-described file TESTF   
--                            ignored or dropped due to error; file ignored.           
