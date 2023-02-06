**free                                                            
ctl-opt option(*srcstmt:*nodebugio) dftactgrp(*no);               

// ...+... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+.
//*************** Beginning of data ********************************                                                                  
//----------------------------------------------------------------
//  Program Name . . . . .  :   #CLNSPLF                         
//  Description  . . . . .  :   Cleanup SPLF   
//  Created on . . . . . .  :   2020.04.16                        
//  Created by . . . . . .  :   BOJASV                            
//  Compile instructions .  :   DEFINE(WEB)                       
//----------------------------------------------------------------
                                                                  
//----------------------------------------------------------------
//  Modifications                                                 
//----------------------------------------------------------------
//  Date      Developer   Tag      Description                    
// ---------- ----------  -------- -------------------------------
// 2020.04.16 XXXXXX      XXX      Clean-up unnecessary records 
//                                 from SPLF
//----------------------------------------------------------------
                                                  
dcl-f fndstr    disk(*ext) usage(*update);        
                                                  
dcl-s $qcmd char(600) inz(*blanks);               
dcl-s sqlstmt char(600) inz(*blanks);             
dcl-s $str0    char(10) inz('5770WDS V%');        
dcl-s $str1    char(16) inz('From column .%');    
dcl-s $str2    char(16) inz('To column .%');      
dcl-s $str3    char(16) inz('Kind of match .%');  
dcl-s $str4    char(18) inz('Number to find  .%');
dcl-s $str5    char(16) inz('Print format  .%');  
dcl-s $str6    char(15) inz('Mark record .%');    
dcl-s $str7    char(18) inz('Record overflow .%');
dcl-s $str8    char(10) inz('Type  .%');          
dcl-s $str9    char(10) inz('Text  .%');          
dcl-s $str10   char(16) inz('Record length .%');  
dcl-s $str11   char(11) inz('%SEQNBR  *%');       
dcl-s $str12   char(16) inz('Number of recor%');  
dcl-s $str13   char(16) inz('Record length .%');  
dcl-s $str14   char(15) inz('%  E N D   O %');    
//dcl-s $str15   char(10) inz('_ _ _ _ _%');          
dcl-c apo const('''');                                
                                                      
sqlstmt = 'delete from FNDSTR/FNDSTR'+                
          ' where SRCDTAX like '+apo+%trim($str0)+apo+
          ' or SRCDTAX like '+apo+%trim($str1)+apo+   
          ' or SRCDTAX like '+apo+%trim($str2)+apo+   
          ' or SRCDTAX like '+apo+%trim($str3)+apo+   
          ' or SRCDTAX like '+apo+%trim($str4)+apo+   
          ' or SRCDTAX like '+apo+%trim($str5)+apo+   
          ' or SRCDTAX like '+apo+%trim($str6)+apo+   
          ' or SRCDTAX like '+apo+%trim($str7)+apo+   
          ' or SRCDTAX like '+apo+%trim($str8)+apo+   
          ' or SRCDTAX like '+apo+%trim($str9)+apo+   
          ' or SRCDTAX like '+apo+%trim($str10)+apo+  
          ' or SRCDTAX like '+apo+%trim($str11)+apo+  
          ' or SRCDTAX like '+apo+%trim($str12)+apo+  
          ' or SRCDTAX like '+apo+%trim($str13)+apo+  
          ' or SRCDTAX like '+apo+%trim($str14)+apo;  
                                    
exec sql                            
   set option                       
     naming = *sys,                 
     commit = *none,                
     usrprf = *user,                
     dynusrprf = *user,             
     datfmt = *iso,                 
     closqlcsr = *endmod;           
                                    
exec sql execute immediate :sqlstmt;
                                    
*inlr = *on;
