echo off

echo Insert third DOS formatted disk into %1
echo WARNING!!  All data will be lost on this disk.
pause
echo Copying disk 3......

fdimage disk3 a:

echo ----------------------------------------
echo Makedisk complete
