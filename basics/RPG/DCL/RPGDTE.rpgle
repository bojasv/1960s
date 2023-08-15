      *  NOMAIN - this module does nDATFMT(*ISO) main (program-entry) procedure.
      *
      *  BNDDIR ('library-name/binding-directory-name')
      *
      *  ACTGRP(*NEW) - the program is activated into a new activation group.
      *  ACTGRP(*CALLER) - the program is activated into the caller program's activation group.
      *  activation-group-name - the name is used when this program is called.
      *
      *  DATFMT (*FMT)
      *
      *  DATEDIT (*FMT)
      *           *ISO (yyyy-mm-dd) - Default
      *           *MDY (mm/dd/yy)
      *           *DMY (dd/mm/yy)
      *           *YMD (yy/mm/dd)
      *           *USA (mm/dd/yyyy)
      *           *EUR (dd.mm.yyyy)
      *
      *  TIMFMT (*FMT)
      *          *ISO (hh.mm.ss) - Default
      *          *HMS (hh:mm:ss)
      *          *USA (hh:mm AM or hh:mm PM)
      *          *EUR (hh.mm.ss)
      *
      *  AUT (*LIBRCRTAUT | *ALL | *CHANGE | *USE | *EXCLUDE | 'authorization-list-name')
      *
      *  DEBUG (*Yes) - to perform DUMP operations in your RPG program.
      *
      *  OPTION(*DEBUGIO)
      *  OPTION(*EVENTF)
      *  OPTION(*EXPDDS)
      *  OPTION(*EXT)
      *  OPTION(*GEN)
      *  OPTION(*SECLVL)
      *  OPTION(*SHOWCPY)
      *  OPTION(*SHOWSKP)
      *  OPTION(*SRCSTMT)
      *  OPTION(*UNREF)
      *  OPTION(*XREF)
      *
      *
     D*BREAKFASTTIME   S              6S 0 INZ(083000)
     D*CANCELDATE      S              8S 0 INZ
     D CANCELDATEISO   S               D   INZ
     D*CHARACTERDATE   S              6A   INZ
