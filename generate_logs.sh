#!/bin/bash

LOG_FILE="/var/log/security.log"

echo "Generating log data..."

for i in {1..100}
do
  # Simulate different types of log entries
  echo "$(date '+%Y-%m-%d %H:%M:%S') Intrusion attempt detected from IP: 192.168.0.$i" >> $LOG_FILE
  echo "$(date '+%Y-%m-%d %H:%M:%S') Vulnerability found in package xyz-$i" >> $LOG_FILE
  echo "$(date '+%Y-%m-%d %H:%M:%S') Malware detected in file /usr/bin/malware$i" >> $LOG_FILE
  sleep 1
done

echo "Log data generation completed."
