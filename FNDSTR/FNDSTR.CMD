 ...+... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7
*************** Beginning of data ************************************
             CMD        PROMPT('Batch FNDSTRPDM')                     
             PARM       KWD(PFSRC0) TYPE(*CHAR) LEN(10) DFT(EISSRC) + 
                          PROMPT('File')                              
             PARM       KWD(PFSRC1) TYPE(*CHAR) LEN(10) DFT(EISFUNC) +
                          PROMPT('File')                              
             PARM       KWD(PFSRC2) TYPE(*CHAR) LEN(10) RSTD(*NO) +   
                          DFT(EISMOD) PROMPT('File')                  
             PARM       KWD(PFSRC3) TYPE(*CHAR) LEN(10) DFT(EISPROC) +
                          PROMPT('File')                              
             PARM       KWD(LIB) TYPE(*CHAR) LEN(10) DFT(FALDEVPF) +  
                          PROMPT('   Library')                        
             PARM       KWD(MBR) TYPE(*CHAR) LEN(40) MIN(1) +         
                          PROMPT('String')                            
             PARM       KWD(DTL) TYPE(*CHAR) LEN(1) DFT(N) +          
                          PROMPT('Print Details? Y/N')                
