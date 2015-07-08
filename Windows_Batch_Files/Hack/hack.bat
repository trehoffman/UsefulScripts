@echo off

REM echo without new line
echo.|set /P ="Hacking %*."

REM FOR /L %%G IN (1,1,10) DO (call :sub)
REM goto :done

:sub
REM this command waits a second
ping 1.0.0.0 -n 1 -w 500 >NUL

set i=0
set m=0
set modswitch=0
:loop
set /a "i = i + 1"
set /a "m = i%%4"
set /a "modswitch = i%%16"

ping 1.0.0.0 -n .5 >NUL

if %modswitch% equ 1 (
	if %m% equ 1 <nul (echo.|set /p=".|")
	if %m% equ 2 <nul (echo.|set /p="/")
	if %m% equ 3 <nul (echo.|set /p="-")
	if %m% equ 0 <nul (echo.|set /p="\")
) else (
	if %m% equ 1 <nul (echo.|set /p="|")
	if %m% equ 2 <nul (echo.|set /p="/")
	if %m% equ 3 <nul (echo.|set /p="-")
	if %m% equ 0 <nul (echo.|set /p="\")
)

if %i% equ 176 (
	echo.|set /p="."
	echo.|set /p="Complete."
	goto :done
)
goto :loop

:done
echo.
echo.
echo Target "%*" successfully hacked.