

# Script: Ops 201d6 Class 11 Ops Challenge Solution
# Author: Nicholas Loiacono
# Date: 02/20/2023
# Purpose: Automate the systems configuration of a new Windows 10 deployment.
# Resource: https://github.com/superswan/Powershell-SysAdmin


# Main


# Enable File and Printer Sharing on Windows Firewall
Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled True

# Enable File and Printer Sharing on the network adapter
Get-NetAdapter | Where-Object {$_.Name -like "*Ethernet*"} | Set-NetAdapterAdvancedProperty -DisplayName "File and Printer Sharing for Microsoft Networks" -DisplayValue "Enabled"

# Allow ICMP traffic in Windows Firewall
New-NetFirewallRule -DisplayName "ICMPv4" -Protocol ICMPv4

# Enable ICMP traffic on the network adapter
Get-NetAdapter | Where-Object {$_.Name -like "*Ethernet*"} | Set-NetAdapterAdvancedProperty -DisplayName "Allow ICMP responses" -DisplayValue "Enabled"

# Enable remote management in Windows Firewall
Enable-NetFirewallRule -DisplayGroup "Remote Management"

# Enable WinRM service for remote management
Enable-PSRemoting -Force

# Get a list of installed apps
$Apps = Get-AppxPackage | Select-Object Name, PackageFullName

# Define a list of bloatware apps to remove
$Bloatware = @(
    "Microsoft.3DBuilder",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.Messaging",
    "Microsoft.MicrosoftStickyNotes",
    "Microsoft.OneConnect",
    "Microsoft.People",
    "Microsoft.Print3D",
    "Microsoft.SkypeApp",
    "Microsoft.StorePurchaseApp",
    "Microsoft.Wallet",
    "Microsoft.WindowsAlarms",
    "Microsoft.WindowsCalculator",
    "Microsoft.WindowsCamera",
    "Microsoft.WindowsMaps",
    "Microsoft.WindowsPhone",
    "Microsoft.WindowsSoundRecorder",
    "Microsoft.XboxApp",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.XboxSpeechToTextOverlay",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo"
)

# Remove bloatware apps
foreach ($App in $Apps) {
    if ($Bloatware -contains $App.PackageFullName) {
        Write-Host "Removing $($App.Name)..."
        Remove-AppxPackage $App.PackageFullName -AllUsers
    }
}

# Enable Hyper-V feature
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# Restart computer to apply changes
Restart-Computer -Force

# Disable SMBv1 on the current computer
Set-SmbServerConfiguration -EnableSMB1Protocol $false
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" SMB1 -Type DWORD -Value 0 -Force
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\mrxsmb10" Start -Type DWORD -Value 4 -Force

# Disable SMBv1 on remote computers
Invoke-Command -ComputerName <computername> -ScriptBlock {
    Set-SmbServerConfiguration -EnableSMB1Protocol $false
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" SMB1 -Type DWORD -Value 0 -Force
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\mrxsmb10" Start -Type DWORD -Value 4 -Force
}

# End