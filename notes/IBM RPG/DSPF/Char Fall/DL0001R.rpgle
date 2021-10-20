**free
    //*-----------------------------------------------------------------------*/
    //*  Program Name . . . . .  :   DL0001R                                  */
    //*  Description  . . . . .  :   Process dropping of letters              */
    //*  Created on . . . . . .  :   2021-10-14                               */
    //*  Created by . . . . . .  :   Ojasva Bhardwaj                          */
    //*-----------------------------------------------------------------------*/

    //*-----------------------------------------------------------------------*/
    //*  Modifications:                                                       */
    //*-----------------------------------------------------------------------*/
    //* YYYY-MM-DD Developer   Case     Description                           */
    //* ---------- ----------  -------- --------------------------------------*/
    //* 2021-10-14 BOJASV      20211014 Process dropping of letters           */
    //*                                 using single array                    */
    //*-----------------------------------------------------------------------*/

ctl-opt option(*nodebugio: *srcstmt) debug;
ctl-opt dftactgrp(*no);

dcl-f DL0001D workstn infds(infds0);

dcl-s count         int(5) inz;
dcl-s w_D1SOURCE    like(D1SOURCE);
dcl-s indicator_ds pointer inz(%addr(*in));
dcl-ds *n based(indicator_ds);
   exit                ind pos(3);
   cancel              ind pos(12);
end-ds;
dcl-ds infds0;
   pressed_key         char(1) pos(369);
end-ds;

dcl-c ENTER      x'F1';
dcl-c FALSE       '0';
dcl-c TRUE        '1';

dow exit = FALSE or cancel = FALSE;
   exfmt DSPFMT;
   select;
   when exit = TRUE or cancel = TRUE;
      leave;
   when pressed_key = ENTER;
      if isScreenvalid(D1SOURCE);
          count += 1;
          processScreen(D1SOURCE:D1SINK:count);
      endif;
   endsl;
enddo;

*inlr = TRUE;

dcl-proc isScreenvalid;

   dcl-pi *n like(exit);
      source          like(D1SOURCE);
   end-pi;

   dcl-s valid     like(exit);

   if source = *blanks and count = 0;
      valid = FALSE;
      D1ERRMSG = 'Please fill data in source.';
   elseif source = *blanks and count > 0;
      initialize();
      valid = TRUE;
      D1ERRMSG = 'Please re-fill the data.';
   else;
      valid = TRUE;
      D1ERRMSG = *blanks;
   endif;

   return valid;

end-proc;

dcl-proc processScreen;

   dcl-pi *n;
      source          like(D1SOURCE);
      sink            like(D1SINK);
      k               like(count);
   end-pi;

   //better to use array and it's respective index within same DS
   dcl-ds ds_source inz;
      arr_source char(1) dim(%size(D1SOURCE));
      i          int(5);
   end-ds;
   //can't refer %len(D1SOURCE) or %size(D1SOURCE) in varchar - *RNF3320 error
   //can append strings using varchar (source0 += source;)
   dcl-s source0        varchar(30);
   dcl-s sink0          like(source0);

   ds_source = source;
   if k > 1;
      sink0 = %trim(sink);
   else;
      w_D1SOURCE = source; //global variable for the rescue :P
   endif;
   monitor;
      for i=k to k;
         if arr_source(i) <> *blank or k <= %len(%trim(w_D1SOURCE));
            if arr_source(i) = *blank;
               //hex value mimicing *blank (ASCII's Space, EBCDIC's digit select)
               arr_source(i) = x'20';
            endif;
            sink0 += arr_source(i);
            %subst(source:i:1) = *blank;
            source0 += source;
         else;
            initialize();
         endif;
      endfor;
      sink = sink0;
      source = %trimr(source0);
   on-error;
   endmon;

end-proc;

dcl-proc initialize;
   clear D1SOURCE;
   clear D1SINK;
   clear count;
   clear w_D1SOURCE;
end-proc;
