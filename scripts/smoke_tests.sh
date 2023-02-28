#!/bin/bash

SCRIPTS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPO_DIR=$SCRIPTS_DIR/..
EXAMPLE_APP_BIN_DIR=$REPO_DIR/example/build

echo "----- Running example application -----"
LD_LIBRARY_PATH=$EXAMPLE_APP_BIN_DIR $EXAMPLE_APP_BIN_DIR/SCPPLoggerExample
echo "----- Running example application done -----"