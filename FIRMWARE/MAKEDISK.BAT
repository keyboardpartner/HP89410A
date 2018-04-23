echo off

REM
REM DOS batch script to create HP 894XX Vector Signal Analyzer
REM firmware update disks.
REM
REM Prepare first LIF firmware update disk

echo Insert first DOS formatted disk into %1
echo WARNING!!  All data will be lost on this disk.
Pause
echo Copying disk 1......

fdimage disk1 %1

REM Prepare second LIF firmware update disk

echo ----------------------------------------
echo Insert second DOS formatted disk into %1
echo WARNING!!  All data will be lost on this disk.
pause
echo Copying disk 2......

fdimage disk2 %1

REM Prepare third LIF firmware update disk

echo ----------------------------------------
echo Insert third DOS formatted disk into %1
echo WARNING!!  All data will be lost on this disk.
pause
echo Copying disk 3......

fdimage disk3 %1

echo ----------------------------------------
echo Makedisk complete
