@echo OFF

REM display available disks to partition
diskpart /s diskpartDisplayDisks.txt 

REM prompt user for disk number
echo.
echo ProTip: Disk 1 (or higher) is usually your USB drive
echo.
echo ProTip: Access this disk list with your USB drive connected and disconnected and take note of which disk disappears when the USB drive is disconnected
echo.
echo ProTip: The Size field from the disk list can be a way to identify the disks
echo.
set /p "disk=Enter Disk # To Format: "
set "disk=Disk %disk%"

REM prompt user to confirm disk selection
echo.
echo This operation will overwrite all data on %disk%.
echo Are you sure you want to partition and format %disk%?
set /p confirm="(Y/N): "

if %confirm%==Y goto YES
if %confirm%==y goto YES
echo.
echo Goodbye
goto :END

:YES
echo select %disk% > diskpartFormat.txt
echo. >> diskpartFormat.txt
echo clean >> diskpartFormat.txt
echo. >> diskpartFormat.txt
echo create partition primary >> diskpartFormat.txt
echo. >> diskpartFormat.txt
echo select partition 1 >> diskpartFormat.txt
echo. >> diskpartFormat.txt
echo active >> diskpartFormat.txt
echo. >> diskpartFormat.txt
echo format fs=fat32 >> diskpartFormat.txt
echo. >> diskpartFormat.txt
echo assign >> diskpartFormat.txt
echo. >> diskpartFormat.txt
echo exit >> diskpartFormat.txt

REM format and partition the disk
diskpart /s diskpartFormat.txt > diskpartLog.txt

echo Please wait.  Formatting may take a while.

REM check if a valid disk number was entered
findstr /c:"The disk you specified is not valid." diskpartLog.txt >nul 2>&1

if %errorlevel%==0 (
	echo.
	echo The disk you specified is not valid.
	echo Goodbye.
	goto :END
) else (
	echo.
	echo The USB drive has been formatted.
	echo Now copy Windows install files to the drive.
	goto :END
)

:END
