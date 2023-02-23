

# Script: Ops 201d6 Class 12 Ops Challenge Solution
# Author: Nicholas Loiacono
# Date: 02/21/2023
# Purpose: Use a Powershell script to return the IPv4 Address of the Computer.


# Main


# Define a variable to hold the name of the output file
$outputFile = "network_report.txt"

# Define a function to get the IPv4 address from a given input string
function Get-IPv4Address ($inputString) {
    $regex = '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}'  # Regular expression to match IPv4 addresses
    $ipAddress = Select-String -InputObject $inputString -Pattern $regex | Select-Object -ExpandProperty Matches | Select-Object -ExpandProperty Value
    return $ipAddress
}

# Run the ipconfig /all command and save the output to the output file
ipconfig /all | Out-File $outputFile

# Search the output file for IPv4 addresses using the Get-IPv4Address function
$ipv4Address = Get-IPv4Address (Get-Content $outputFile)

# Print the IPv4 address to the console
Write-Host "IPv4 Address: $ipv4Address"

# Remove the output file
Remove-Item $outputFile

# End