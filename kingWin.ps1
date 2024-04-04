# Create a System Restore Point
CheckPoint-Computer -Description "Pre-Script System Restore Point" -RestorePointType "MODIFY_SETTINGS"

# List Network Adapters
$adapters = Get-NetAdapter | Select-Object -Property Name, InterfaceDescription, ifIndex
$adapters | Format-Table -AutoSize

# User selects Network Adapter
$selectedAdapterIndex = Read-Host "Enter the ifIndex of your default device"
$selectedAdapter = $adapters | Where-Object {$_.ifIndex -eq $selectedAdapterIndex}
Write-Host "Selected Adapter: $($selectedAdapter.Name)"

# Confirm to proceed with Update Check
$continue = Read-Host "Proceed with Windows Update Check? (Y/N)"
if ($continue -eq "Y") {
    # Check and Install Windows Updates
    Install-Module -Name PSWindowsUpdate -Force -Confirm:$false
    Import-Module -Name PSWindowsUpdate
    Get-WindowsUpdate
    Install-WindowsUpdate -AcceptAll -IgnoreReboot
} else {
    Write-Host "Update check skipped."
}

# Confirm to proceed with Disabling Network Sharing Settings
$continue = Read-Host "Proceed with disabling Network Sharing Settings? (Y/N)"
if ($continue -eq "Y") {
    # Disable Network Sharing Settings
    Get-NetFirewallRule -Direction Inbound | Where-Object {$_.DisplayName -like "*sharing*"} | Set-NetFirewallRule -Enabled False
    Write-Host "Network Sharing settings disabled."
} else {
    Write-Host "Network Sharing settings modification skipped."
}

Write-Host "Script execution complete."
