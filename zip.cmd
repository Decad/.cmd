@echo off
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
set alfanum=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789

set rnd=
FOR /L %%b IN (0, 1, 16) DO (
SET /A rnd_num=!RANDOM! * 62 / 32768 + 1
for /F %%c in ('echo %%alfanum:~!rnd_num!^,1%%') do set rnd=!rnd!%%c
)

set d=%1
set files=

:: Get all but the first parameter
shift
:paramclean
if "%1"=="" goto cleaned
set files=%files% %1
shift
goto paramclean

:cleaned

md %temp%\zip%rnd%

FOR %%a in (%files%) DO (
    xcopy /S %%~a %temp%\zip%rnd% /Y > nul
)

CScript //NoLogo %USERPROFILE%\.cmd\zip\zip.vbs %temp%\zip%rnd% %temp%\zip%rnd%.zip

rmdir /s /q %temp%\zip%rnd%

move %temp%\zip%rnd%.zip %d% > nul