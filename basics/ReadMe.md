# System Extremas
`System`
- Max distinct PF that can be in use at one time (ODP) = ~500k
- 12 milli-seonds - max precision for timestamp, 6 ms is default (YYYYMMDDHHMMSSzzzzzzzzzzzz) - Char(26) or YYYY-MM-DD.HH:MM:SS.zzzzzzzzzzzz Char(32)
- Timestamp - *SYS initializes 3 ms;
- DB2: DFT user and server name fields are VarChar(18)
- Quiesce time: The amount of time required to render a computer system inactive, or the amount of time between periods of inactivity.
- Job Priority: 1 is the highest, while 99 is lowest


`PF`
- The maximum members in a physical file = 32,767 (CRTPF/MAXMBRS) - 32767
- The number of maximum RCDFMTs in a PF = 1 
- The maximum records in a PF = 4,294,967,288 (DSPRCDLCK/RCDNBR) - 4294967288 or slightly over 4 billions
- Max bytes/record = 32,766 (-> RCDLEN 32766)
- Max fields / RCDFMT = 8000 (incl LFs)
- Max file member size = 1.7TB
- Data portion (SRCDTA) for IBM-supplied DB PF-SRC is 80 bytes for e.g. QGPL/QCSRC
- Assuming RCDLEN of 112 bytes, blank members occupy 8192 bytes (data spcae size) - 8192, second most occured size is 16384
- A maximum of 300 triggers can be added to one PF, and max of 200 recursive insert and update trigger calls
- A maximum of 32767 constraints per PF
- Max key fields in a file = 120 fields (not exceeding 32768 chars)
- Max bytes in an access path = 16TB
- ACCPTHSIZ(*MAX1TB) supports max 32763 chars for key-field(s), ACCPTHSIZ(*MAX4GB) supports max 1995 chars for key-field(s) i.e. around 100 key-fields of char(20) each
- Size of Key for ORDER BY (SQL) = 10,000 bytes or 10kB or Char(10000), KEYFLD (OPNQRYF) = 10kB
- Size of Char - Char(32766) or VarChar(32740) or DBCS(32740) or DBCS-graphic(16383) or DBCS-graphic VarChar(16370)
- Size of Numeric (ZOned/Packed) = 63 digits
- (from 0.000000000000000000000000000000000000000000000000000000000001 to 99999999999999999999999999999999999999999999999999999999999999)


`LF`
- Minimum logical page size = 32K (earlier it used to be 8K, then 16K) -> 32k page supports index size upto 16TB = max access path size
- Minimum logical page size = 8K -> supports index size upto 4TB
- EVI (Encoded Vector Index) has maximum of 2TB access path size
- Max keyed-LF per PF-member = 3686 LFs
- Max PF-members per LF member = 32 PF-members
- Max mebers that can be joined = 256 members
- Max of 3 triggers using 1 LF or 1 INSTEAD OF trigger per I/U/D op

`OPNQRYF`
- %MAX supports max Char(256)

`DDL`
- The maximum records in a SQL table can be as much as BIGINT UNSIGNED i.e 18446744073709551615 records or 18 quintillions/20 Bytes, if BIGINT then half of it, i.e. 9223372036854775807 or 9 quintillions/20 Bytes.

`VARCHAR` : In IBM DB2, two extra bytes are used to store the length of a VARCHAR column because this length can be represented in two bytes.
Each byte can store 256 possible values (0 to 255), so two bytes can store up to 65536 possible values (0 to 65535). This means that the length of a VARCHAR column in DB2 can be up to 65535 characters.

`Access Path`
- The are created/updated as the file is opened, often maintained during the file I/O and 
- The access paths that are associated with a PF that has a keyed sequence access path.
- The access paths that are created for referential or unique constraints.                                                  
- Access paths that are created for LFs
- Access paths that are created for queries that refer to the data in a PF.
- Access path maintenance (MAINT) is only for keyed PF.

\*IMMED - for UNIQUE key-fields; ACCPTH is updated on each C/U/D

\*REBLD - built during member open, maintained until member is closed and finally deletes when closed

\*DLY - use when the number of changes between successive opens are small.
i.e. the file is opened frequently
or, when the key fields in records change infrequently.
Note: If the number of changes between a close and the next open reaches 
approximately 10% of the access path size, (i.e. 430MB to 170GB)
the system stops saving changes and the access path is completely rebuilt the next time the file is opened.

