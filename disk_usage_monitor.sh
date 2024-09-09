#!/bin/bash

# Set the threshold percentage , set to 40% in my case
THRESHOLD=40 

DISK_USAGE=$(df -h / | grep '/' | awk '{print $5}' | sed 's/%//g')
TO="recipient email1,recipient email2"
SUBJECT="Disk Space Daily Report at 5PM"
BODY="Halo! Nazim, Disk usage percentage: $DISK_USAGE"

echo "$BODY" | mutt -s "$SUBJECT" -- "$TO"

# Check if disk usage exceeds the threshold
if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    echo "Disk usage is above $THRESHOLD%. Current usage is $DISK_USAGE%."
    
	# Recipient email
TO="21052804@kiit.ac.in"
# Subject of the email
SUBJECT="Disk Space Alert"
# Body of the email
BODY="Disk usage on root (/) partition is critical!"

echo "$BODY" | mutt -s "$SUBJECT" -- "$TO"
    #desktop notification
    notify-send "Disk Space Alert" "Disk usage is above $THRESHOLD%. Current usage is $DISK_USAGE%."
else
    echo "Disk usage is under control: $DISK_USAGE% used."
fi

