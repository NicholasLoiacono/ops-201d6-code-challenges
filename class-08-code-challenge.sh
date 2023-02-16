@echo off

set source=%userprofile%\Desktop\work
set destination=D:\backup

if not exist "%destination%" (
  mkdir "%destination%"
)

robocopy "%source%" "%destination%" /E /LOG+:D:\backup\backup.log