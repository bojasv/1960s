**free                            
// --------------------------------------------------------------------------//  
// CREATED BY.......: BOJASV                                                 //  
// CREATE DATE......: 2020/01/01                                             //  
// DEVELOPER........: BOJASV                                                 //  
// DESCRIPTION......:                                                        //  
// --------------------------------------------------------------------------//  
// Modification Log                                                          //  
// --------------------------------------------------------------------------//  
// Date     Mod_ID      Developer   Case and Description                     //  
// YY/MM/DD ----------  ----------  -----------------------------------------//  
//                                                                           //  
// --------------------------------------------------------------------------//  
ctl-opt Copyright('BOJASV © 2020 | OJASVA');        
ctl-opt option(*nodebugio:*srcstmt:*nounref);                                    
ctl-opt dftactgrp(*no);                             
                                                               
dcl-pi RSTDATR;                     
   in_Lib    char(10);            
   in_PFSRC  char(10);            
   in_Mbr    char(10);            
   in_Date   char(6);             
end-pi;                           
                                  
dcl-s lib        char(10) inz;    
dcl-s srcpf      char(4) inz;     
dcl-s member     char(10) inz;    
dcl-s yymmdd     zoned(6:0);      
dcl-s sqlstmt    varchar(100) inz;
                                  
lib    = %trim(in_Lib);           
srcpf  = %trim(in_PFSRC);         
member = %trim(in_Mbr);           
monitor;                          
   yymmdd = %dec(in_Date:6:0);               
on-error;                                    
endmon;                                      
                                             
exec sql set schema =:lib;                   
                                             
sqlstmt = 'create alias QTEMP/wk_mbr ' +     
          'for ' + srcpf + '(' + member + ')';
exec sql execute immediate :sqlstmt;         
                                             
exec sql                                     
   update QTEMP/WK_MBR set SRCDAT =:yymmdd;  

//backup using CPYF

exec sql drop alias QTEMP/WK_MBR;            
                                             
*inlr = *on;
