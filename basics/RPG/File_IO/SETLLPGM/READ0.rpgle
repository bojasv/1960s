      <---------------------- Source Specifications ----------------------------><---- Comments ---->
      ....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8....+....9....+...10
      ...............................................................................................
      ... non-keyed file/arrival sequqence acspth ...................................................
      ...............................................................................................
      <--------------------------------------------------------------------------------------------->
      < BOF to EOF
      < Reads a file top to bottom (arrival sequence) - SETLL (1) and/or READ
      <--------------------------------------------------------------------------------------------->
        dcl-f qrpglesrc rename(qrpglesrc:qrpgsrc);
        //setll 1 qrpgsrc;        reads_asc (skip, as read will do the job)
        read qrpgsrc;               
        dow not %eof(qrpglesrc);    
          dsply %subst(srcdta:1:52);
          read qrpgsrc;             
        enddo;                      
        *inLR = *on;
      <--------------------------------------------------------------------------------------------->
      //using PF-SRC, hence gotta rename the RCDFMT
      //dcl-s true ind inz(*on);           
                                           
      //setll *start qrpgsrc;   err_compile
      //setll *loval qrpgsrc;   err_compile
      //setll *hival qrpgsrc;   eof        
      //setll srcseq qrpgsrc;   err_compile
      //setll srcdta qrpgsrc;   err_compile
      //setll ' ' qrpgsrc;      err_compile
      //setll 0 qrpgsrc;        eof, also for setgt-readp        
      //n should be a whole number.
      <--------------------------------------------------------------------------------------------->
      < n to EOF
      < Reads RRN(n-1) onwards - SETLL (n) and READ
      <--------------------------------------------------------------------------------------------->
        dcl-f qrpglesrc rename(qrpglesrc:qrpgsrc);
        setll n qrpgsrc;        //reads_asc
        read qrpgsrc;               
        dow not %eof(qrpglesrc);    
          dsply %subst(srcdta:1:52);
          read qrpgsrc;             
        enddo;                      
        *inLR = *on;
      <--------------------------------------------------------------------------------------------->
      < BOF to EOF
      < Reads a file top to bottom (arrival sequence) - SETGT (1), READP and READ
      <--------------------------------------------------------------------------------------------->
        dcl-f qrpglesrc rename(qrpglesrc:qrpgsrc);
        *inLR = *On; //useful when you abnormally ended file processing
        setgt 1 qrpgsrc; //if used *hival, readp will read last rec, loop invokes and read sets EOF                           
        readp qrpgsrc; //readp w/o setgt is EOF                            
        dow not %eof(qrpglesrc);                  
          dsply %subst(srcdta:1:52);              
          read qrpgsrc;                           
        enddo;                                    
        *inLR = *On;
      //for *hival, only the last record is read
      <--------------------------------------------------------------------------------------------->
      < EOF to BOF
      < Reads a file bottom to top - SETGT (*HIVAL) and READP
      <--------------------------------------------------------------------------------------------->
        dcl-f qrpglesrc rename(qrpglesrc:qrpgsrc);
        setgt *hival qrpgsrc;                          
        readp qrpgsrc; //readp w/o setgt is EOF                            
        dow not %eof(qrpglesrc);                  
          dsply %subst(srcdta:1:52);              
          readp qrpgsrc;                           
        enddo;                                    
        *inLR = *On;    
      <--------------------------------------------------------------------------------------------->
      < n to n i.e. nth record
      < Reads top record only - SETGT (1) and READP
      <--------------------------------------------------------------------------------------------->
      dcl-f qrpglesrc rename(qrpglesrc:qrpgsrc);
      setgt 1 qrpgsrc;                     
      readp qrpgsrc;                            
      dow not %eof(qrpglesrc);                  
        dsply %subst(srcdta:1:52);              
        readp qrpgsrc;                          
      enddo;                                    
      *inLR = *On;                              
      <--------------------------------------------------------------------------------------------->
      < n to BOF
      < Reads top n record in bottom to top sequence - SETGT (n) and READP
      <--------------------------------------------------------------------------------------------->
      dcl-f qrpglesrc rename(qrpglesrc:qrpgsrc);
      setgt n qrpgsrc;                          
      readp qrpgsrc;                            
      dow not %eof(qrpglesrc);                  
        dsply %subst(srcdta:1:52);              
        readp qrpgsrc;                          
      enddo;                                    
      *inLR = *On;                              
      <--------------------------------------------------------------------------------------------->
      < n to EOF
      < Reads all records RRN(n-1) onwards - SETGT (n) and READ
      <--------------------------------------------------------------------------------------------->
      dcl-f qrpglesrc rename(qrpglesrc:qrpgsrc);
      setgt 3 qrpgsrc;                          
      read qrpgsrc;                             
      dow not %eof(qrpglesrc);                  
        dsply %subst(srcdta:1:52);              
        read qrpgsrc;                           
      enddo;                                    
      *inLR = *On;                              
      <--------------------------------------------------------------------------------------------->
      < n-1 to BOF
      < Reads top n-1 record in bottom to top sequence - SETLL (n) and READP
      <--------------------------------------------------------------------------------------------->
      dcl-f qrpglesrc rename(qrpglesrc:qrpgsrc);
      setll n qrpgsrc;                          
      readp qrpgsrc;                            
      dow not %eof(qrpglesrc);                  
        dsply %subst(srcdta:1:52);              
        readp qrpgsrc;                          
      enddo;                                    
      *inLR = *On;                              
      <--------------------------------------------------------------------------------------------->
      < n to BOF
      < Reads top n record in bottom to top sequence - SETLL (n), READ and READP
      <--------------------------------------------------------------------------------------------->
      dcl-f qrpglesrc rename(qrpglesrc:qrpgsrc);
      setll n qrpgsrc;                         
      read qrpgsrc;                             
      dow not %eof(qrpglesrc);                  
        dsply %subst(srcdta:1:52);              
        readp qrpgsrc;                          
      enddo;                                    
      *inLR = *On;                              
      <--------------------------------------------------------------------------------------------->
      < using FOR loop
      <--------------------------------------------------------------------------------------------->
      < BOF to EOF 
      < Reads top n record in bottom to top sequence - SETLL (n), READ and READP
      <--------------------------------------------------------------------------------------------->
      dcl-f qrpglesrc rename(qrpglesrc:qrpgsrc);
      dcl-s i uns(3);                           
      setll 1 qrpgsrc;                          
      read qrpgsrc;                             
      for i=1 to *hival;                        
        dsply %subst(srcdta:1:52);              
        read qrpgsrc;                           
        if %eof(qrpglesrc); //read(e) or %error keeps loop infinite                              
          leave;                                
        endif;                                  
      endfor;                                   
      *inLR = *On;                              
      <--------------------------------------------------------------------------------------------->
      < BOF to n 
      < Reads top n record in top to bottom sequence - SETLL (1), READ and READP
      <--------------------------------------------------------------------------------------------->
      dcl-f qrpglesrc rename(qrpglesrc:qrpgsrc);
      dcl-s i uns(3);                           
      setll 1 qrpgsrc;                          
      read qrpgsrc;                             
      for i=1 to n;                        
        dsply %subst(srcdta:1:52);              
        read qrpgsrc;                           
        if %eof(qrpglesrc); //read(e) or %error keeps loop infinite                              
          leave;                                
        endif;                                  
      endfor;                                   
      *inLR = *On;                              
      ...............................................................................................
      ... keyed file/keyed acspth ...................................................................
      ...............................................................................................
      
      <--------------------------------------------------------------------------------------------->
      <--------------------------------------------------------------------------------------------->
