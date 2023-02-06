**free                                                              
ctl-opt option(*srcstmt:*nodebugio) dftactgrp(*no);                 
                                                                    
//----------------------------------------------------------------  
//  Program Name . . . . .  :   CLNPF                               
//  Description  . . . . .  :   Remove redundant records from file  
//                              QPPUOPRTF                           
//  Created on . . . . . .  :   2020.07.22                          
//  Created by . . . . . .  :   Bhardwaj, Ojasva                              
//  Running instructions .  :   Run following command before calling
//                              this program.                       
//                              CPYSPLF FILE(QPUOPRTF)              
//                              CPYTOFILE(USRLIB/QPPUOPRTF)         
//                              CPYJOB(999999/USRLIB/QPADEV999Z     
//                              SPLNBR(1)                           
//----------------------------------------------------------------  
                                                                    
//----------------------------------------------------------------  
//  Modifications                                                                                                                       
//----------------------------------------------------------------
//  Date      Developer   Tag      Description                    
// ---------- ----------  -------- -------------------------------
// 9999.12.31 DEVELOPERX  XX999999:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//                                 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//----------------------------------------------------------------
                                                                  
dcl-f QPPUOPRTF disk(*ext) usage(*input) keyed;                   
                                                                  
dcl-s sqlstmt char(500) inz(*blanks);                             
dcl-c apo const('''');                                            
dcl-c val1 const(' ');                                            
dcl-c val2 const(' Library . .');                                 
dcl-c val3 const('Creation ');                                    
dcl-c val4 const('Date     ');                                    
dcl-c val5 const('----------  ');                                 
                                                                  
exec sql                                                          
   set option                                                     
     naming = *sys,                                               
     commit = *none,                                               
     usrprf = *user,                                               
     dynusrprf = *user,                                            
     datfmt = *iso,                                                
     closqlcsr = *endmod;                                          
                                                                   
      sqlstmt = 'delete from QPPUOPRTF where CLR <> '+apo+val1+apo+
                ' or MBR = '+apo+val2+apo+                         
                ' or DTC = '+apo+val3+apo+                         
                ' or DTC = '+apo+val4+apo+                         
                ' or MBR = '+apo+val5+apo;                         
                                                                   
exec sql                                                           
   execute immediate :sqlstmt;                                     

*inlr = *on;
