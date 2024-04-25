      dcl-f TestNK;            //Non-keyed file             
                                                            
      dcl-s isFound ind inz;                                
      dcl-s isEOF ind inz;                                  
                                                            
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
                                                            
      //key   = 1;  106,103,101,102,100,105,107             
      //key   = *loval - compilation error                  
      //key   = *hival - no result; no indicator gets set-on
      //key   = *start - compilation error                  
      //key   = *end   - compilation error                                    
      //key   = *on    - compilation error                                    
      //key   = *off   - compilation error                                    
      //key   = *hival - on removing if %found - 0,106,103,101,102,100,105,107
                                                                              
      //chain 1 TestFr;                                                       
      chain *hival TestFr;                                                    
      isFound = %found;                                                       
      isEOF   = %eof;                                                         
      dsply isFound;                                                          
      dsply isEOF;                                                            
      //if %found;                                                            
        dou %eof;                                                             
          dsply order;                                                        
          read TestFr;                                                        
        enddo;                                                                
      //endif;                                                                
                                                                              
      *inLR = *On;                                                            
