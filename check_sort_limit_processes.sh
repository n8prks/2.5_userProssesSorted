#!/bin/bash

# Get the current user from the USER environment variable
current_user=$USER

# Use ps aux to list all processes and grep for the current user
user_processes=$(ps aux | grep "^$current_user")

# Print the processes to the console
echo "Processes for user $current_user:"
echo "$user_processes"

# Ask the user for input to choose the sorting criterion
read -p "Sort processes by (m)emory or (c)pu consumption? " sort_option

# Check the user input and sort accordingly
case $sort_option in
    m)
        sorted_processes=$(echo "$user_processes" | sort -nk4)
        echo "Processes sorted by memory consumption:"
        ;;
    c)
        sorted_processes=$(echo "$user_processes" | sort -nk3)
        echo "Processes sorted by CPU consumption:"
        ;;
    *)
        echo "Invalid option. No sorting applied."
        exit 1
        ;;
esac

# Ask the user for input on how many processes to print
read -p "Enter the number of processes to print: " num_processes

# Use head to limit the number of processes printed
echo "$sorted_processes" | head -n "$num_processes"
