**free

ctl-opt option(*NoDebugIO: *SrcStmt: *NoUnRef) expropts(*ResDecPos) debug ;
ctl-opt NoMain ;
ctl-opt BndDir('XBNDDIR') ;

/copy qmodsrc,xsrv01pr

// fetch sub-string from a longer string
dcl-proc XSRV01_Proc01 export ;
   dcl-pi *n ;
      ip_str       char(5000) ;
      ip_rrn       packed(6:0) ;
      op_str       char(50) ;
   end-pi ;

   if ip_str = *Blanks ;
      return ;
   endif ;

   ExSr TestSr ;

   return ;
   // example of using a SR in a Sub-proc
   // Use this for repetitive task in the sub-proc
   BegSR TestSR ;
     op_str = %subst(ip_str:1:50) ;
   EndSR ;

end-proc XSRV01_Proc01 ;
