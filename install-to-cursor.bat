@echo off
setlocal
set "SRC=%~dp0skills"
set "DST=%USERPROFILE%\.cursor\skills"
if not exist "%SRC%" (
  echo No skills\ folder next to this script.
  exit /b 1
)
if not exist "%DST%" mkdir "%DST%"
echo Installing all skills from:
echo   %SRC%
echo into:
echo   %DST%
echo.
for /d %%D in ("%SRC%\*") do (
  echo   %%~nxD
  xcopy /E /I /Y "%%D" "%DST%\%%~nxD" >nul
)
echo.
echo Done. Restart Cursor Agent / open a new chat.
endlocal
