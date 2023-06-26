create table qtemp.qsqlsrc (srcseq num(6,2), srcdat num(6,0), srcdta char(100));
insert into qtemp.qsqlsrc (srcdta) values('    create  or   replace   procedure'),( '    create '), ('    or '), ('  replace '), ('     procedure ');
select * from qtemp.qsqlsrc;

-- dec is packed
-- num is zoned
-- declare a column as 'int' to use 'NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 230101, INCREMENT BY 1), '
