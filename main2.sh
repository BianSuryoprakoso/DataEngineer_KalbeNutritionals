#!/bin/bash

path="/hdfs/data/data1"
name_of_directory="data1"
filename_excel="daily_market_price.xlsx"
source_dir="/local/data/market"
target_dir="$path/$name_of_directory"

# Check if the directory exists
if [ -d "$target_dir" ]; then
    echo "There is $name_of_directory Directory Exists!"
else
    echo "$name_of_directory Directory Not Exists!"
    mkdir -p "$target_dir"
    echo "Created $name_of_directory directory."
fi

# Copy file from source directory to target directory
cp "$source_dir/$filename_excel" "$target_dir/$filename_excel"

# Create conditions if the copy successful
if [ $? -eq 0 ]; then
    echo "File copied successfully."
    
    # Create success message
    log_content="File Moved Successfully"
    echo "$log_content" > "$target_dir/log.txt"
else
    echo "File copy failed."
fi

# Create a crontab
cron_command="/path/to/your/script.sh" 
cron_schedule="0 7 * * *" # crontab syntax to run the script at 07:00 AM Daily

# Add the crontab entry
(crontab -l ; echo "$cron_schedule $cron_command") | crontab -
echo "Crontab entry added: $cron_schedule $cron_command"