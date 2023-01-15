//How to Compile
Step1: Use PDM option 15 to create *MODULE object

//&L - Source Library
//XSRV02SV XSRV03SV XSRV01SV - Sub-procedure definitions (compiled as different NoMain *MODULEs)
//XSRV02BN - binder source
//QMODSRC - PF-SRC where the procedure prototypes, module source and binder source exists
Step2: 
CRTSRVPGM SRVPGM(&L/XSRV01SV) MODULE(&L/XSRV02SV XSRV03SV XSRV01SV) 
EXPORT(*SRCFILE) SRCFILE(&L/QMODSRC) SRCMBR(XSRV02BN) OPTION(*DUPVAR *DUPPROC)
