@echo off

set backup_filename=backup
set dir_filename=backups
set regedit_path=HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced
if exist %dir_filename% (
	del /s /q %dir_filename%
	mkdir %dir_filename%
) else (
	mkdir %dir_filename%
)
reg export %regedit_path% %CD%\%dir_filename%\%backup_filename%.reg
