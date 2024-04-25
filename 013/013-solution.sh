#!/bin/bash

# Update 010-solution.sh using outsourcing
# Improve expense-project using outsourcing

chmod 700 ./010-solution.sh
chmod 700 ./utility.sh

source ./utility.sh


dnf list installed $i &>> $LOGFILE
if [ $? -ne 0 ]
then
    dnf install mysql -y &>> $LOGFILE
else
    echo -e "mysql already installed...$Y SKIPPING$W"
fi