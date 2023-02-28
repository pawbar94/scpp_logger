@echo off

set BUILD_TYPE=%1

if [%1] == [] set BUILD_TYPE=Debug

set SCRIPTS_DIR=%~dp0
set REPO_DIR=%SCRIPTS_DIR%..
set SCPP_LOGGER_BUILD_DIR=%REPO_DIR%\build
set EXAMPLE_DIR=%REPO_DIR%\example
set EXAMPLE_BUILD_DIR=%EXAMPLE_DIR%\build

echo ----- Build type: %BUILD_TYPE% -----

echo ----- Configuring CMake for SCPPLogger for sources in %REPO_DIR% and build in %SCPP_LOGGER_BUILD_DIR% -----
cmake -S %REPO_DIR% -B %SCPP_LOGGER_BUILD_DIR% -DCMAKE_BUILD_TYPE=%BUILD_TYPE%
echo ----- SCPPLogger CMake configuration done -----

echo ----- Building SCPPLogger in %SCPP_LOGGER_BUILD_DIR% -----
cmake --build %SCPP_LOGGER_BUILD_DIR% --config %BUILD_TYPE%
echo ----- SCPPLogger build done -----

echo ----- Installing SCPPLogger in %SCPP_LOGGER_BUILD_DIR% -----
cmake --install %SCPP_LOGGER_BUILD_DIR% --config %BUILD_TYPE%
echo ----- SCPPLogger installation done -----

echo ----- Configuring CMake for SCPPLogger example for sources in %EXAMPLE_DIR% and build in %EXAMPLE_BUILD_DIR% -----
cmake -S %EXAMPLE_DIR% -B %EXAMPLE_BUILD_DIR% -DCMAKE_BUILD_TYPE=%BUILD_TYPE%
echo ----- SCPPLogger example's CMake configuration done -----

echo ----- Building SCPPLogger example in %EXAMPLE_BUILD_DIR% -----
cmake --build %EXAMPLE_BUILD_DIR% --config %BUILD_TYPE%
echo ----- SCPPLogger example's build done -----

echo ----- Installing SCPPLogger examples in %EXAMPLE_BUILD_DIR% -----
cmake --install %EXAMPLE_BUILD_DIR% --config %BUILD_TYPE%
echo ----- SCPPLogger examples' installation done -----