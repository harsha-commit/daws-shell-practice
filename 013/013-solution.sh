#!/bin/bash

# Update 010-solution.sh using outsourcing
# Improve expense-project using outsourcing

chmod 700 ./010-solution.sh
chmod 700 ./utility.sh

source ./utility.sh

echo "Packages to install: ${PACKAGES[@]}"
    for i in ${PACKAGES[@]}
    do
        dnf list installed $i &>> $LOGFILE
        if [ $? -ne 0 ]
        then
            dnf install $i -y &>> $LOGFILE
            VALIDATE $? "Installing $i"
        else
            echo -e "$i already installed...$Y SKIPPING$W"
        fi
    done