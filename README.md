
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/pawbar94/scpp_logger/windows-release-build.yml?label=Windows%20release%20build) ![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/pawbar94/scpp_logger/linux-release-build.yml?label=Linux%20release%20build) [![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)

# Simple logger for C++
Table of contents:

[What is it?](#what_is_it)<br>
[How to build and install](#how_to_build_and_install)<br>
&emsp;[How to build scpp_logger repository](#how_to_build_scpp_logger_repository)<br>
&emsp;[How to embed SCPPLogger into your project](#how_to_embed_scpp_logger_into_your_project)<br>
&emsp;[How to use SCPPLogger release package](#how_to_use_scpp_logger_release_package)<br>
[How to use](#how_to_use)<br>

## <a name="what_is_it"></a>What is it?

SCPPLogger (Simple C++ Logger) is a library which allows user to set up basic logging in a custom C++ application. There are six logging levels that user may choose from:
* Fatal - for logging in case of unrecoverable component error
* Error - for logging in case of recoverable component error
* Warning - for logging in case of potentially problematic situation which however does not necessarly lead to a higher level error
* Info - for logging information valueable for the user during normal usage
* Debug - for logging information helpful for the user during debugging
* Verbose - for logging information helpful for the software developer during the development

## <a name="how_to_build_and_install"></a>How to build and install

### <a name="how_to_build_scpp_logger_repository"></a>How to build scpp_logger repository

The preffered way of building this project is to use build.bat or build.sh script (depending on whether you are on Windows or Linux). These scripts take only one optional argument which is build type (Debug by default or Release), so if you want to build a Debug version, just go to _scripts_ folder and call `build.bat` (Windows) or `./build.sh` (Linux).

If for any reason build script fails, to build the SCPPLibrary library manually, call from the repository root:

```
mkdir build 
cd build
cmake ..
cmake --build .
cmake --install .
```
And to build SCPPLibrary example:
```
cd example
mkdir build 
cd build
cmake ..
cmake --build .
cmake --install .
```

### <a name="how_to_embed_scpp_logger_into_your_project"></a>How to embed SCPPLogger into your project
Embedding SCPPLogger into your project is very easy and (assuming that scpp_logger is in root of your project) the minimum CMakeLists.txt file that you need is:

```
cmake_minimum_required(VERSION 3.10)

project(ExampleSCPPLoggerApp)

add_subdirectory(scpp_logger)

add_executable(${PROJECT_NAME})

target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_SOURCE_DIR}/scpp_logger/include
)

target_sources(${PROJECT_NAME} PRIVATE
    ${CMAKE_SOURCE_DIR}/main.cpp
)

target_link_libraries(${PROJECT_NAME} PRIVATE
    SCPPLogger
)
```

After that you can start using SCPPLogger in main.cpp file.

### <a name="how_to_use_scpp_logger_release_package"></a>How to use SCPPLogger release package

* Download .zip package from one of the SCPPLogger releases on github
* In the archive you will find folder scpp_logger - extract it
* Inside the scpp_logger folder you will find SCPPLogger.dll library and public headers
* Asuming that you put that folder in the root of your project, the minimum required CMakeLists.txt file is:

```
cmake_minimum_required(VERSION 3.10)

project(ExampleSCPPLoggerApp)

set(SCPP_LOGGER_DIR ${CMAKE_SOURCE_DIR}/scpp_logger)

add_executable(${PROJECT_NAME})

target_include_directories(${PROJECT_NAME} PRIVATE
    ${SCPP_LOGGER_DIR}/include
)

target_sources(${PROJECT_NAME} PRIVATE
    ${CMAKE_SOURCE_DIR}/main.cpp
)

find_library(SCPP_LOGGER_LIB NAMES SCPPLogger HINTS ${SCPP_LOGGER_DIR})

target_link_libraries(${PROJECT_NAME} PRIVATE
    ${SCPP_LOGGER_LIB}
)
```
After that you can start using SCPPLogger in main.cpp file.

## <a name="how_to_use"></a>How to use

In order to use SCPPLogger just create a static logger object for each translation unit and give it a unique name. You can find the actual sample code in _example_ folder.