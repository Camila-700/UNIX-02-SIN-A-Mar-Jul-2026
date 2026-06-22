# Part 3 - Black Hat Bash Lab

## Objective

This section documents the deployment, verification, and authorized attack technique for the Black Hat Bash laboratory environment.

The lab is intentionally vulnerable and must only be executed in an isolated environment controlled by the group. No scans or attacks are performed outside the lab network.

## Repository and Branch

- Project repository: UNIX-02-SIN-A-Mar-Jul-2026
- Working branch: integrative-project
- Source branch: dev2
- Part assigned: Part 3 - Black Hat Bash Lab
- Responsible member: Camila Lascano

## 3A - Lab Setup and Verification

### Required tools

The lab requires:

- Docker
- Docker Compose
- Make
- Git
- iproute2

The current Codespaces environment is used for editing, documentation, scripts, and commits. The actual lab deployment must be executed in a Kali, Debian, or Ubuntu environment with Docker and Docker Compose available.

### Official lab repository

    git clone https://github.com/dolevf/Black-Hat-Bash.git
    cd Black-Hat-Bash/lab

### Deployment command

    sudo make deploy

While the deployment is running, the installation log can be monitored with:

    tail -f /var/log/lab-install.log

### Verification commands

After deployment, the lab must be verified with:

    sudo make test

Expected result:

    Lab is up.

The running containers must be checked with:

    sudo docker ps --format "{{.Names}}"

Expected result: 8 containers running, including public machines with p-* names and corporate machines with c-* names.

The Docker bridge networks must be checked with:

    ip addr | grep "br_"

Expected networks:

- br_public with gateway 172.16.10.1
- br_corporate with gateway 10.1.0.1

Access to a lab machine must be demonstrated with:

    sudo docker exec -it p-web-01 bash

## Evidence checklist

| Evidence | Command or action | Status |
|---|---|---|
| Docker version | docker --version | Pending |
| Docker Compose version | docker compose version | Pending |
| Lab deployment | sudo make deploy | Pending |
| Install log | tail -f /var/log/lab-install.log | Pending |
| Lab test | sudo make test | Pending |
| Running containers | sudo docker ps --format "{{.Names}}" | Pending |
| Bridge networks | ip addr \| grep "br_" | Pending |
| Container access | sudo docker exec -it p-web-01 bash | Pending |

## Lab Architecture

This table will be completed after the lab is deployed and verified.

| Machine | Public IP | Corporate IP | Hostname | Role |
|---|---:|---:|---|---|
| p-web-01 | 172.16.10.10 | N/A | Pending | Public web server |
| p-web-02 | Pending | N/A | Pending | Public web server |
| p-ftp-01 | Pending | N/A | Pending | Public FTP server |
| c-* | N/A | Pending | Pending | Corporate network machine |

## Network Diagram

                Black Hat Bash Lab

        Public network: 172.16.10.0/24
        Gateway: br_public - 172.16.10.1

        +-------------+      +-------------+      +-------------+
        |  p-web-01   |      |  p-web-02   |      |  p-ftp-01   |
        | 172.16.10.x |      | 172.16.10.x |      | 172.16.10.x |
        +-------------+      +-------------+      +-------------+


        Corporate network: 10.1.0.0/24
        Gateway: br_corporate - 10.1.0.1

        +-------------+      +-------------+      +-------------+
        |    c-*      |      |    c-*      |      |    c-*      |
        |  10.1.0.x   |      |  10.1.0.x   |      |  10.1.0.x   |
        +-------------+      +-------------+      +-------------+

## 3B - Authorized Hacking Technique

Chosen technique: pending.

Possible techniques:

- Basic: Port scanning with nmap.
- Intermediate: Web fingerprinting with WhatWeb.
- Intermediate: Directory enumeration with dirsearch.
- Intermediate: Anonymous FTP login test.
- Advanced: Template-based vulnerability scanning with Nuclei.

The selected technique will include:

1. Command executed.
2. Target machine.
3. Output evidence.
4. Technical interpretation.
5. Explanation of what information or access was obtained.

## Safety Statement

All testing is performed only against the Black Hat Bash lab environment deployed by the group. No scans, attacks, or enumeration activities are performed against public networks, university infrastructure, or third-party systems.
