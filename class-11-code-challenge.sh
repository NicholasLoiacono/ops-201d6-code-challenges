

# Script: Ops 201d6 Class 11 Ops Challenge Solution
# Author: Nicholas Loiacono
# Date: 02/20/2023
# Purpose: Automate the systems configuration of a new Windows 10 deployment.
# Resource: https://github.com/superswan/Powershell-SysAdmin


# Main


# Enable File and Printer Sharing
Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled True

# Allow ICMP traffic
New-NetFirewallRule -DisplayName "ICMPv4" -Protocol ICMPv4 -IcmpType 8 -Enabled True

# Enable Remote management
Enable-PSRemoting -Force

# Remove bloatware
Get-AppxPackage | Where-Object {$_.Name -notlike "*store*" -and $_.Name -notlike "*calculator*"} | Remove-AppxPackage

# Enable Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# Disable SMBv1, an insecure protocol
Set-SmbServerConfiguration -EnableSMB1Protocol $false
Set-SmbClientConfiguration -EnableSMB1Protocol $false

# Test and validate desired outcomes
# Test File and Printer Sharing
if ((Get-NetFirewallRule -DisplayGroup "File and Printer Sharing").Enabled) {
    Write-Host "File and Printer Sharing is enabled"
} else {
    Write-Host "File and Printer Sharing is not enabled"
}

# Test ICMP traffic
if ((Get-NetFirewallRule -DisplayName "ICMPv4").Enabled) {
    Write-Host "ICMP traffic is allowed"
} else {
    Write-Host "ICMP traffic is not allowed"
}

# Test Remote management
if ((Get-Service WinRM).Status -eq "Running") {
    Write-Host "Remote management is enabled"
} else {
    Write-Host "Remote management is not enabled"
}

# Test bloatware removal
if ((Get-AppxPackage | Where-Object {$_.Name -notlike "*store*" -and $_.Name -notlike "*calculator*"}).Count -eq 0) {
    Write-Host "Bloatware has been removed"
} else {
    Write-Host "Bloatware has not been removed"
}

# Test Hyper-V
if ((Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V).State -eq "Enabled") {
    Write-Host "Hyper-V is enabled"
} else {
    Write-Host "Hyper-V is not enabled"
}

# Test SMBv1 disablement
if ((Get-SmbServerConfiguration).EnableSMB1Protocol -eq $false -and (Get-SmbClientConfiguration).EnableSMB1Protocol -eq $false) {
    Write-Host "SMBv1 has been disabled"
} else {
    Write-Host "SMBv1 has not been disabled"
}

# End