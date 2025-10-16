Submission Reminder App
Overview

The Submission Reminder App is a simple Linux-based application designed to alert students about upcoming or missed assignment deadlines.
It automates environment setup, manages assignment records, and provides reminders using shell scripting.

This project demonstrates key Linux and shell scripting concepts such as:

File and directory automation

Environmental configuration

Script execution permissions

Basic text processing using tools like sed

Features

Automated Environment Setup — Creates all necessary directories and files for the app.

Student Reminder System — Reads submission records and displays students who need to be reminded.

Dynamic Assignment Updates — Let users change the current assignment name interactively.

Executable Management — Automatically sets execution permissions for all .sh files.

Directory Structure

submission_reminder_{yourName}/
│
├── config/
│   └── config.env
│
├── data/
│   └── submissions.txt
│
├── scripts/
│   ├── reminder.sh
│   ├── functions.sh
│   └── startup.sh
│
├── assets/
│   └── image.png
│
└── create_environment.sh
How to Use
1. Clone Repository
2. Run: chmod +x create_environment.sh and execute ./create_environment.sh
3. Follow the instructions to create your environment
4. Test the App by running: ./submission_reminder_{yourName}/startup.sh
5. To check for a specific assignment run: ./copilot_shell_script.sh

Workflow example
<img width="957" height="682" alt="image" src="https://github.com/user-attachments/assets/978b4877-c62e-44e3-b815-25ac9df8d501" />
<img width="949" height="936" alt="image" src="https://github.com/user-attachments/assets/c680e1e8-2a04-4504-8517-da3691ff4f6f" />

