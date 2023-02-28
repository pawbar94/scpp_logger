@echo off

set BUILD_TYPE=%1

if [%1] == [] set BUILD_TYPE=Debug

set SCRIPTS_DIR=%~dp0
set REPO_DIR=%SCRIPTS_DIR%..
set EXAMPLE_APP_BIN_DIR=%REPO_DIR%\example\build\%BUILD_TYPE%

SETLOCAL EnableDelayedExpansion

echo ----- Running example application -----
%EXAMPLE_APP_BIN_DIR%\SCPPLoggerExample.exe || exit /b !ERRORLEVEL!
echo ----- Running example application done -----