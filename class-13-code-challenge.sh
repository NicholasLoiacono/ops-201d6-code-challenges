

# Script: Ops 201d6 Class 13 Ops Challenge Solution
# Author: Nicholas Loiacono
# Date: 02/22/2023
# Purpose: Create a script that asks a user to type a domain, then displays information about the typed domain.


# Main

# Define a function to perform the domain name lookup
perform_lookup() {
  # Take user input for the domain name
  read -p "Enter domain name: " domain_name

  # Run whois against the domain name and output to file
  whois $domain_name >> domain_info.txt

  # Run dig against the domain name and output to file
  dig $domain_name >> domain_info.txt

  # Run host against the domain name and output to file
  host $domain_name >> domain_info.txt

  # Run nslookup against the domain name and output to file
  nslookup $domain_name >> domain_info.txt

  # Open the output file with the default text editor
  xdg-open domain_info.txt
}

# Define a function to display the menu options
display_menu() {
  echo "Select an option:"
  echo "1. List files in current directory"
  echo "2. Display current date and time"
  echo "3. Display calendar"
  echo "4. Print working directory"
  echo "5. Show system information"
  echo "6. Perform domain name lookup"
}

# Take user input for the menu selection
read -p "Enter selection: " choice

# Use a case statement to run the appropriate command based on user input
case $choice in
  1) ls ;;
  2) date ;;
  3) cal ;;
  4) pwd ;;
  5) uname -a ;;
  6) perform_lookup ;;
  *) echo "Invalid selection" ;;
esac

# End