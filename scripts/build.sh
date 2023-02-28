#!/bin/bash

BUILD_TYPE=$1

if [ -z "$BUILD_TYPE" ]
then
    BUILD_TYPE=Debug
fi

SCRIPTS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPO_DIR=$SCRIPTS_DIR/..
SCPP_LOGGER_BUILD_DIR=$REPO_DIR/build
EXAMPLE_DIR=$REPO_DIR/example
EXAMPLE_BUILD_DIR=$EXAMPLE_DIR/build

echo ----- Build type: $BUILD_TYPE -----

echo "----- Configuring CMake for SCPPLogger for sources in $REPO_DIR and build in $SCPP_LOGGER_BUILD_DIR -----"
cmake -S $REPO_DIR -B $SCPP_LOGGER_BUILD_DIR -DCMAKE_BUILD_TYPE=$BUILD_TYPE
echo "----- SCPPLogger CMake configuration done -----"

echo "----- Building SCPPLogger in $SCPP_LOGGER_BUILD_DIR -----"
cmake --build $SCPP_LOGGER_BUILD_DIR --config $BUILD_TYPE
echo "----- SCPPLogger build done -----"

echo "----- Installing SCPPLogger in $SCPP_LOGGER_BUILD_DIR -----"
cmake --install $SCPP_LOGGER_BUILD_DIR --config $BUILD_TYPE
echo "----- SCPPLogger installation done -----"

echo "----- Configuring CMake for SCPPLogger example for sources in $EXAMPLE_DIR and build in $EXAMPLE_BUILD_DIR -----"
cmake -S $EXAMPLE_DIR -B $EXAMPLE_BUILD_DIR -DCMAKE_BUILD_TYPE=$BUILD_TYPE
echo "----- SCPPLogger example's CMake configuration done -----"

echo "----- Building SCPPLogger example in $EXAMPLE_BUILD_DIR -----"
cmake --build $EXAMPLE_BUILD_DIR --config $BUILD_TYPE
echo "----- SCPPLogger example's build done -----"

echo "----- Installing SCPPLogger example in $EXAMPLE_BUILD_DIR -----"
cmake --install $EXAMPLE_BUILD_DIR --config $BUILD_TYPE
echo "----- SCPPLogger example's installation done -----"