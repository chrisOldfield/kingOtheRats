# kingOtheRats

# Script Documentation

## PowerShell Script

This PowerShell script performs the following actions:

1. **Creates a System Restore Point:** A restore point is created at the beginning to allow system rollback.
2. **Lists Network Adapters:** Displays the network adapters available on the system.
3. **Windows Update Check and Installation:** Checks for available Windows updates and installs them. User is prompted to continue or skip this step.
4. **Disables Network Sharing Settings:** Modifies firewall rules to disable inbound sharing settings not essential to core functionalities. User is prompted to continue or skip.

At each significant step, the user is prompted to either continue with the next action or end the script.

## Linux Script

The Linux script performs the following actions:

1. **Lists Network Interfaces:** Outputs the available network interfaces.
2. **System Update:** Updates system packages using the package manager. User is prompted to continue or skip this step.
3. **Modifies Firewall Settings:** Applies firewall rules to disable SMB sharing. User is prompted to continue or skip.

The user is prompted at each step to either proceed with the action or skip to the next step or end the script execution.

### Note

The specified operations, especially updates and firewall settings modifications, should be performed with an understanding of their impact on the system.
