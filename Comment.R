# Script name: Comment.R
# Created on: 1st Feb 2026
# Author: Karel Green
# Purpose: Echo user input
# Version: 1.0
# Execution: Must be run as source to await user input

# Request user input
name <- readline("Please enter your name:")

# Concatenate input and strings
greeting <- paste("Welcome", name)

# Output concatenated string
print(greeting)