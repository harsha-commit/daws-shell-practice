#!/bin/bash

# Update 010-solution.sh using outsourcing

chmod 700 ./010-solution.sh
chmod 700 ./utility.sh

source ./utility.sh

CHECK_ROOT
INSTALL_PACKAGES $@