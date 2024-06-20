# Security Monitoring Dashboard

This project demonstrates a web-based security monitoring dashboard using the ELK stack (Elasticsearch, Logstash, Kibana). The dashboard visualizes security metrics such as intrusion attempts, system vulnerabilities, and malware detections.

<a href="https://github.com/MenakaGodakanda/security-monitoring-dashboard/blob/main/Project_Description.md">Project Description</a>

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

## Prerequisites
- Ubuntu 22.04 LTS
- Docker and Docker Compose
- Git
- Filebeat

## Set Up the Environment

### Install Docker and Docker Compose

#### Installation
```bash
sudo apt update
sudo apt install -y docker.io docker-compose
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
```

#### Restart the System
You need to log out and log back in for the changes to take effect. Alternatively, you can use the newgrp command:
```bash
newgrp docker
```

#### Verify Docker Setup
After logging back in, verify that your user has the correct permissions by running a Docker command without sudo.

Check Docker version:

```bash
docker --version
```

Run a simple Docker command:

```bash
docker run hello-world
```

#### Additional Checks

If you still encounter issues, ensure that the Docker service is running.

Check Docker service status:

```bash
sudo systemctl status docker
```

Start Docker service if it's not running:

```bash
sudo systemctl start docker
```

### Download and Install Filebeat

#### Install Filebeat
```
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.17.0-amd64.deb
sudo dpkg -i filebeat-7.17.0-amd64.deb
sudo cp filebeat.yml /etc/filebeat/filebeat.yml
```

#### Start Filebeat
```bash
sudo systemctl start filebeat
sudo systemctl enable filebeat
```
#### Verify Filebeat is Running
Ensure Filebeat is properly configured and running to ship the generated logs to Logstash.

```bash
sudo systemctl restart filebeat
sudo systemctl status filebeat
```

## Setup

### Clone the Repository:
   ```bash
   git clone https://github.com/MenakaGodakanda/security-monitoring-dashboard.git
   cd security-monitoring-dashboard
   ```

### Start the ELK Stack:

- Run Docker Compose
   ```bash
   docker-compose up -d
   ```
<br>

  ![Screenshot 2024-06-19 124452](https://github.com/MenakaGodakanda/security-monitoring-dashboard/assets/156875412/a8346283-4496-4c5c-be1f-4b82d2d2d45e)
<br><br>

- Verify Kibana is Running
      Open your browser and navigate to `http://localhost:5601`
<br>

  ![Screenshot 2024-06-19 125401](https://github.com/MenakaGodakanda/security-monitoring-dashboard/assets/156875412/91b90d43-11ca-4032-8a7b-88c4bc49594d)
<br><br>

### Generate Test Logs:
The `generate_logs.sh` script will generate log data that simulates intrusion attempts, system vulnerabilities, and malware detections.
Run the script:
   ```bash
   chmod +x generate_logs.sh
   sudo ./generate_logs.sh
   ```
<br>

  ![Screenshot 2024-06-19 125342](https://github.com/MenakaGodakanda/security-monitoring-dashboard/assets/156875412/035beef8-1fa5-4d2f-b2e1-59419b81545a)
<br>

### Ingest Data into the ELK Stack
Verify Filebeat is Running
Ensure Filebeat is properly configured and running to ship the generated logs to Logstash.
```bash
sudo systemctl restart filebeat
sudo systemctl status filebeat
```

### Access Kibana Dashboard:

#### Open Kibana in Your Browser
- Navigate to `http://localhost:5601`.

#### Create Index Pattern
- Go to `Management` > `Index Patterns`.
- Create a new index pattern (e.g., `logs-*`).
- Configure the index pattern to use the timestamp field.

### Create Visualizations in Kibana

#### Intrusion Attempts Visualization:
- Go to `Visualize`.
- Create a new `Vertical Bar` chart.
- Select `logs-*` as the index pattern.
- Set `X-Axis` to the `date histogram` of the timestamp field.
- Set `Y-Axis` to count the number of logs containing "Intrusion attempt detected".
- Save the visualisation as `Intrusion Attempts Over Time`.

Sample Visualisation:<br>
![Screenshot 2024-06-19 132455](https://github.com/MenakaGodakanda/security-monitoring-dashboard/assets/156875412/178810b8-81ed-4148-85f3-5f2acbc93411)


#### System Vulnerabilities Visualization:
- Create a new `Pie` chart.
- Select `logs-*` as the index pattern.
- Set the Slices to the terms of the log message field containing "Vulnerability found".
- Save the visualisation as `System Vulnerabilities Distribution`.

Sample Visualisation:<br>
![Screenshot 2024-06-19 140853](https://github.com/MenakaGodakanda/security-monitoring-dashboard/assets/156875412/21b7aae0-46ea-487f-9142-ac0aba001578)


#### Malware Detections Visualization:
- Create a new `Line` chart.
- Select `logs-*` as the index pattern.
- Set `X-Axis` to the `date histogram` of the timestamp field.
- Set `Y-Axis` to count the number of logs containing "Malware detected".
- Save the visualisation as `Malware Detections Over Time`.

Sample Visualisation:<br>
![Screenshot 2024-06-19 140847](https://github.com/MenakaGodakanda/security-monitoring-dashboard/assets/156875412/c1804655-e872-4efb-8f83-b26e0f877657)


### Create and Share Dashboard

#### Create Dashboard:
- Go to Dashboard in Kibana.
- Click on `Create new dashboard`.
- Add the above visualizations to the dashboard.
- Arrange the visualizations for a comprehensive view of the security metrics.
- Save the dashboard as `Security Monitoring Dashboard`.

Sample Dashboard:<br>
![Screenshot 2024-06-19 140847 - Copy](https://github.com/MenakaGodakanda/security-monitoring-dashboard/assets/156875412/1848e60c-c506-48fa-badc-2357814b2e2a)



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

- Access Kibana at `http://localhost:5601`
- View the dashboard to monitor security metrics.

## License

This project is licensed under the MIT License.
