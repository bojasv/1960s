### Some special CCSIDs used on IBM i
- 1           CCSID for STMF during HTTP?
- 37          for EBCDIC
- 273         for LANGID=ENU and RegionID=US
- 437         or `*STDASCII` aka USACII (incl. .txt files with all five text encodings viz. UTF8, UTF8-BOM, UTF16-LE (Win default), UTF16-BE, and ANSI) 
- 819         for ISO88591 (default for STMF during HTTP?)
- 1200        for UTF16
- 1208        for UTF8 (default for .txt files)
- 1252        or `*PCASCII`
- 65535       for LANGID=ENU and RegionID=US; Default CCSID for flat files; SQL on MSVC hates this. CCSID(*HEX)
- `*JOBCCSID` default CCSID for PF-SRC

//The UCS-2 standard (or US2), an early version of Unicode, is limited to 65 535 characters. However, the data processing industry needs over 94 000 characters; the UCS-2 standard has been superseded by the Unicode UTF-16 standard.
//UTF-8 reduces file size while allowing for a much larger number of less-common characters.
//UTF-16 data can potentially take more storage than UTF-8 data, but because no conversion occurs when you use UTF-16 data, you avoid a significant performance impact.
//BOM = Byte Order Mark (initial 3 characters viz. x'EF', x'BB', and x'BF' in a UTF8 BOM file). BOM is used to signal at the start that the text stream is encoded in UTF-8.
The Unicode Standard permits the BOM in UTF-8, but does not require or recommend its use. 
//The 4-byte form of Unicode is referred to as UCS-4 or UTF-32, and is capable of defining the complete extensions of Unicode, with a maximum of over 1,000,000 unique characters definable.

### De-limiters (DLM) on IFS
1. #Record - *EOR (DFT), *CRLF, *CR, *LF, and *LFCR
2. #String - *DBLQUOTE (DFT), *NONE and user-defined
3. #Field - ',' (DFT) and user-defined

### Access a directory (aka link)
`wrklnk '/*'` - directly opens-up root directory  
`wrklnk /` - shows root directory  

### MKDIR
While creating a object, names are case-sensitive i.e. If an object 'Folder01' already exists, you can not create 'folder01'.  
`MKDIR '/home/"Folder01"'  `  
`MKDIR '/home/\Folder01'  `  
`MKDIR '/home/''''Folder01'''''  `  
Above all 3 configurations to add a folder, ends up in error `CPFA0A0 Object already exist.`.  
While accessing an object, names are case-insensitive i.e.  
`WRKLNK '/home/folder01'`  
and  
`WRKLNK '/home/Folder01'` will both lead you to same location.  
To access the folder contents, suffix the command with `*` or `?` pattern, as shown below...  
`WRKLNK '/home/Folder01/*'`  
or  
`WRKLNK '/home/Folder01/?'`

### SRTSEQ for IFS directory names
IFS usually follow HEX sorting sequence.  
Following characters are allowed and they appear in sequence as mentioned.  
( + & $ % _ # @ = a A 0 1 9  
Exceptions: Some patterns are not allowed in path name (CPFA089). For e.g. you can't start a name by `*` or `?`.

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

### Search a string on IFS using QShell  
grep -F -R -i "string to search" /directory  
-F -> search the flat string (as opposed to a RegEx)  
-R -> search all directories and sub-directories in the given directory  
-i -> make the search case-insensitive  
