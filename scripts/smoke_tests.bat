@REM @echo off

@REM set BUILD_TYPE=%1

@REM if [%1] == [] set BUILD_TYPE=Debug

@REM set SCRIPTS_DIR=%~dp0
@REM set REPO_DIR=%SCRIPTS_DIR%..
@REM set EXAMPLE_APPS_BIN_DIR=%REPO_DIR%\examples\build\%BUILD_TYPE%

@REM echo ----- Running parsing example application -----
@REM %EXAMPLE_APPS_BIN_DIR%\parsing_example_app.exe
@REM echo ----- Parsing example application done -----

@REM echo ----- Running running example application -----
@REM %EXAMPLE_APPS_BIN_DIR%\running_example_app.exe
@REM echo ----- Running example application done -----