       //print non-repeating alphabet from input string of 50-char
       //input          : 'Alpha Bravo Charlie'                   
       //expected output: 'alphbrvocie'                           
                                                                  
       dcl-s string Char(50) Inz('Alpha Bravo Charlie');          
       dcl-s pos    Uns(10) Inz;                                  
       dcl-s strlen Uns(3) Inz;                                   
       dcl-s arr1   char(1) dim(*var:%len(string)) inz;           
       dcl-s i      Uns(10) Inz;                                  
                                                                  
       string = %scanrpl(' ':'':string);                          
       string = %lower(string);                                   
       strlen = %len(%trim(string));                              
       %elem(arr1) = strlen;                                      
                                                                  
       for i=1 to strlen;                                         
         arr1(i) = %subst(string:i:1);                            
         if i > 1;                                                
           pos = %lookup(arr1(i) : arr1 : 1 : (i-1));             
           if pos = *zero;               
             iter;                       
           endif;                        
           if pos < i;                   
             Clear arr1(i);              
           endif;                        
         endif;                          
       endfor;                           
                                         
       clear string;                     
       for i=1 to strlen;                
         if arr1(i) <> *blank;           
           %subst(string:i:1) = arr1(i); 
         endif;                          
       endfor;                           
                                         
       string = %scanrpl(' ':'':string); 
       dsply string;                     
                                         
       *inLR = *On;                      
