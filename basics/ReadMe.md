# System Extremas

`PF`
- The maximum members in a physical file = 32,767 (CRTPF/MAXMBRS) - 32767
- The number of maximum RCDFMTs in a PF = 1 
- The maximum records in a PF = 4,294,967,288 (DSPRCDLCK/RCDNBR) - 4294967288
- Assuming RCDLEN of 112 bytes, blank members occupy 8192 bytes (data spcae size) - 8192, second most occured size is 16384


`LF`
- Minimum logical page size = 32K (earlier it used to be 8K, then 16K)
- Minimum logical page size = 512K

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
