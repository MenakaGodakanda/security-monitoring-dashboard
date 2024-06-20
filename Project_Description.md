# Security Monitoring Dashboard - Version 1

This project demonstrates a web-based security monitoring dashboard using the ELK stack (Elasticsearch, Logstash, Kibana). The dashboard visualizes security metrics such as intrusion attempts, system vulnerabilities, and malware detections.

## Features of the project:

- **Log Aggregation**: Collect logs from multiple sources, including servers, network devices, applications, and security devices.
- **Log Processing and Filtering**: Use Logstash to filter, parse, and transform incoming log data for better analysis and indexing.
- **Centralized Storage**: Store logs centrally in Elasticsearch, providing a scalable and searchable repository for all security logs.
- **Real-Time Monitoring**: Enable real-time monitoring of security events through Kibana dashboards.
- **Data Visualization**: Create visualizations such as pie charts, bar charts, line charts, and tables to represent log data effectively.
- **Search and Query**: Use Elasticsearch's powerful search capabilities to query logs and find relevant security events.
- **Filtering and Drill-Down**: Apply filters in Kibana to drill down into specific types of security events, such as intrusion attempts or malware detections.
- **Dashboard Customization**: Customize dashboards to include various visualizations, making it easy to understand and analyze security metrics.
- **Historical Data Analysis**: Analyze historical log data to identify trends and patterns in security events.

## Coding Details:

Creating a Security Monitoring Dashboard using the ELK stack involves writing configuration files and scripts to set up and manage the data pipeline. Here is a detailed explanation of the coding and scripting involved in the project:

### Docker Compose Configuration:

Docker Compose simplifies the setup of the ELK stack by defining services for Elasticsearch, Logstash, and Kibana. The `docker-compose.yml` file is the core script for managing these services.

### Logstash Configuration:

Logstash configuration involves defining input, filter, and output plugins to process the logs. This is done in the `logstash.conf` file. This `logstash.conf` file sets up a basic pipeline for receiving, processing, and storing log data using the ELK stack (Elasticsearch, Logstash, Kibana).

#### Input Section:

- The input section specifies the source of the log data.
- `input { ... }`: This block defines where Logstash receives its input data.
- `beats { ... }`: This plugin allows Logstash to receive data from Beats (e.g., Filebeat, Metricbeat).
- `port => 5044`: Specifies that Logstash listens on port 5044 for incoming data from Beats.

#### Filter Section:

- The filter section processes and transforms the log data.
- `filter { ... }`: This block defines the processing and transformation steps for the incoming log data.
- `grok { ... }`: Grok is a powerful filter plugin that parses unstructured log data into structured data by matching it against predefined patterns.
- `match => { "message" => "%{COMBINEDAPACHELOG}" }`: This directive tells Grok to match the "message" field of the incoming logs using the `COMBINEDAPACHELOG` pattern. This pattern is commonly used for parsing Apache web server logs.
- `date { ... }`: The date filter is used to parse dates from fields and convert them into a Logstash-compatible timestamp format.
- `match => [ "timestamp" , "dd/MMM/yyyy:HH:mm:ss Z" ]`: This directive tells Logstash to match the "timestamp" field in the log data with the specified date format (`dd/MMM/yyyy:HH:mm:ss Z`). This ensures that the timestamp is correctly interpreted and stored.

#### Output Section:

- The output section specifies where the processed log data is sent.
- `output { ... }`: This block defines where Logstash sends the processed log data.
- `elasticsearch { ... }`: This plugin allows Logstash to send data to an Elasticsearch cluster.
- `hosts => ["http://elasticsearch:9200"]`: Specifies the address of the Elasticsearch instance (assumed to be running at `http://elasticsearch:9200`).
- `index => "logs-%{+YYYY.MM.dd}"`: Defines the name of the Elasticsearch index where the log data will be stored. The index name is dynamic and includes the current date (`YYYY.MM.dd`), which creates a new index for each day.
- `stdout { codec => rubydebug }`: This plugin outputs the processed log data to the standard output (console) in a human-readable format using the `rubydebug` codec. This is useful for debugging and verifying the log data processing.

### Filebeat Configuration:

Filebeat is an optional log shipper that can be used to forward logs to Logstash or directly to Elasticsearch. The configuration is done in the `filebeat.yml` file.

#### Inputs Section:

- Defines log file paths to be monitored by Filebeat (`/var/log/*.log`).

#### Output Section:

- Specifies Logstash as the output destination and its host.

### Data Generation Script:

The `generate_logs.sh` script is designed to generate a predefined set of log entries and append them to a specified log file. This is useful for creating a consistent sample data set for testing purposes. Here’s a detailed explanation of the script:

#### 1. Shebang Line:

- `#!/bin/bash`: This line specifies that the script should be run using the Bash shell.

#### 2. Log File Location:

- `LOG_FILE="/var/log/security.log"`: This variable defines the path to the log file where the generated log entries will be appended.

#### 3. Start Message:

-   echo "Generating log data..."  : This command prints a message to the terminal indicating that log data generation is starting.

#### 4. Loop to Generate Log Entries:

- `for i in {1..100}`: This loop runs 100 times, with the variable `i` taking values from 1 to 100.

Inside the loop:

##### Intrusion Attempt Log Entry:

- `echo "$(date '+%Y-%m-%d %H:%M:%S') Intrusion attempt detected from IP: 192.168.0.$i" >> $LOG_FILE`
- This command generates a log entry with the current date and time, indicating an intrusion attempt from an IP address (`192.168.0.$i` where `$i` is the loop variable). The entry is appended to the log file specified by `LOG_FILE`.

##### Vulnerability Found Log Entry:

- echo "$(date '+%Y-%m-%d %H:%M:%S') Vulnerability found in package xyz-$i" >> $LOG_FILE
- This command generates a log entry with the current date and time, indicating a vulnerability found in a package (xyz-$i where $i is the loop variable). The entry is appended to the log file.

##### Malware Detected Log Entry:

- `echo "$(date '+%Y-%m-%d %H:%M:%S') Malware detected in file /usr/bin/malware$i" >> $LOG_FILE`
- This command generates a log entry with the current date and time, indicating malware detected in a file (`/usr/bin/malware$i` where `$i` is the loop variable). The entry is appended to the log file.

##### Sleep Command:

- `sleep 1`
- This command pauses the script for 1 second before generating the next set of log entries. This introduces a delay, simulating the gradual generation of log data over time.

#### 5. Completion Message:

- `echo "Log data generation completed."`
- This command prints a message to the terminal indicating that the log data generation is complete.
