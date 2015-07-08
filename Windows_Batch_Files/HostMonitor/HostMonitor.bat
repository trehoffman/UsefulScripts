@echo off

set target=%1
if [%target%]==[] GOTO error

:loop
ping -n 1 %target% | find "TTL=" >nul
if errorlevel 1 (
    echo host %target% not reachable @ %DATE:~-4%%DATE:~4,2%%DATE:~7,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%%TIME:~10,2%
    echo host %target% not reachable @ %DATE:~-4%%DATE:~4,2%%DATE:~7,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%%TIME:~10,2% >> results.txt
) else (
    echo host %target% reachable @ %DATE:~-4%%DATE:~4,2%%DATE:~7,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%%TIME:~10,2%
    REM echo host %target% reachable @ %DATE:~-4%%DATE:~4,2%%DATE:~7,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%%TIME:~10,2% >> results.txt
)
goto loop

:error
echo Error: no target specified