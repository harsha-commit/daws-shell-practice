#!/bin/bash

# RUN THIS IN A RHEL-9 INSTANCE

# Install package, store logs, use functions

USER_ID=$(id -u)
TIMESTAMP=$(date +"%F-%H-%M-%S")
SCRIPTNAME=$(echo $0 | cut -d '.' -f 1)
LOGFILE="/tmp/$TIMESTAMP-$SCRIPTNAME.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[0m"

PACKAGES=[ "git" "mysql" "docker" ]

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
        echo "$2...$R FAILED$W"
        exit 1
    else
        echo "$2...$G SUCCESS$W"
}

# Looping arguments
for 

dnf install mysql -y &>> $LOGFILE
VALIDATE $? "Installing MySQL"
 
dnf install git -y &>> $LOGFILE
VALIDATE $? "Installing Git"
