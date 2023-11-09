### What's the .hod extension mean in the Emulator filename, say *LPAR1_Session.hod* ?

.hod is actually short for 'Host On-Demand'. `.hod` files are created and used by IBM Access Client Solution (ACS) bundle (acsbundle.jar). These files access cmd, initializes plugins to launch 5250 emulator.

1. executes Windows host process (`rundll32`.exe)
2. executes Console Windows Host (`conhost`.exe)
3. executes Launch of IBM i Access Client Solutions (`acslaunch`_win-64.exe), verifies Product installations, verifies and install Plugins (if reqd.)

---
the process flow....
1. (checks if any message waits)
2. encrypt the data based on the port used
3. sets the connection protocol (TCP/IP)
4. invokes the Control Unit, which est. connection to the Telnet server
5. activates Host Session

[OIA_ss](https://i.stack.imgur.com/37cfS.png)

> IBM Host On-Demand (HOD) provides security-rich web-to-host terminal emulation and host access application programming support from a single interface. Host On-Demand provides connectivity to TN3270E, TN5250, VT52, VT100, VT220 and VT420 systems, IBM CICS® applications and FTP servers. The Managed Host On Demand environment replaces the browser on the local machine and removes the need to download the Java Runtime Environment (JRE).

The Emulator app (`acshod`) uses Java Development Kit (JDK) to function. The app gets frequent updates from IBM. 

## Miscellaneous
- acsbundle.jar uses JDK present at 'C:\Program Files\Java\jdk-18.0.2'. I'm currently running Java 11.0.11 and Java Vendor is Oracle Corporation.
- `.jar` is an executable JAR (Java ARchive) file
- acsbundle.jar is by default installed at 'C:\Users\Public\IBM\ClientSolutions\acsbundle.jar'. The JAR files are like .zip (Zipped) or .rar (Roshal Archive) files, and can be extracted using file archivers like 7-Zip.
  - The "7z" file format supports several compression methods, including LZMA (Lempel-Ziv-Markov chain-Algorithm), LZMA2, PPMD, BCJ, BCJ2, BZip2, and Deflate (the 7zipping methods). The choice of compression method can affect the compression ratio and speed.
- the Emulator uses TCP/IP as connection protocol
- Font used in ACS: IBM3270

[IBM Personal Communications](https://www.ibm.com/support/pages/ibm-personal-communications)
> IBM® Personal Communications is a host communication and terminal emulation package for Microsoft™ Windows™. Now with full 64-bit architecture, it features virtual terminal (VT) emulation and systems network architecture (SNA) application support and provides a platform to access data and applications on different host systems. It is a component of IBM Host Access Client Package (HACP) and IBM Host Integration Solution. Enhancements include: Full 64-bit product enables HACP server to save configurations and rapidly download updates. Host on Demand replaces browser on local machine and removes need to download JRE

[ENPTUI](https://www.ibm.com/docs/en/hats/9.6.0?topic=poct-enabling-enhanced-non-programmable-terminal-user-interface-enptui)
> ENPTUI enables an enhanced user interface on non-programmable terminals (NPT) and programmable work stations (PWS) over the 5250 full-screen menu-driven interface, taking advantage of 5250 display data stream extensions. These extensions can be also accessed via the DDS programming interface. Graphical DDS keywords specify the GUI controls to be displayed.

[LamAlef](https://en.wikipedia.org/wiki/L%C4%81m_alef?wprov=srpw1_0)
> The bidirectional layout engine converts between visual and implicit representation of Arabic characters. The Lam-Alef ligature in visual representation is expanded to <Lam> and <Alef> characters in implicit representation. U+FEFB , ﻻ , is called "Arabic Ligature Lam With Alef Isolated Form", a Right-to-Left (Arabic) letter

## Glossary
- VT - Virtual Terminal
- SNA - Systems Network Architecture
- JRE - Java Run-time Environment
- HACP - Host Access Client Package
- HATS - Host Access Transformation Services
- HIC - (IBM) Host Integration Solution
- RHIC - Rational Host Integration Solution
- IBM PC - IBM Personal Communications
- OIA (Graphical/Textual) - Operator Information Area (PC/3270)
- HMC - Hardware Management Console
- Host Code Page (CCSID)
- NPT - Non-programmable Terminal
- PWS - Programmable Work Stations
- ENPTUI - Enhanced Non-Programmable Terminal User Interface 
- SLP - Service Location Protocol
- TLS/SSL
- LamAlef <-> BIDI Font CodePage - Lam and Alif, are like A to Z of Arabic letters?
- BiDi - Bi-Directional
- DBCS <-> UDC Table - Double-Byte Character Set 
- UDC - User-Defined Characters
- IME Autostart
- HPR - High-Performance Routing
- LUA - Logical Unit Applications
- APPC - Advanced Program-to-Program Communications
- CPI-C - Common Programming Interface for Communications
- HLLAPI - High-Level Language Applications Programming Interface
- EHLLAPI - Emulator High-Level Language Applications Programming Interface
