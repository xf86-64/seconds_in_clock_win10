@echo off
echo ENABLE SECONDS TO CLOCK
echo ------------------------
set regedit_path=HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced
set value_name=ShowSecondsInSystemClock

reg query %regedit_path% /v %value_name% > nul 2>&1
rem checking if key exists
if %ERRORLEVEL% EQU 0 (
	reg delete %regedit_path% /v %value_name% /f	
)
	reg add %regedit_path% /v %value_name% /t REG_DWORD /d 0x1 /f > nul 2>&1	
	goto DATA	
:DATA
set /p data="Reboot now? Type Y for yes or N for NO: "
if "%data%"=="Y" (
	cls
	echo Reboot...
	shutdown /r
	pause
	exit
)
if "%data%"=="N" (
	cls
	echo "No reboot now"
	pause
	exit
)
echo "you type unknown operation"
pause

