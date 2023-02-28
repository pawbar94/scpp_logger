cmake_minimum_required(VERSION 3.10)

project(SCPPLoggerExample)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(SCPP_LOGGER_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../build)

if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Debug")
endif()

add_executable(${PROJECT_NAME})

target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../include
)

target_sources(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/component_one.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/component_two.cpp
)

find_library(SCPP_LOGGER_LIB NAMES SCPPLogger HINTS ${SCPP_LOGGER_DIR})

target_link_libraries(${PROJECT_NAME} PRIVATE
    ${SCPP_LOGGER_LIB}
)

if (UNIX)
    install(FILES ${SCPP_LOGGER_DIR}/libSCPPLogger.so DESTINATION ${CMAKE_BINARY_DIR})
elseif (WIN32)
    install(FILES ${SCPP_LOGGER_DIR}/SCPPLogger.dll DESTINATION ${CMAKE_BINARY_DIR}/${CMAKE_BUILD_TYPE})
endif()