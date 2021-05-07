 ...+... 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7
*************** Beginning of data ************************************
             CMD        PROMPT('Batch FNDSTRPDM')                     
             PARM       KWD(PFSRC0) TYPE(*CHAR) LEN(10) DFT(PFSRC1) + 
                          PROMPT('File')                              
             PARM       KWD(PFSRC1) TYPE(*CHAR) LEN(10) DFT(PFSRC2) +
                          PROMPT('File')                              
             PARM       KWD(PFSRC2) TYPE(*CHAR) LEN(10) RSTD(*NO) +   
                          DFT(PFSRC3) PROMPT('File')                  
             PARM       KWD(PFSRC3) TYPE(*CHAR) LEN(10) DFT(PFSRC4) +
                          PROMPT('File')                              
             PARM       KWD(LIB) TYPE(*CHAR) LEN(10) DFT(LIB5) +  
                          PROMPT('   Library')                        
             PARM       KWD(MBR) TYPE(*CHAR) LEN(40) MIN(1) +         
                          PROMPT('String')                            
             PARM       KWD(DTL) TYPE(*CHAR) LEN(1) DFT(N) +          
                          PROMPT('Print Details? Y/N')                
