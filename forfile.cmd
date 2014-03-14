::For each file in a path run a command.
@echo off
set d=%1
set command=

:: Get all but the first parameter
shift
:paramclean
if "%1"=="" goto cleaned
set command=%command% %1
shift
goto paramclean

:cleaned


for %%F in (%d%) do (
    echo %command% %%~dpnxF
)