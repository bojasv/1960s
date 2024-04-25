Summary:
SETLL, SETGT, CHAIN - when used on a keyed file, process records in a sequential manner. In ascending order when SETLL and CHAIN and descending when SETGT.

%Found - If the key is found, all the remaining record gets processed (incl. the key) 
%Equal - If the key is found, only key records are processed, else EOF.
CHAIN can only set %Found.
SETLL can set both %Found and %Equal. In case of %Equal it works as SETLL+READE.

CPYF re-orders records in ascending manner while copying record from a keyed file to a non-keyed file.

       // Line   ....+....1....+....2....+..             
       //        ORDER  ITEM                             
       // 000001  106   Item Dsc #106                    
       // 000002  103   Item Dsc #103                    
       // 000003  101   Item Dsc #101                    
       // 000004  102   Item Dsc #102                    
       // 000005  100   Item Dsc #100                    
       // 000006  105   Item Dsc #105                    
       // 000007  107   Item Dsc #107                    
       // ****** ********  End of report  ******** 

Keyed file: SETLL 104 - tries to set pointer on 104, but as the record doesn't exist it sets the pointer on the immediate higher value, i.e. 105.
Keyed file: SETLL 104 and %Equal- tries to set pointer on 104, but as the record doesn't exist and it is %Equal, so %EOF sets-on.
Keyed file: CHAIN 104 - tries to set pointer on 104, but as the record doesn't exist it sets the pointer on the immediate higher value, i.e. 105 and reads it.


File I/O Keywords, OpCodes and BIFs

KeyWords
PREFIX(prefix_name{:nbr_of_characters_replaced})
RENAME(ext_format:int_format)
USROPN
INFDS(data_structure_name)
INFSR(subroutine_name)
INCLUDE(record_format_name:record_format_name:...)
IGNORE(record_format_name:record_format_name:...)
COMMIT{(rpg_name)}
ROLBK {(E)} (Roll Back)
BLOCK(*NO | *YES)

OpCodes
KLIST (Define a Composite Key)
KFLD (Define Parts of a Key)
OPEN {(E)} (Open File for Processing)
CLOSE {(E)} (Close Files)
COMMIT {(E)} (Commit)

SETLL {(E)} (Set Lower Limit) 
SETGT {(E)} (Set Greater Than)
CHAIN {(N | E)} (Random Retrieval from a File)

READ {(N | E)} (Read a Record)        
READC {(E)} (Read Next Changed Record)
READE {(N | E)} (Read Equal Key)      
READP {(N | E)} (Read Prior Record)   
READPE {(N | E)} (Read Prior Equal)   

WRITE (Create New Records)
EXFMT {(E)} (Write/Then Read Format)
UPDATE (Modify Existing Record)
DELETE {(E)} (Delete Record)

BIFs
%OPEN (Return File Open Condition)
%EOF (Return End or Beginning of File Condition)
%FOUND (Return Found Condition)
%EQUAL (Return Exact Match Condition)
%ERROR (Return Error Condition)
%STATUS (Return File or Program Status)
%TLOOKUPxx (Look Up a Table Element)
%NULLIND (Query or Set Null Indicator)

