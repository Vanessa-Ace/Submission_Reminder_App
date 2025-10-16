#!/bin/bash
# Prompt user for directory
read -p "Enter the submission directory: Submission_remider_ " parent_dir

# Checking if the directory exists
if [ ! -d "$parent_dir" ]; then
	echo "Directory '$parent_dir' does not exist"
	exit 1
fi

echo "Using directory: $parent_dir"

# A path for config file
CONFIG_FILE="./Submission_reminder_*/config/config.env"
stup="startup.sh"
continuation="y"
assignment_name=""

copilot_function() {
	local assignment="$1"

	# Update the assignment variable in config.env
	sed -i "s/ASSIGNMENT=\".*\"/ASSIGNMENT=\"$assignment\"/" "CONFIG_FILE"
	echo "Processing '$assignment' assignment"

	# Navigate through directory
	cd "$parent_dir" || { echo "Failed to enter directory"; exit 1; }

	#Checking if the startup.sh exists
	if [ ! -f "$stup" ]; then
		echo "Error : $stup not found."
		cd ..
		exit 1
	else
		./"$stup"
		cd ..
	fi
}

while [[ "$continuation" == "y" ]]; do
	echo
	echo "Which assignment do you want to check?"
	echo "Example options(Shell Navigation, Shell Basics, Git)"
	echo

	read -p "Enter the assignment name: " assignment_name

	copilot_function "$assignment_name"

	echo
	read -p "Do you want to continue (y/n): "
	continuation
	continuation=$(echo "$continuation" | tr '[:upper:]' '[:lower:]')
done

echo "Exiting"


