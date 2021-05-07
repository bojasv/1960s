      /*-Date---- Prgrmr---Description--------------------------------------*/
      /*--------------------------------------------------------------------*/
      /* 01/01/20 BOJASV   Setup the new library with reqd. source physical */
      /*                   files for a new rally task                       */
      /*                   (initial IBMi setup for a rally task)            */
      /*--------------------------------------------------------------------*/
                                                                              
             CMD        PROMPT('Setup For New Rally® Task')                   
             PARM       KWD(LIB) TYPE(*CHAR) LEN(10) RTNVAL(*NO) +            
                          MIN(1) ALWUNPRT(*NO) ALWVAR(*NO) +                  
                          PROMPT('New Library')                               
             PARM       KWD(DSC) TYPE(*CHAR) LEN(50) DFT('BO/1/1 - +          
                          US12345 Description') MIN(0) EXPR(*YES) +           
                          CHOICE(DESCRIPTION) PROMPT('Description +           
                          of the Lib')                                        
             PARM       KWD(MBR1) TYPE(*CHAR) LEN(10) RTNVAL(*NO) +           
                          ALWUNPRT(*NO) ALWVAR(*NO) +                         
                          PROMPT('Program1 to Modify')                        
             PARM       KWD(MBR2) TYPE(*CHAR) LEN(10) RTNVAL(*NO) +           
                          ALWUNPRT(*NO) ALWVAR(*NO) +                         
                          PROMPT('Program2 to Modify')             
             PARM       KWD(MBR3) TYPE(*CHAR) LEN(10) RTNVAL(*NO) +
                          ALWUNPRT(*NO) ALWVAR(*NO) +              
                          PROMPT('Program3 to Modify')             
             PARM       KWD(DSP) TYPE(*CHAR) LEN(1) RSTD(*YES) +   
                          VALUES(Y N) MIN(1) CASE(*MIXED) +        
                          PROMPT('Have a DSPF?')                   
