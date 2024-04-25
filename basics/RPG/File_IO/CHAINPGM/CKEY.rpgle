       dcl-f Testf1 Keyed;                               
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
                                                         
       //order = not defined (assumed to be 0, hence EOF)
       //order = 103; 103,105,106,107,EOF (skips records < 103)                    
                                                          
       order = 103;                                      
       chain order TestFr;
       if %found;   //chain doesn't set %equal      
         dou %eof;        
           dsply order;    
           read TestFr;   
         enddo;           
       endif;             
                           
       *inLR = *On;       
