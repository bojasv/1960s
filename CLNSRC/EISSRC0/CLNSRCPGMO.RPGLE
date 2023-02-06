**free                                                                        
dcl-f  ExtractO  disk(*ext) usage(*input) keyed;                              
dcl-f  ExtractI  usage(*update) keyed extfile(inFile) extdesc('CLNSRC/EISSRC')
                                      rename(EISSRC:INPUT) usropn;            
dcl-s inFile     char(21) inz('CLNSRC/EISSRC');                               
                                                                              
read XtractO;                                                                 
open ExtractI;                                                                
dow not %eof(ExtractO);                                                       
   read input;                                                                
    if srcdta <> srcdtaO;                                                     
       srcdta = srcdtaO;                                                      
       update input;                                                          
    endif;                                                                    
   read XtractO;                                                              
enddo;                                                                        
                                                                              
*inLR = *on;
