#!/bin/bash

path="/hdfs/data/data1"
name_of_directory="data1"

# Check if the directory exists
if [ -d "$path/$name_of_directory" ]; then
    echo "There is $name_of_directory Directory Exists!"
else
    echo "$name_of_directory Directory Not Exists!"
    mkdir -p "$path/$name_of_directory"
    echo "Created $name_of_directory directory."
fi

# Create a crontab
cron_command="/path/to/your/script.sh"
cron_schedule="0 7 * * *" # crontab syntax to run the script at 07:00 AM Daily

# Add the crontab
(crontab -l ; echo "$cron_schedule $cron_command") | crontab -
echo "Crontab entry added: $cron_schedule $cron_command"