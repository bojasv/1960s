PASE for i includes three shells: Korn (ksh), Bourne (sh) and C (csh/tcsh) shell.

PASE for i supports the Db2 for i call level interfaces (CLIs). 
DB2 CLIs on AIX and IBM i are not exact subsets of each other, so there are minor differences in a few interfaces. 
Some APIs in one implementation might not exist in another.

IBM i is an EBCDIC-encoded system by default, while AIX is based on ASCII. 
This difference often requires data conversions between the IBM i database (Db2 for i) and the PASE for i application.

The IBM i operating system is fundamentally an EBCDIC system. 
PASE for i shells and utilities run in ASCII and generally do not perform automatic conversion of stream data. 
You might need to use tools (for example, the `iconv()` function) to convert between ASCII and EBCDIC.

Default Shell: KornShell
Default path locations for IBM i system-unique header files: /usr/include/
Default path locations for IBM i system-unique export files: /usr/lib/

QP2TERM() - An IBM i program that run a PASE for i program in an interactive shell environment. 
The following command writes the default Korn shell prompt (/QOpenSys/usr/bin/sh) to the screen:
`CALL QP2TERM` - Run an IBM PASE for i Terminal Session
Opens the terminal (preferably in 27x132 window, if that's enabled) with '/QOpenSys/usr/bin/-sh', say thru an interactive job 555555/JOBUSER/QPADEV9999
The call invokes QSYS/QP2TERM.pgm.cpple, Qp0zRunTerminal proc from QSYS/QP0ZTRML.srvpgm.cpple and QSYS/QRCVDTAQ.pgm.???
Job 555555/JOBUSER/QPADEV9999 started in subsystem QINTER in QSYS. The program QSHELL/QZSHSH.pgm.cpple runs in its own dynamically assigned ACTGRP, say 18.
Notice: The BCI job gets submitted by the same parameter as the INTER job
Creates a *DTAQ in QTEMP, with name QP0ZTRML and deletes it as user exits the terminal.

From this prompt (or terminal), you run a PASE for i program in a separate batch job. 
QP2TERM() uses the interactive job to display output and to accept input for files stdin, stdout, and stderr in the batch job.

`QSH` short for `STRQSH` invokes QSHELL/QZSHQSHC.pgm.cpple, Qp0zRunTerminal proc from QSYS/QP0ZTRML.srvpgm.cpple and QSYS/QRCVDTAQ.pgm.???
Opens the terminal (preferably in 27x132 window, if that's enabled) with '/usr/bin/', say thru an interactive job 555555/JOBUSER/QPADEV9999
Runs the QSHELL/QZSHSH.pgm.cpple in a BATCHI (or BCI) job
Job 555555/JOBUSER/QZSHSH started in subsystem QINTER in QSYS. The program QSHELL/QZSHSH.pgm.cpple runs in its own dynamically assigned ACTGRP, say 19.
Notice: The BCI job gets submitted by a dedicated jobname i.e. QZSHSH

`QP2SHELL()` and `QP2SHELL2()` - Run an IBM PASE for i Shell Program
The QP2SHELL() program runs the PASE for i program in a new activation group. 
The QP2SHELL2() program runs in the caller's activation group.

`systemCL()` - Run a CL command for IBM PASE for i

ILE environment variables are passed to PASE for i only when it is started with QP2SHELL() and QP2TERM(). 
Use the Work with Environment Variables (WRKENVVAR) command to change, add, or delete environment variables as needed before starting PASE for i.

`/usr/bin/` or `/usr/sbin/` means user binary (or utility) files. Basically Shell utilities.

For many system resources, the IBM i operating system uses names that are not case sensitive.
However, these system resources have names that are case sensitive in AIX; for example, user and group names and object names in the root file system.

The following example uses the QShell cat command to convert text in an IBM i source database file
to the (ASCII) PASE for i CCSID and store the result in a stream file named ascii_sqlcli.h. This uses
the QShell utility support for inserting line-end characters, which are not added if the PASE for i cat
command is used, into the stream.

`qsh_out -c 'cat /qsys.lib/qsysinc.lib/h.file/sqlcli.mbr' > ascii_sqlcli.h`

TTY Session - TeleTYpewriter Session, which is started by the PASE command aixterm or xterm

`QSH` - CL command that launches the QShell terminal
`QP2TERM` - CPPLE program that launches the QShell terminal set at path '/QOpenSys/usr/bin/-sh'. It is also called as API program
`QP2SHELL()` or `QP2SHELL2()` - CPPLE program to run QShell scripts from IBM i CLI
