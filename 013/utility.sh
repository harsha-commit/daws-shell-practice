#!/bin/bash

# Improving utility.sh by using set and trap
set -e
trap 'failure ${LINE_NO} "$BASH_COMMAND"' ERR

USER_ID=$(id -u)
TIMESTAMP=$(date +"%F-%H-%M-%S")
SCRIPTNAME=$(echo $0 | cut -d '.' -f 1)
LOGFILE="/tmp/$TIMESTAMP-$SCRIPTNAME.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[0m"

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
        echo -e "$2...$R FAILED$W"
        exit 1
    else
        echo -e "$2...$G SUCCESS$W"
    fi
}

INSTALL_PACKAGES(){
    for i in $@
    do
        dnf list installed $i &>> $LOGFILE
        if [ $? -ne 0 ]
        then
            dnf install $i -y &>> $LOGFILE
            # VALIDATE $? "Installing $i"
        else
            echo -e "$i already installed...$Y SKIPPING$W"
        fi
    done
}