OXB  D CANCELYEAR      S              4S 0 INZ
OXB  D CANCELMONTH     S              2S 0 INZ
OXB  D CANCELDAY       S              2S 0 INZ
OXB  D DATETODAY6      S              6S 0 INZ
OXB  D DATETODAY8      S              8S 0 INZ
OXB  D FROMDATEISO     S               D   INZ
OXB  D FROMMONTHISO    S              2S 0 INZ
OXB  D FROMDAYISO      S              2S 0 INZ
OXB  D FROMYEARISO     S              4S 0 INZ
OXB  D STARTDATEISO    S               D   INZ
OXB  D STARTDATE6      S              6S 0 INZ
OXB  D STARTYEAR       S              4S 0 INZ
OXB  D STARTMONTH      S              2S 0 INZ
OXB  D STARTDAY        S              2S 0 INZ
     D TODATEISO       S               D   DATFMT(*ISO)
     D DATEIN6S0       S              6S 0 INZ
     D DATEIN7P0       S              7P 0 INZ
     D DATEIN8S0       S              8S 0 INZ
     D DATEINCHAR6     S              6A   INZ
     D DATEINCHAR10    S             10A   INZ
     D DATEINDMY       S               D   DATFMT(*DMY)
     D DATEINEUR       S               D   DATFMT(*EUR)
     D DATEINISO       S               D   DATFMT(*ISO)
     D DATEINJIS       S               D   DATFMT(*JIS)
     D DATEINJUL       S               D   DATFMT(*JUL)
     D DATEINMDY       S               D   DATFMT(*MDY)
     D DATEINUSA       S               D   DATFMT(*USA)
     D DATEINYMD       S               D   DATFMT(*YMD)
     D DATED           S               D   DATFMT(*YMD)
     D DAY             S              2S 0 INZ
     D DAYINCHAR       S              2A   INZ
     D DIFFINDAYS      S              4S 0 INZ
     D*DIFFINHOURS     S              4S 0 INZ
     D*DIFFINMONTHS    S              4S 0 INZ
     D*DIFFINYEARS     S              4S 0 INZ
     D*DINNERTIME      S              6S 0 INZ(190000)
     D*ENDTIME         S              6S 0 INZ
     D ERRORMESSAGE    S             20A   INZ
     D*ERRORS          S               N   INZ(*OFF)
     D FROMDATEINISO   S               D   INZ
     D*FROMTIMESTAMP   S               Z   INZ
     D INVALIDDATE     S              8S 0 INZ(20091313)
     D INVALIDMESSAGE  S             20A   INZ('WRONG DATE OJAY!!!!!')
     D*LEN             S              2S 0 INZ
     D MONTH           S              2S 0 INZ
     D MONTHINCHAR     S              2A   INZ
     D*POS             S              2S 0 INZ
     D*STARTDATE       S              8S 0 INZ
     D*STARTDATEINISO  S               D   INZ
     D*STARTTIME       S              6S 0 INZ
     D TIMEINEUR       S               T   TIMFMT(*EUR)
     D TIMEINHMS       S               T   TIMFMT(*HMS)
     D TIMEINISO       S               T   TIMFMT(*ISO)
     D TIMEINJIS       S               T   TIMFMT(*JIS)
     D TIMEINUSA       S               T   TIMFMT(*USA)
     D*TIMESTAMP       S               Z   INZ
     D TODATEINISO     S               D   INZ
     D*TOTIMESTAMP     S               Z   INZ
     D YEAR            S              4S 0 INZ
     D*YEARINCHAR2     S              2A   INZ
     D YEARINCHAR4     S              4A   INZ
     D YEARMONTH       S              6S 0 INZ
     D YEARMONTHDAY    S              8S 0 INZ(20130221)
      *=================================================*
      *              CURRENT DATE & TIME  *
      *=================================================*
     C                   EVAL      DATEINISO = %DATE()                          1999-12-31
     C                   EVAL      DATEINMDY = %DATE()                          12/10/09  12/31/99
     C                   EVAL      DATEINDMY = %DATE()                          10/12/09
     C                   EVAL      DATEINYMD = %DATE()                          09/12/10
     C                   EVAL      DATEINJUL = %DATE()                          12/365
     C                   EVAL      DATEINUSA = %DATE()                          12/31/1999
     C                   EVAL      DATEINEUR = %DATE()                          31.12.1999
     C                   EVAL      DATEINJIS = %DATE()                          1999-12-31

     C                   EVAL      TIMEINHMS = %TIME()                          14:57:06
     C                   EVAL      TIMEINISO = %TIME()                          14.57.06
     C                   EVAL      TIMEINUSA = %TIME()                          02:57 PM
     C                   EVAL      TIMEINEUR = %TIME()                          14.57.06
     C                   EVAL      TIMEINJIS = %TIME()                          14:57:07

      /FREE
        DATEINISO  = %DATE();                                                   // 2013-02-21
        DATEINMDY  = %DATE();                                                   // 02/21/13
        DATEINDMY  = %DATE();                                                   // 21/02/13
        DATEINYMD  = %DATE();                                                   // 13/02/21
        DATEINJUL  = %DATE();                                                   // 13/052
        DATEINUSA  = %DATE();                                                   // 02/21/2013
        DATEINEUR  = %DATE();                                                   // 21.02.2013
        DATEINJIS  = %DATE();                                                   // 2013-02-21

        TIMEINHMS  = %TIME();                                                   // 09:56:16
        TIMEINISO  = %TIME();                                                   // 09.56.16
        TIMEINUSA  = %TIME();                                                   // 09:56 AM
        TIMEINEUR  = %TIME();                                                   // 09.56.16
        TIMEINJIS  = %TIME();                                                   // 09:56:17
      /END-FREE
      *=================================================*
      *                 CONVERSIONS    *
      *=================================================*
      *VALIDATE A DATE ENTERED IN BY THE USER TO SEE IF IT?S AN ACTUAL DATE
     C                   EVAL      TIMEINJIS = %TIME()                          14:57:07
     C                   EVAL      DATEIN8S0 = INVALIDDATE
     C                   MONITOR
     C                   EVAL      DATEINISO = %DATE(INVALIDDATE:*YMD)
     C                   ON-ERROR
     C                   EVAL      ERRORMESSAGE = INVALIDMESSAGE
     C                   ENDMON

      *RETRIEVE TODAY?S DATE IN A 7-POSITION PACKED FIELD AS CYYMMDD
     C                   EVAL      DATEIN7P0 = %DEC(%CHAR(%DATE:*CYMD0):7:0)
      *RETRIEVE TODAY?S DATE IN A 10-POSITION ALPHANUMERIC FIELD IN A USA FORMAT
     C                   EVAL      DATEINCHAR10 = %CHAR(DATEINUSA)
      *RETRIEVE TODAY?S DATE IN AN 8-POSITION NUMERIC FIELD IN A USA FORMAT
     C                   EVAL      DATEIN8S0 = %DEC(%CHAR(DATEINISO:*USA0):8:0)
     C*                  EVAL      DATEIN8S0 = %DEC(%CHAR(%DATE:*USA0):8:0)
      *RETRIEVE TODAY?S DATE IN A 6-POSITION ALPHANUMERIC FIELD IN A JULIAN FORMAT
     C                   EVAL      DATEINCHAR6 = %CHAR(DATEINJUL)
      *CONVERT DATE IN ISO TO A 6-POSITION NUMERIC FIELD
     C                   EVAL      DATEIN6S0 = %DEC(%CHAR(DATEINISO:*YMD0):6:0)
      *CONVERT DATE IN MDY TO AN 8-POSITION NUMERIC FIELD
     C                   EVAL      DATEIN8S0 = %DEC(%CHAR(DATEINISO:*ISO0):8:0)
      *CONVERT DATE IN MDY TO AN 8-POSITION NUMERIC FIELD
     C                   EVAL      DATEIN6S0 = %DEC(%CHAR(DATEINMDY:*MDY0):6:0)
      *RETRIEVE TODAY?S DATE IN A 10-POSITION CHARACTER FIELD IN ORDER TO SUBSTRING
     C                   EVAL      DATEINCHAR10 = %CHAR(%DATE())
     C                   EVAL      MONTHINCHAR  = %SUBST(DATEINCHAR10:6:2)
     C                   EVAL      DAYINCHAR    = %SUBST(DATEINCHAR10:9:2)
     C                   EVAL      YEARINCHAR4  = %SUBST(DATEINCHAR10:1:4)
      *RETRIEVE THE VALUE OF THE MONTH, DAY, AND YEAR FROM AN ISO DATE
     C                   EVAL      MONTH = %SUBDT(DATEINISO:*M)
     C                   EVAL      DAY   = %SUBDT(DATEINISO:*D)
     C                   EVAL      YEAR  = %SUBDT(DATEINISO:*Y)
      *SUBTRACT 77 MONTHS FROM AN *ISO DATE FIELD
     C                   EVAL      FROMDATEINISO = DATEINISO
     C                   EVAL      TODATEINISO   = FROMDATEINISO - %MONTHS(77)
      *GET THE NUMBER OF DAYS, MONTHS, AND YEARS WITHIN A SPECIFIC DATE RANGE
     C*                  EVAL      DIFFINDAYS = %DIFF(FROMDATEINISO:TODATEINISO:*DAYS)
     C*                  EVAL      DIFFINMONTHS = %DIFF(FROMDATEINISO:TODATEINISO:*MONTHS)
     C*                  EVAL      DIFFINYEARS = %DIFF(FROMDATEINISO:TODATEINISO:*YEARS)
      *CONVERT AN 8-POSITION *YMD DATE INTO A 6-POS *MDY DATE FIELD
     C                   MOVE      DATEIN8S0     DATEINISO
     C                   EVAL      DATEIN6S0 = %DEC(%CHAR(DATEINISO:*MDY0):6:0)
      *CONVERT A 6-POSITION *MDY DATE INTO AN 8-POSITION *YMD DATE FIELD
     C                   MOVE      DATEIN6S0     DATEINMDY
     C                   EVAL      DATEINISO = DATEINMDY
     C                   EVAL      DATEIN8S0 = %DEC(%CHAR(DATEINISO:*ISO0):8:0)
      *CONVERT THE FORMAT OF AN 8-POSITION DATE FROM YMD TO A 6-POSITION MDY
     C                   MOVE      DATEIN8S0     DATEINISO
     C                   EVAL      DATEINMDY = DATEINISO
     C                   EVAL      DATEIN6S0 = %DEC(%CHAR(DATEINMDY:*MDY0):6:0)
      /FREE


        DATED       = %Date(DATEIN6S0:*MDY);
        //DATEIN8S0 = %DEC(%CHAR(DATEIN6S0:*MDY0):8:0);


        //STARTDATEISO  = %DATE(DATEIN6S0:*YMD);
        //STARTDATEISO  = %DATE(DATEIN6S0:*ISO);
        STARTDATE6    = %DEC(%CHAR(STARTDATEISO:*MDY0):6:0);

        CANCELDATEISO = DATEINISO - %MONTHS(16);

        DATETODAY6    = %DEC(%CHAR(DATEINISO:*MDY0):6:0);
        DATETODAY8    = %DEC(%CHAR(DATEINISO:*MDY0):8:0);
        DATEINCHAR10  = %CHAR(%DATE());

        MONTHINCHAR   = %SUBST(DATEINCHAR10:6:2);
        DAYINCHAR     = %SUBST(DATEINCHAR10:9:2);

        FROMDATEISO   = DATEINMDY;
        FROMMONTHISO  = %SUBDT(DATEINISO:*M);
        FROMDAYISO    = %SUBDT(DATEINISO:*D);
        FROMYEARISO   = %SUBDT(DATEINISO:*Y);

        FROMDATEISO   = DATEINISO - %YEARS(1);
        TODATEISO     = DATEINISO;

        CANCELDATEISO = %DATE + %DAYS(30);
        CANCELYEAR    = %SUBDT(CANCELDATEISO:*Y);
        CANCELMONTH   = %SUBDT(CANCELDATEISO:*M);
        CANCELDAY     = %SUBDT(CANCELDATEISO:*D);

        STARTDATEISO  = %DATE();
        STARTYEAR     = %SUBDT(STARTDATEISO:*Y);
        STARTMONTH    = %SUBDT(STARTDATEISO:*M);
        STARTDAY      = %SUBDT(STARTDATEISO:*D);

        DIFFINDAYS    = %DIFF(TODATEISO:FROMDATEISO:*DAYS);
        DIFFINDAYS    = %DIFF(CANCELDATEISO:STARTDATEISO:*DAYS);

        YEARMONTH     = %UNS(%SUBST(%CHAR(YEARMONTHDAY):1:6));

      /END-FREE

     C                   EVAL      *INLR = *ON
