#!/bin/bash

# RUN THIS IN A RHEL-9 INSTANCE

USER_ID=$(id -u)
TIMESTAMP=$(date )
LOGFILE="/tmp/TIMESTAMP-SCRIPTNAME.log"

CHECK_ROOT(){
    if [ $USER_ID -ne 0 ]
    then
        echo "Please run this script as root user"
        exit 1
    else
        echo "Root user verified"
    fi
}

# Note that we are not using exit status here, but passing as arguments
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2... FAILED"
        exit 1
    else
        echo "$2... SUCCESS"
}

dnf install mysql -y
VALIDATE $? "Installing MySQL"

dnf install git -y
VALIDATE $? "Installing Git"
