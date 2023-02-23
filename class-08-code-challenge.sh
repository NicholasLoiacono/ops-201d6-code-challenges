#!/bin/bash

# Script: Ops 201d6 Class 08 Ops Challenge Solution
# Author: Nicholas Loiacono
# Date: 02/15/2023
# Purpose: Automate a copy operation.


# Main

@echo off

set source=%userprofile%\Desktop\work
set destination=D:\backup

if not exist "%destination%" (
  mkdir "%destination%"
)

robocopy "%source%" "%destination%" /E /LOG+:D:\backup\backup.log

# End

