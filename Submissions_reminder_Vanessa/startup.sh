#!/usr/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# Collect variables from config
CONFIG_DIR="$SCRIPT_DIR/config"
if [ -f "$CONFIG_DIR/config.env" ]; then
    source "$CONFIG_DIR/config.env"
else
    echo "Error: $CONFIG_DIR/config.env not found!"
    exit 1
fi

# Check if ASSIGNMENT is set
if [ -z "$ASSIGNMENT" ]; then
    echo "Error: ASSIGNMENT is not set in $CONFIG_DIR/config.env"
    exit 1
fi

echo "Starting submission status check for assignment: $ASSIGNMENT"
sleep 2
echo "Checking submissions for assignment: $ASSIGNMENT ..."
sleep 1
echo "Submission check complete."
echo "Starting Submission Reminder App"

# Run the reminder script
"$SCRIPT_DIR/app/reminder.sh"
