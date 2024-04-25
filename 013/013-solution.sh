#!/bin/bash

set -e

failure(){
    echo "File: $0"
    echo "Error at Line no: $LINENO"
    echo "Error caused by: $BASH_COMMAND"
}

trap 'failure' ERR

# Update 010-solution.sh using outsourcing
# Improve expense-project using outsourcing

chmod 700 ./010-solution.sh
chmod 700 ./utility.sh

source ./utility.sh

CHECK_ROOT
INSTALL_PACKAGES $@