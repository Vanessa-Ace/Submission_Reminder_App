#!/bin/bash

# Function to check submissions
function check_submissions {
    local submissions_file="$1"
    echo "Checking submissions in $submissions_file"

    # Skip header and read each line
    tail -n +2 "$submissions_file" | while IFS=, read -r student assignment status; do
        # Trim whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check for matching assignment and not submitted
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done
}
