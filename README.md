# HP89410A

Data for [Agilent/HP 89410A Spectrum Analyzer Hack](https://www.eevblog.com/forum/testgear/enable-all-options-on-hp-89441a-and-89410a/)

Since the 89400 Vector Spectrum Analyzer series (89410A, 89441A) is out of support, you're not able to obtain software
options from HP/Agilent/Keysight anymore. Here's a hack to enable software options using the HP 89400 Service Utility disk (enclosed, just unzip and copy to DOS-formatted floppy):

   1. Create a service disk as described in README of service disk (ommitting instructions 1 to 3,
        as it is already unzipped) and save your current 89400 device
   configuration to it ("CPU replacement/Save Config"). You will need this file to restore factory calibration and
   serial number. So keep a copy of the newly created file in a safe place, also in case something went wrong.
   
   3. Open file "CONFIG_ALL_OPT" with an hex editor (like "Tiny Hexer" from www.mirkes.de).
   
   2. Make copy of newly created "CONFIG" file from your 89400. Open your "CONFIG" file
   with hex editor in a second window.
   
   3. Locate your serial number and factory cal data, beginning at location $0300.
   Serial number string in "" should start at $0305 and match sticker on back of 89400.
   
   4. Copy & Paste serial number to "CONFIG_ALL_OPT" file at same location
   (overwrite bytes - file length should not change!).

   5. Locate factory calibration data, beginning at location behind serial number and
   option strings. Usually starts with byte $3F (8 Bytes, IEC double precision format).
   
   6. Copy & Paste factory calibration data (8 bytes) to "CONFIG_ALL_OPT" file at location $033A
   (overwrite bytes - file length should not change!)
   
   7. Check that pointer at $0207 points to end of data (after last byte of
   pasted cal bytes) and file ends at $03FF. Should be $42 now.
   
   8. Save file as "CONFIG" to floppy disk, overwrite old one.
   
   9. Insert disk into your 89400. Proceed with "CPU replacement/Recall Config" on your 89400.
   
   10. Restart 89400 and check if options have been installed.
   
   11. Make a donation to "info [ at ] keyboardpartner.de" paypal account if you
   appreciate my hack (leave "89441A Upgrade" as comment).

NO WARRANTIES! USE AT YOUR OWN RISK!

Hack Internals

Password for advanced 89400 options is "1125".

Bytes $0000 to $01FF in CONFIG file are LIF format data. Do not change.

Configuration data Block starts at $0300.

Byte at $0207 is a length byte, pointing to the byte behind factory cal IEC
double (minus block start address $0300). With no options it is $1E, with all options it is $42.

All data from $0210 to $02FF written by 89400 is garbage. Disregard.
   
Bytes at $0303 and $0313 are Pascal style string length bytes. Adjust byte at $0313
if you change your option list. String length must include "" (for instrument BASIC, I suppose).

Options are stored as a comma separated string list, enlosed in "", beginning at
location $0315.

Factory calibration data is stored in IEC Double precision format, 8 bytes. On
my 89441A with no options installed, it was located at $0306 to $031D.

All data from end of factory calibration data $0343 to $03FF is garbage. Disregard. I had set all bytes to zero.

RCL_CFG and SAVE_CFG seem to be scrambled/zipped/encoded BASIC files which run
even on a machine with BASIC disabled. No investigations done so far.
