 ...+... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+...
*************** Beginning of data ********************************************
      /*-Date---- Prgrmr---Description--------------------------------------*/
      /*--------------------------------------------------------------------*/
      /* 01/01/20 BOJASV   Setup the new library with reqd. source physical */
      /*                   files for a new Rally® task                      */
      /*--------------------------------------------------------------------*/
             PGM        PARM(&LIB &DSC &MBR1 &MBR2 &MBR3 &DSP)                
                                                                              
             DCL        VAR(&LIB  )   TYPE(*CHAR) LEN(10)                     
             DCL        VAR(&MBR1 )   TYPE(*CHAR) LEN(10)                     
             DCL        VAR(&MBR2 )   TYPE(*CHAR) LEN(10)                     
             DCL        VAR(&MBR3 )   TYPE(*CHAR) LEN(10)                     
             DCL        VAR(&DSC  )   TYPE(*CHAR) LEN(50)                     
             DCL        VAR(&DSP  )   TYPE(*CHAR) LEN(1)                      
             DCL        VAR(&ERR  )   TYPE(*CHAR) LEN(40)                     
             DCL        VAR(&EXIST)   TYPE(*DEC) LEN(1)                       
                                                                              
             CRTLIB     LIB(&LIB) TYPE(*PROD) TEXT(&DSC)                      
             MONMSG     MSGID(CPF2111) EXEC(CHGVAR VAR(&EXIST) +              
                          VALUE(1))                                           
             IF         COND(&EXIST *NE 1) THEN(DO)                                    
             CRTSRCPF   FILE(&LIB/APPSRC) RCDLEN(112) TEXT(&DSC)                       
             MONMSG     MSGID(CPF0000 CPF9999)                                         
             CPYSRCF    FROMFILE(FALDEVPF/APPSRC) +                                    
                          TOFILE(&LIB/APPSRC) FROMMBR(&MBR1) +                         
                          MBROPT(*ADD)                                                 
             MONMSG     MSGID(CPF0000 CPF9999)                                         
             CPYSRCF    FROMFILE(FALDEVPF/APPSRC) +                                    
                          TOFILE(&LIB/APPSRC) FROMMBR(&MBR2) +                         
                          MBROPT(*ADD)                                                 
             MONMSG     MSGID(CPF0000 CPF9999)                                         
             CPYSRCF    FROMFILE(FALDEVPF/APPSRC) +                                    
                          TOFILE(&LIB/APPSRC) FROMMBR(&MBR3) +                         
                          MBROPT(*ADD)                                                 
             MONMSG     MSGID(CPF0000 CPF9999)                                         
             CHGVAR     VAR(&ERR) VALUE('Library ' *CAT &LIB *TCAT ' is ready to use.')
             SNDPGMMSG  MSG(&ERR)                                                      
                                                                                       
             IF         COND(&DSP *EQ 'Y') THEN(DO)                                    
             CRTSRCPF   FILE(&LIB/APPSRCDSP) RCDLEN(112) TEXT(&DSC)                    
             MONMSG     MSGID(CPF0000 CPF9999)                                       
             ENDDO                                                                   
             ENDDO                                                                   
             ELSE       CMD(DO)                                                      
             IF         COND(&DSP *EQ 'Y') THEN(DO)                                  
             CRTSRCPF   FILE(&LIB/APPSRCDSP) RCDLEN(112) TEXT(&DSC)                  
             MONMSG     MSGID(CPF0000 CPF9999)                                       
             ENDDO                                                                   
             CHGVAR     VAR(&ERR) VALUE('Library ' *CAT &LIB *TCAT ' already exist.')
             SNDPGMMSG  MSG(&ERR)                                                    
             ENDDO                                                                   
                                                                                     
             ENDPGM                                                                  