I inserted few records in a PF-member, but the key-field values remain unchanged. Will the ACCPTH be updated? No
I've a file with UNIQUE keyword, I inserted few records. Will the ACCPTH be updated? Yes
Can access path be updated on a Read? No.
Doesd ACCPTH works on member level or file level? Each file member has it's own access path.
Can access path is rebuilt for the whole file when we access even 1 member or is it updated ?

MAX1TB - Max auxiliary space occupied by access path of a PF = 17,000,000,000,000 bytes i.e. 17000000000000 or 1.7TB
MAX4GB - Max auxiliary space occupied by access path of a PF = 4,294,967,296 bytes i.e. 4294967296 or 4.3GB

for \*IMMED and \*DLY, ACCPTH can be rebuilt before IPL, right-after the IPL or when the file is first opened.

I've a keyed PF, and I'm writing records in it.
While the access path is being rebuilt, the file cannot be used by any job.

For a non-keyed file, arrival sequence ACCPTH is used. Will it change on insertion of each new record?

For an ACCPTH, what acts as a key in case of a non-keyed file? RRN?

UNIQUE, LIFO, FIFO, or FCFO - attributes of the access path (and key fields)
DESCEND, ABSVAL, UNSIGNED, and SIGNED - attributes of the key fields

What is the relationship between ACCPTH and Index?

ACCPTH is updated on each C/U/D during \*IMMED.
Can we say it is getting re-built (from RRN 1) on each manipulation or is it more like ACCPTH is appending the changes to what it've already stored?
Let's say a PF already contains 100 records (assume RRN = 100), and user added 12 new records. 
Will the ACCPTH be appending the 12 new key-values or it'll start recording all over from RRN 1? 

When two or more LFs are based on the same PFs with the same KFLDs in the same order, 
they automatically share the same keyed sequence access path.

`logical page size`
It is the amount of bytes of the [access path]() that can be moved into the [job's storage pool]() from the auxiliary storage for a [page fault]().
It specifies the [access path logical page size]() that is used when the access path is created.
The access path logical page size is used by the system to determine the size of each page of the [index]().

`*LIBL Size` 
There could be maximum 250 libraries that be specified as user/app library, rest first 15 library positions are reserved for system libraries like QSYS, QSYS2, QUSRSYS, and QHLPSYS.  
QGPL and QTEMP, both are user libraries

`CLLE`
- max level of nesting (logical expressions) = 5
- max level of nesting (list of values) = 3
- *Char(9999)
- *DEC(15) or *DEC(15,9)
- A folder/doc names should be between 1 and 12
- Folder Path can have max Char(63)
- max len of the path name char string on a CL command is Char(5000)
- Max Nesting for DO groups = 25
- *UINT - 4 bytes - 4294967295
- max PARMs per CL = 255
- MAXLEN for DTAQ entries = 64512 (min 128)
- CL CMD can have max 99 PARM statements
- CMD: CPP and VPP - Command Processing Program and Validity Checking Program
- CMD: max ELEM statements = 300
- CMD: max QUAL statements = 300

`HTTP Server for i`
- Max length for target buffer that receives the API response can be max 61,000 bytes or Char(61000)
- Max local cacche memory (often used for file caching) is 90GB i.e. files beyong 90GB data can't be set for caching
- FRCA (Fast Response Cache Accelerator), SLIC (System Licenced Internal Code) NFC (Network File Cache)
- After ~45h, FRCA can't send the data buffer to HTTP server???
- CacheMaxExpires can serve the data for a period of only 86400 seconds (1 day)
- if nesting is considered for the sub-directories, sub-dir names should not be over Char(20)
- CacheMinFileSize 0 to 2147483647
- AcceptThread 1 to 20 - accept threads per server child process
- HTTPRoutingData - max Char(80), default HTTPWWW; also for RoutinData HTTPSVR
- LimitXMLRequestBody - 715827881 bytes
- DAV (Distributed Authoring and Versioning) - DavMinTimeout - max 166min and 9999 secons
- LDAP (Lightweight Directory Access Protocol)
- ProxyMaxForwards - 2147483648 hops (avg 8 hops)
- ProxyTimeout - 2147483648 minutes
- BrotliCompressionMaxInputBlock between 16 and 24 (avg 22)
- H2MaxSessionStreams - avg 20
- H2TLSWarmUpSize - avg ~1300 bytes, max 16kB 
