
#!/bin/bash

# Source environment variables from config
CONFIG_DIR="$(dirname "$0")/../config"
source "$CONFIG_DIR/config.env"
source "$(dirname "$0")/../modules/functions.sh"

# Path to the submissions file
submissions_file="$(dirname "$0")/../assets/submissions.txt"

# Print assignment info
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions "$submissions_file"
