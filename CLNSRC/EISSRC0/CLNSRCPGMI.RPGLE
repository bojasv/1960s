       dcl-f ExtractI disk(112) usage(*input) extfile('CLNSRC/EISSRC')             
                                              extmbr('*ALL');                      
       dcl-f ExtractO usage(*output);                                              
                                                                                   
       dcl-c UrrghChar const(x'2021222324252628293031323334353638392a2b2c2d2e3a-   
                               3b3c3d3e');                                         
       dcl-c BlankChar const(x'404040404040404040404040404040404040404040404040-   
                               40404040');                                         
                                                                                   
ZZ999IExtractI  NS                                                                 
     I                                  1    6 2srcseq0                            
     I                                  7   12 0srcdat0                            
     I                                 13  112  srcdta0                            
                                                                                   
        read ExtractI;                                                             
        dow not %eof(ExtractI);                                                    
           srcseqO = srcseq0;                                                      
           srcdatO = srcdat0;                                                      
           srcdtaO = %xlate(UrrghChar:BlankChar:srcdta0);                          
                                                                                   
           write XtractO;                                     
           read ExtractI;                                     
        enddo;                                                
        *inLR = *on;                                          
