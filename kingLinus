#!/bin/bash

# List Network Interfaces
ip link show
echo "Please enter the interface name (e.g., eth0):"
read INTERFACE_NAME
echo "Selected interface: $INTERFACE_NAME"

# Confirm to proceed with System Update
echo "Proceed with system update? (Y/N)"
read CONTINUE
if [[ $CONTINUE == "Y" ]]; then
    # Update System Packages
    echo "Updating system packages..."
    sudo apt update && sudo apt upgrade -y
else
    echo "System update skipped."
fi

# Confirm to proceed with Modifying Firewall Settings
echo "Proceed with modifying firewall settings? (Y/N)"
read CONTINUE
if [[ $CONTINUE == "Y" ]]; then
    # Modify Firewall Settings
    echo "Disabling SMB sharing..."
    sudo ufw deny from any to any port 445 comment 'SMB sharing disabled'
else
    echo "Firewall settings modification skipped."
fi

echo "Script execution complete."
