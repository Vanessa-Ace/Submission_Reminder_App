#!/usr/bin/bash
# Creates an app that reminds students about pending submissions

# ask for user input and make a directory
read -p "Enter your name: " name
mkdir -p "Submissions_reminder_$name"

# Set parent directory
parent_dir="Submissions_reminder_$name"

# Create subdirectories
mkdir -p "$parent_dir/app"
mkdir -p "$parent_dir/modules"
mkdir -p "$parent_dir/assets"
mkdir -p "$parent_dir/config"

# Create the config file
cat > "$parent_dir/config/config.env" <<EOL
# Configuration variables
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL

# Create the reminder script inside app
cat > "$parent_dir/app/reminder.sh" <<'EOL'

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
EOL

# Create functions.sh inside modules
cat > "$parent_dir/modules/functions.sh" <<'EOL'
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
EOL

# Create submissions.txt
cat > "$parent_dir/assets/submissions.txt" <<EOL
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Honnete, Git, submitted
Emna, Shell Navigation, submitted
Papa, Git, not submitted
Alice, Git, submitted
Emmanule, Shell Navigation, not submitted
Raissa, Shell Basics, not submitted
Hugue, Shell Basics, not submitted
EOL

# Create the startup script
cat > "$parent_dir/startup.sh" <<'EOL'
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
EOL

# Make scripts executable
chmod +x "$parent_dir/app/reminder.sh"
chmod +x "$parent_dir/modules/functions.sh"
chmod +x "$parent_dir/startup.sh"

