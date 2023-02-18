# Print all active processes ordered by highest CPU time consumption at the top
Get-Process | Sort-Object -Descending CPU | Format-Table Name, CPU -AutoSize

# Print all active processes ordered by highest Process Identification Number at the top
Get-Process | Sort-Object -Descending Id | Format-Table Name, Id -AutoSize

# Print the top five active processes ordered by highest Working Set (WS(K)) at the top
Get-Process | Sort-Object -Descending WorkingSet | Select-Object -First 5 | Format-Table Name, WorkingSet -AutoSize

# Start the process Internet Explorer (iexplore.exe) and have it open https://owasp.org/www-project-top-ten/
Start-Process iexplore.exe "https://owasp.org/www-project-top-ten/"

# Start the process Internet Explorer (iexplore.exe) ten times using a for loop. Have each instance open https://owasp.org/www-project-top-ten/
for ($i=1; $i -le 10; $i++) {
    Start-Process iexplore.exe "https://owasp.org/www-project-top-ten/"
}

# Close all Internet Explorer windows
Get-Process iexplore | Foreach-Object { $_.CloseMainWindow() }

# Kill a process by its Process Identification Number. Choose a process whose termination won’t destabilize the system, such as Internet Explorer or MS Edge.
Stop-Process -Id [process id here]