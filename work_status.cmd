@echo off

set regedit_path=HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced
set value_name=ShowSecondsInSystemClock

echo Disabling seconds to current active user

for /F "usebackq skip=2 tokens=1,2*" %%A IN (`reg query %regedit_path% /v %value_name% 2^>nul`) do (	

	set "value_name=%%A"
	set "value_type=%%B"
	set "value_value=%%C"
)
set /p str="To enable seconds type - E, to disable seconds type - D: "
if defined value_value (
	goto STATUS
) else (
	echo not found value by path %regedit_path%\%value_name%
)
pause
:STATUS
if "%str%" == "E" (
	if "%value_value%" == "0x1" (
		echo "already enable"
		pause
		exit /b 0
	) else (	
		reg add %regedit_path% /v %value_name% /t REG_DWORD /d 0x1 /f
	       pause
       		exit /b 0
	)

)

if "%str%" == "D" (
	if "%value_value%" == "0x0" (
		echo "already disable"
		pause
		exit /b 0
	) else (	
		reg add %regedit_path% /v %value_name% /t REG_DWORD /d 0x0 /f
	       	pause
       		exit /b 0
	)
)

