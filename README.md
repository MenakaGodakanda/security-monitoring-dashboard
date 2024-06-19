# Security Monitoring Dashboard

This project demonstrates a web-based security monitoring dashboard using the ELK stack (Elasticsearch, Logstash, Kibana). The dashboard visualizes security metrics such as intrusion attempts, system vulnerabilities, and malware detections.

## Overview

<img width="1250" alt="Screenshot 2024-06-19 at 3 15 30 PM" src="https://github.com/MenakaGodakanda/security-monitoring-dashboard/assets/156875412/c7038c35-55f4-4e6e-be8e-a22396c90bd8">
<br><br>

### Detailed Components

1. **Bash**
  - generate_logs.sh: Generate various types of logs like system logs, security logs, access logs, etc.

2. **Logstash**
  - Input Plugins: Collect logs from different sources (e.g., file, syslog, beats).
  - Filters: Parse and transform logs (e.g., grok, mutate).
  - Output Plugins: Send processed logs to Elasticsearch.

3. **Elasticsearch**
  - Indexing: Stores the logs in indices.
  - Search and Analysis: Provides powerful search capabilities to query the logs.

4. **Kibana**
  - Visualizations: Create visualizations like pie charts, bar charts, and line charts.
  - Dashboards: Combine multiple visualizations into comprehensive dashboards.
  - Filters & Queries: Apply filters and run queries to refine and explore log data.

## Features

- **Log Aggregation**: Collect logs from multiple sources, including servers, network devices, applications, and security devices.
- **Log Processing and Filtering**: Use Logstash to filter, parse, and transform incoming log data for better analysis and indexing.
- **Centralized Storage**: Store logs centrally in Elasticsearch, providing a scalable and searchable repository for all security logs.
- **Real-Time Monitoring**: Enable real-time monitoring of security events through Kibana dashboards.
- **Data Visualization**: Create visualizations such as pie charts, bar charts, line charts, and tables to represent log data effectively.
- **Search and Query**: Use Elasticsearch's powerful search capabilities to query logs and find relevant security events.
- **Filtering and Drill-Down**: Apply filters in Kibana to drill down into specific types of security events, such as intrusion attempts or malware detections.
- **Dashboard Customization**: Customize dashboards to include various visualizations, making it easy to understand and analyze security metrics.
- **Historical Data Analysis**: Analyze historical log data to identify trends and patterns in security events.

## Prerequisites
- Ubuntu 22.04 LTS
- Docker and Docker Compose
- Git

## Setup

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/MenakaGodakanda/security-monitoring-dashboard.git
   cd security-monitoring-dashboard
   ```

2. **Start the ELK Stack:**
   ```bash
   docker-compose up -d
   ```

3. **Generate Test Logs:**
   ```bash
   chmod +x generate_logs.sh
   sudo ./generate_logs.sh
   ```

4. **Configure Kibana:**
   - Navigate to http://localhost:5601
   - Create index pattern logs-*
   - Create visualizations and dashboard

## Directory Structure:

Here’s how your project directory structure should look after setting up the necessary files:
```
security-monitoring-dashboard/
├── docker-compose.yml          # Docker Compose file to set up ELK stack.
├── logstash/
│   └── pipeline/
│       └── logstash.conf       # Logstash pipeline configuration.
├── filebeat.yml                # Filebeat configuration for log shipping.
├── generate_logs.sh            # Script to generate sample log data.
└── README.md
```

## Usage

- Access Kibana at http://localhost:5601
- View the dashboard to monitor security metrics.

## License

This project is licensed under the MIT License.



   
