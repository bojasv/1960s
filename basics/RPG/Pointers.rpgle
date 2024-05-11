       *..1....+....2....+....3....+....4....+....5....+....6....+....7...+....
      D*Name++++++++++ETDsFrom+++To/L+++IDc.Keywords+++++++++++++++++++++++++
       *
      D Ptr1            S               *
      D Fld1            S              1A
      D BasedFld        S              7A   BASED(Ptr1)
      
       /FREE
          // 7 bytes of storage are allocated from the heap and
          // Ptr1 is set to point to it
          Ptr1 = %alloc (7);
       
          // The DEALLOC frees the storage.  This storage is now available
          // for allocation by this program or any other program in the
          // activation group.  (Note that the next allocation may or
          // may not get the same storage back).
          dealloc Ptr1;
       
          // Ptr1 still points at the deallocated storage, but this pointer
          // should not be used with its current value.  Any attempt to
          // access BasedFld which is based on Ptr1 is invalid.
          Ptr1 = %addr (Fld1);
       
          // The DEALLOC is not valid because the pointer is set to the
          // address of program storage.  %ERROR is set to return '1',
          // the program status is set to 00426 (%STATUS returns 00426),
          // and the pointer is not changed.
          dealloc(e) Ptr1;
       
          // Allocate and deallocate storage again.  Since operational
          // extender N is specified, Ptr1 has the value *NULL after the
          // DEALLOC.
          Ptr1 = %alloc (7);
          dealloc(n) Ptr1;
       /END-FREE

       //ptrs allocate memory from heap
       //commented values are noted during three consecutive runs
       Dcl-S Ptr1         Pointer;  //PTR1 = SPP:*NULL
       Dcl-S Fld1         Char(1);
       Dcl-S BasedFld     Char(7)    BASED(PTR1);
         Ptr1 = %alloc (7);   //PTR1 = SPP:CFFEF8BD12002000, //PTR1 = SPP:CFFEF8BD12002040, PTR1 = SPP:CFFEF8BD12002080
         dealloc Ptr1;        //PTR1 = SPP:CFFEF8BD12002000, //PTR1 = SPP:CFFEF8BD12002040, PTR1 = SPP:CFFEF8BD12002080
         Ptr1 = %addr (Fld1); //PTR1 = SPP:E181809D3800D728
                              //PTR1 = SPP:E181809D3800D728
                              //PTR1 = SPP:E181809D3800D728
         dealloc(e) Ptr1;     //PTR1 = SPP:E181809D3800D728
         Ptr1 = %alloc (7);   //PTR1 = SPP:CFFEF8BD12002020
                              //PTR1 = SPP:CFFEF8BD12002060
                              //PTR1 = SPP:CFFEF8BD120020A0
         dealloc(n) Ptr1;     //PTR1 = SPP:*NULL
       //notice how the %addtr of the field, Fld1 remains constant
       //while %alloc always getting incremented by 40 bytes

       //https://www.ibm.com/docs/sk/i/7.4?topic=formats-basing-pointer-data-type
