##Some special CCSIDs used on IBM i
- 1252 or `*PCASCII`
- 437 or `*STDASCII`
- 1208 for .txt files
- 37
- 65535 for LANGID=ENU and RegionID=US; Default CCSID for flat files; SQL on MSVC hates this
- 273 for LANGID=ENU and RegionID=US
- `*JOBCCSID` - Default CCSID for PF-SRC

##De-limiters (DLM) on IFS
1. #Record - *EOR (DFT), *CRLF, *CR, *LF, and *LFCR
2. #String - *DBLQUOTE (DFT), *NONE and user-defined
3. #Field - ',' (DFT) and user-defined

```
drop table qtemp.ddsfile;
create table qtemp.ddsfile (dta0 char(10), dta1 num(10), dta2 dec(10));
insert into qtemp.ddsfile values('a123456789',1234567890,1234567890);
insert into qtemp.ddsfile values('a1234567',12345678,0012345678);
insert into qtemp.ddsfile values('    456789',0000567890,1234567800);
select * from qtemp.ddsfile;

CL: CPYTOIMPF FROMFILE(QTEMP/DDSFILE *FIRST) TOSTMF('/home/OJAY/ddsfile_RCDDLM.txt') MBROPT(*REPLACE) STMFCCSID(*PCASCII) RCDDLM(*CRLF);
-- CPF2845 (RC=11) and CPF2817 due to RCDDLM(*EOR)
CL: CPYTOIMPF FROMFILE(QTEMP/DDSFILE *FIRST) TOSTMF('/home/OJAY/ddsfile_FLDDLM.txt') MBROPT(*REPLACE) STMFCCSID(*PCASCII) RCDDLM(*CRLF) FLDDLM(x'6a');
-- x'6d' hex for '|' (pipe) sign
CL: CPYTOIMPF FROMFILE(QTEMP/DDSFILE *FIRST) TOSTMF('/home/OJAY/ddsfile_STRDLM.txt') MBROPT(*REPLACE) STMFCCSID(*PCASCII) RCDDLM(*CRLF) STRDLM(x'7d');                
-- x'7d' hex for ''' (single-quote) sign
```

![image](https://github.com/bojasv/1970/assets/59419054/9bb6c4c3-8512-44f7-9c0e-a1fd055a3562)
