      <---------------------- Source Specifications ----------------------------><---- Comments ---->
      ....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8....+....9....+...10
      ...............................................................................................
      ... non-keyed file/arrival sequqence acspth ...................................................
      ...............................................................................................
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
