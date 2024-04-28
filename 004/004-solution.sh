#!/bin/bash

# Changing to Password Authentication
sudo su
vim /etc/ssh/sshd_config # Update to PasswordAuthentication yes
systemctl restart sshd
# Verify by ssh <USER_NAME>@<EC2_IP>

### PACKAGE MANAGEMENT ###

# Check for packages that can update candidates
dnf check-update

# Install all updated candidates
dnf update -y

# Install updated candidate for a package
dnf update nodejs -y

# List packages installed via package manager
dnf list installed

# Check if a package is installed or not
dnf list installed nginx

# List all currently available packages
dnf list all

# Check if a package is available or not
dnf list all nginx

# List grouped packages
dnf group list

# Print detailed information of all packages
dnf info

# Print detailed information about a package
dnf info nodejs

# Search package descriptions and names
dnf search nodejs

# Install a package
dnf install nodejs -y

# Installs a local rpm package
dnf localinstall <RRM_FILE>

# Remove a package
dnf remove nodejs -y

# Clean /var/cache/<PACKAGE_MANAGER> to free disk-space
dnf clean all

# Print the help file for <PACKAGE_MANAGER>
man dnf
