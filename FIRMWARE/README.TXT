
Agilent Technologies 89400 DOS Firmware Update Utility Instructions
-------------------------------------------------------------------

This file describes the steps required to produce a set of floppy disks 
on a personal computer (PC) that can be used to update the firmware 
in the Agilent 89400 Vector Signal Analyzer family of instruments.

Requirements:
-------------

   1. A PC with a 3.5" floppy drive that is compatible with high density
      (1.44 MByte) disks and running DOS 3.1 or higher.

   2. Three (3) 3.5" high density (1.44 MByte) disks. 
     
   3. Access to the AG894X0.EXE archive file that contains the new 
      instrument firmware and tools required to produce the update disks.

Instructions:
-------------

   1. Obtain the AG894X0.EXE archive file (via ftp, email, ...) and 
      place it in a directory on your local PC.

 
   2. "Execute" the AG894X0.EXE program.  

      For example :

         > AG894X0.EXE

      The AG894X0.EXE file is a self extracting archive that contains 
      the following files that should now be present in your current 
      directory :

         File              Comments
         -------------     --------------------------------------------
         disk1             Image file of disk 1
         disk2             Image file of disk 2
         disk3             Image file of disk 3
         fdimage.exe       Utility to copy image files 
         MAKEDISK.BAT      DOS batch file to produce update disks
         README            Usage instructions (this file)

   3. Format three (3) high density 3.5" disks using the DOS "FORMAT"
      command.

      For example : 

         > FORMAT A: 

   4. Run the MAKEDISK.BAT batch file specifying the floppy drive for
      your 3.5" drive as a parameter.

      For example :

         > MAKEDISK A:

      Using the disks formatted in step #3, place the first disk in the
      drive and press return.  The batch file will prompt for subsequent
      disks as needed until the process is complete.  Label each disk
      in the order in which it was produced.  This is necessary since
      the analyzer will require this same order during the update process.

      The disks produced are now ready to update the firmware in an 
      Agilent 894X0 Vector Signal Analyzer.  Please follow the instrument's
      firmware update instructions to complete this task.

Notes
-----
   
   1. The MAKEDISK.BAT batch file will convert the DOS disks formatted in 
      step #3 above into Logical Interface Format (LIF) and then copy
      the appropriate firmware update files to the disks.  This will render
      the disks unreadable by DOS (e.g. DIR). 

   2. To produce multiple sets of firmware update disks, repeat steps
      #3 and #4 above.
