@echo off
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
set alfanum=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789

set pwd=
FOR /L %%b IN (0, 1, 16) DO (
SET /A rnd_num=!RANDOM! * 62 / 32768 + 1
for /F %%c in ('echo %%alfanum:~!rnd_num!^,1%%') do set pwd=!pwd!%%c
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

md %temp%\zip%pwd%
xcopy /S %files% %temp%\zip%pwd% > nul

CScript //NoLogo %USERPROFILE%/.cmd/zip/zip.vbs %temp%\zip%pwd% %d%

rmdir /s /q %temp%\zip%pwd%