#!/bin/bash
echo "=== System Information ==="
echo "Name of the computer:"
sudo lshw -short | grep system | awk '{print $2}'
echo " "
echo "=== CPU Information ==="
sudo lshw -short | grep processor | awk '{print "Product: "$3, "Vendor: "$4, "Physical ID: "$5, "Bus info: "$6, "Width: "$7}'
echo " "
echo "=== RAM Information ==="
sudo lshw -short | grep memory | awk '{print "Description: "$3, "Physical ID: "$4, "Size: "$5}'
echo " "
echo "=== Display Adapter Information ==="
sudo lshw -short | grep display | awk '{print "Description: "$3, "Product: "$4, "Vendor: "$5, "Physical ID: "$6, "Bus info: "$7, "Width: "$8, "Clock: "$9, "Capabilities: "$10, "Configuration: "$11, "Resources: "$12}'
echo " "
echo "=== Network Adapter Information ==="
sudo lshw -short | grep network | awk '{print "Description: "$3, "Product: "$4, "Vendor: "$5, "Physical ID: "$6, "Bus info: "$7, "Logical name: "$8, "Version: "$9, "Serial: "$10, "Size: "$11, "Capacity: "$12, "Width: "$13, "Clock: "$14, "Capabilities: "$15, "Configuration: "$16, "Resources: "$17}'