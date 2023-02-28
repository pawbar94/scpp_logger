@REM @echo off

@REM set BUILD_TYPE=%1

@REM if [%1] == [] set BUILD_TYPE=Debug

@REM set SCRIPTS_DIR=%~dp0
@REM set REPO_DIR=%SCRIPTS_DIR%..
@REM set COMLINT_BUILD_DIR=%REPO_DIR%\build
@REM set EXAMPLES_DIR=%REPO_DIR%\examples
@REM set EXAMPLES_BUILD_DIR=%EXAMPLES_DIR%\build

@REM echo ----- Build type: %BUILD_TYPE% -----

@REM echo ----- Configuring CMake for ComlintCpp for sources in %REPO_DIR% and build in %COMLINT_BUILD_DIR% -----
@REM cmake -S %REPO_DIR% -B %COMLINT_BUILD_DIR% -DCMAKE_BUILD_TYPE=%BUILD_TYPE%
@REM echo ----- ComlintCpp CMake configuration done -----

@REM echo ----- Building ComlintCpp in %COMLINT_BUILD_DIR% -----
@REM cmake --build %COMLINT_BUILD_DIR% --config %BUILD_TYPE%
@REM echo ----- ComlintCpp build done -----

@REM echo ----- Installing ComlintCpp in %COMLINT_BUILD_DIR% -----
@REM cmake --install %COMLINT_BUILD_DIR% --config %BUILD_TYPE%
@REM echo ----- ComlintCpp installation done -----

@REM echo ----- Configuring CMake for Comlint examples for sources in %EXAMPLES_DIR% and build in %EXAMPLES_BUILD_DIR% -----
@REM cmake -S %EXAMPLES_DIR% -B %EXAMPLES_BUILD_DIR% -DCMAKE_BUILD_TYPE=%BUILD_TYPE%
@REM echo ----- Comlint examples' CMake configuration done -----

@REM echo ----- Building Comlint examples in %EXAMPLES_BUILD_DIR% -----
@REM cmake --build %EXAMPLES_BUILD_DIR% --config %BUILD_TYPE%
@REM echo ----- Comlint examples' build done -----

@REM echo ----- Installing comlint examples in %EXAMPLES_BUILD_DIR% -----
@REM cmake --install %EXAMPLES_BUILD_DIR% --config %BUILD_TYPE%
@REM echo ----- Comlint examples' installation done -----