#!/bin/sh

# Uninstallation using MacUninstaller with Dialog showing end of process

item="xquartz" # enter the software to uninstall
# Examples: adobecreativeclouddesktop, canva, cyberduck, handbrake, inkscape, textmate, vlc

# PATH declaration
export PATH=/usr/bin:/bin:/usr/sbin:/sbin

#remove status file
Installed_file="/usr/local/Installomator/installed/${item}"
if [ -e "$Installed_file" ]; then 
    rm "$Installed_file"
else
    echo "uninstaller ran minimum 1 time, so exit."
    exit
fi

pkgutil --forget com.github.payload_free.${item}


getCustomMacUninstaller () {
    # Ensure the target directory exists
    mkdir -p /usr/local/Installomator

    if ! curl -L -# --show-error 'https://github.com/TRIMDMSupport/uninstaller/releases/download/1.0/uninstaller.sh' -o '/usr/local/Installomator/uninstaller.sh' ; then
            echo "ERROR: Cannot download uninstaller script."
    else
        chmod 755 /usr/local/Installomator/uninstaller.sh
    fi
}

# Check the currently logged in user
currentUser=$(stat -f "%Su" /dev/console)
if [ -z "$currentUser" ] || [ "$currentUser" = "loginwindow" ] || [ "$currentUser" = "_mbsetupuser" ] || [ "$currentUser" = "root" ]; then
    echo "ERROR. Logged in user is $currentUser! Cannot proceed."
    exit 97
fi
# Get the current user's UID for dockutil
uid=$(id -u "$currentUser")
# Find the home folder of the user
userHome="$(dscl . -read /users/${currentUser} NFSHomeDirectory | awk '{print $2}')"

# Download custom version of uninstaller.sh
getCustomMacUninstaller

# Verify that MacUninstaller has been installed
destFile="/usr/local/Installomator/uninstaller.sh"
if [ ! -e "${destFile}" ]; then
    echo "Uninstaller not found here:"
    echo "${destFile}"
    echo "Exiting."
    exit 99
fi

# No sleeping
/usr/bin/caffeinate -d -i -m -u &
caffeinatepid=$!
caffexit () {
    kill "$caffeinatepid"
    exit $1
}

# Uninstall software using MacUninstaller
cmdOutput="$(${destFile} ${item} || true)"

caffexit $exitStatus
