HP 89400 Service Utility Instructions
=====================================

This file describes the steps required to produce a floppy disk
on a personal computer (PC) that can be used to in servicing
in the HP 89400 Vector Signal Analyzer.  

Requirements:
-------------

   1. A PC with a 3.5" floppy drive that is compatible with high density
      (1.44 MByte) disks and running DOS 3.1 or higher.

   2. One (1) 3.5" high density (1.44 MByte) disk.

   3. Access to the SERVICE1.EXE archive file that contains a self extracting 
      archive of the utility software.

Instructions:
-------------

   1. Obtain the SERVICE1.EXE archive file (via ftp, email, ...) and 
      place it in a directory on your local PC.

      For example via web browser:

         ftp://bbs.lsid.hp.com/service/894xx/save-opt/service1.exe 

   2. "Execute" the SERVICE1.EXE program.  

      For example :

         > SERVICE1.EXE

      The SERVICE1.EXE file is a self extracting archive that contains 
      the following files that should now be present in your current 
      directory :

         File              Comments
         -------------     --------------------------------------------
         SAVE_CFG          Service Utility program
         RCL_CFG           Service Utility program
         CONFIG            Service Utility file
         README            Usage instructions (this file)

   3. Format one (1) high density 3.5" disk using the DOS "FORMAT"
      command.

      For example :

         > FORMAT A:

   4. Copy the files to a 3.5" disk. 

      For example :

         > COPY *.* A:


      The disk produced is now ready to use in servicing the HP89400 using
      the following key presses.
      System Utility, more, diagnostics, service functions, 1125, enter, 
      utilities, CPU/Memory replacement


How to enable Software Options in 89400 Series
==============================================

by Carsten Meyer, info@keyboardpartner.de (paypal donations welcome!), May 2017

Since the 89400 series is out of support, you're not able to obtain software 
options from HP/Agilent/Keysight anymore. Here's a way to enable software 
options using the HP 89400 Service Utility:

	1. Create a service disk as described above and save your current 89400 device 
	configuration to it. You will need this file to restore factory calibration and 
	serial number.
	
	3. Open file "CONFIG_ALL_OPT" with hex editor (like "Tiny Hexer" from www.mirkes.de).
	
	2. Make copy of created "CONFIG" file from your 89400. Open your "CONFIG" file 
	with hex editor in a second window.
	
	3. Locate your serial number and factory cal data, beginning at location $0300. 
	Serial number string in "" should start at $0305 and match sticker on back of 89400.
	
	4. Copy & Paste serial number to "CONFIG_ALL_OPT" file at same location 
	(overwrite bytes - file length should not change!).

	5. Locate factory calibration data, beginning at location behind serial number and 
	option strings. Usually starts with byte $3F (8 Bytes, IEC double precision format)
	
	6. Copy & Paste factory calibration data (8 bytes) to "CONFIG_ALL_OPT" file at location $033A 
	(overwrite bytes - file length should not change!)
	
	7. Check that pointer at $0207 points to end of data (after last byte of 
	pasted cal bytes) and file ends at $03FF.
	
	8. Save file as "CONFIG" to floppy disk.
	
	9. Proceed with "CPU replacement/Recall Config" on your 89400.
	
	10. Restart 89400 and check if options have been installed.
	
	11. Make a donation to "info@keyboardpartner.de" paypal account if you 
	appreciate my hack. 

	
Hack Internals
--------------

Password for advanced 89400 options is "1125".

Bytes $0000 to $01FF are LIF format data. Do not change.

Configuration data Block starts at $0300.

Byte at $0207 is a length byte, pointing to the byte behind factory cal IEC 
double (minus block start address $0300).

All data from $0210 to $02FF is garbage. Disregard.
	
Bytes at $0303 and $0313 are "C" style string length bytes. Adjust byte at $0313 
if you change your option list. Strings must include "" (for instrument BASIC, I suppose).

Factory calibration data is stored in IEC Double precision format, 8 bytes. On 
my 89441A with no options installed, it is located at $0306 to $031D.
	
All data from end of factory calibration data to $03FF is garbage. Disregard.

RCL_CFG and SAVE_CFG seem to be scambled/zipped/encoded BASIC files which run 
even on a machine with BASIC disabled. No Investigations done so far.
