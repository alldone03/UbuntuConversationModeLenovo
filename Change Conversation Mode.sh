
#!/bin/bash

# Function to toggle the value
toggle_value() {
    if [ "$1" -eq 0 ]; then
        echo 1
    else
        echo 0
    fi
}

# Read the first line from the file
line=$(head -n 1 /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode)

# Check if the line is not empty
if [ -n "$line" ]; then
    # Convert the line to an integer for comparison
    value=$(($line))

    # Toggle the value
    new_value=$(toggle_value "$value")

    # Output the new value
    echo "Conversation Mode is $line"
    echo "Conversation Mode changed to $new_value"

    # Write the new value back to the file
    echo "$new_value" | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode >/dev/null
else
    echo "File is empty or does not exist."
fi

