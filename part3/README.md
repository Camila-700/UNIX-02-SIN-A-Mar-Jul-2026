# Part 3 - Black Hat Bash Lab

## Objective

This section documents the deployment, verification, and authorized reconnaissance technique for the Black Hat Bash laboratory environment.

The lab is intentionally vulnerable and was executed only in an isolated environment controlled by the group. No scans or attacks were performed outside the lab network.

## Repository and Branch

* Project repository: UNIX-02-SIN-A-Mar-Jul-2026
* Working branch: integrative-project
* Source branch: dev2
* Part assigned: Part 3 - Black Hat Bash Lab
* Responsible member: Camila Lascano

## Execution Environment

The Black Hat Bash lab was deployed and tested inside an Ubuntu virtual machine running on Oracle VirtualBox.

GitHub Codespaces was used only for editing documentation, organizing evidence, commits, and pushing the project files to GitHub.

* VM name: BHB-Lab-Ubuntu
* Hypervisor: Oracle VirtualBox
* Guest OS: Ubuntu
* Lab path inside VM: `~/Black-Hat-Bash/lab`
* Evidence path inside VM: `~/part3-evidence`

## 3A - Lab Setup and Verification

### Required Tools

The lab was verified using:

* Docker
* Docker Compose
* Make
* Git
* iproute2
* Nmap
* curl

### Official Lab Repository

```bash
git clone https://github.com/dolevf/Black-Hat-Bash.git
cd Black-Hat-Bash/lab
```

### Deployment

The lab was deployed with:

```bash
sudo make deploy
```

The deployment process created and started the lab containers. The terminal output showed:

```text
OK: all containers appear to be running.
OK: Lab is up and provisioned.
```

The lab was also restarted and verified with:

```bash
sudo docker compose up -d
```

This showed `Running 8/8`, confirming that the expected lab containers were running.

### Verification Commands

Docker and Docker Compose were verified with:

```bash
docker --version
docker compose version
```

Running containers were verified with:

```bash
sudo docker ps
```

Container names were verified with:

```bash
sudo docker ps --format "{{.Names}}"
```

Docker bridge networks were verified with:

```bash
ip addr | grep br_
```

Access to one lab machine was demonstrated with:

```bash
sudo docker exec -it p-web-01 bash
hostname
exit
```

## Evidence Checklist

| Evidence               | Command or action                                | Status    |
| ---------------------- | ------------------------------------------------ | --------- |
| Docker version         | `docker --version`                               | Completed |
| Docker Compose version | `docker compose version`                         | Completed |
| Lab deployment         | `sudo make deploy` / `sudo docker compose up -d` | Completed |
| Running containers     | `sudo docker ps`                                 | Completed |
| Container names        | `sudo docker ps --format "{{.Names}}"`           | Completed |
| Bridge networks        | `ip addr \| grep br_`                            | Completed |
| Container access       | `sudo docker exec -it p-web-01 bash`             | Completed |
| Nmap scan p-web-01     | `nmap -sV -Pn 172.16.10.10`                      | Completed |
| Nmap scan p-web-02     | `nmap -sV -Pn 172.16.10.12`                      | Completed |
| Nmap scan p-ftp-01     | `nmap -sV -Pn 172.16.10.11`                      | Completed |

## Lab Architecture

| Machine      |      Public IP | Corporate IP | Hostname                           | Role                       |
| ------------ | -------------: | -----------: | ---------------------------------- | -------------------------- |
| p-web-01     |   172.16.10.10 |          N/A | p-web-01.acme-infinity-servers.com | Public web server          |
| p-ftp-01     |   172.16.10.11 |          N/A | p-ftp-01                           | Public FTP and web server  |
| p-web-02     |   172.16.10.12 |          N/A | p-web-02                           | Public web server          |
| p-jumpbox-01 | 172.16.10.0/24 |          N/A | p-jumpbox-01                       | Public jumpbox             |
| c-db-01      |            N/A |  10.1.0.0/24 | c-db-01                            | Corporate database machine |
| c-db-02      |            N/A |  10.1.0.0/24 | c-db-02                            | Corporate database machine |
| c-redis-01   |            N/A |  10.1.0.0/24 | c-redis-01                         | Corporate Redis service    |
| c-backup-01  |            N/A |  10.1.0.0/24 | c-backup-01                        | Corporate backup machine   |

## Network Diagram

```text
                    Black Hat Bash Lab

            Public network: 172.16.10.0/24
            Gateway: br_public - 172.16.10.1

    +-------------+      +-------------+      +-------------+      +----------------+
    |  p-web-01   |      |  p-ftp-01   |      |  p-web-02   |      | p-jumpbox-01   |
    |172.16.10.10 |      |172.16.10.11 |      |172.16.10.12 |      |172.16.10.x     |
    +-------------+      +-------------+      +-------------+      +----------------+


            Corporate network: 10.1.0.0/24
            Gateway: br_corporate - 10.1.0.1

    +-------------+      +-------------+      +-------------+      +-------------+
    |   c-db-01   |      |   c-db-02   |      | c-redis-01  |      | c-backup-01 |
    |  10.1.0.x   |      |  10.1.0.x   |      |  10.1.0.x   |      |  10.1.0.x   |
    +-------------+      +-------------+      +-------------+      +-------------+
```

## Evidence Files

Evidence text files are stored in:

```text
part3/evidence/
```

Collected evidence files:

```text
01_docker_version.txt
02_docker_compose_version.txt
03_docker_ps.txt
04_container_names.txt
05_bridge_networks.txt
06_p_web_01_access.txt
07_nmap_p_web_01.txt
08_nmap_p_web_02.txt
09_nmap_p_ftp_01.txt
```

Screenshots are stored in:

```text
part3/screenshots/
```

Expected screenshot files:

```text
01_docker_version.png
02_docker_compose_version.png
03_lab_running_8_containers.png
04_container_names.png
05_bridge_networks.png
06_p_web_01_access.png
07_nmap_p_web_01.png
08_nmap_p_web_02.png
09_nmap_p_ftp_01.png
extra_lab_deployed_and_provisioned.png
```

The VM evidence log is available at:

```text
part3/VM_EVIDENCE_LOG.md
```

## 3B - Authorized Hacking Technique

### Chosen Technique

The selected technique was a basic port and service scan using Nmap.

This technique identifies open TCP ports and service versions. It is useful during reconnaissance because it shows which services are exposed and what technologies are running on each target.

### Commands Executed

```bash
nmap -sV -Pn 172.16.10.10
nmap -sV -Pn 172.16.10.12
nmap -sV -Pn 172.16.10.11
```

Options:

* `-sV`: detects service versions.
* `-Pn`: skips host discovery and treats the host as online.

## Results and Interpretation

### p-web-01 - 172.16.10.10

Nmap found:

```text
8081/tcp open  http  Werkzeug httpd 3.0.1 (Python 3.12.3)
```

This means that `p-web-01` exposes an HTTP service on TCP port `8081`. The service is running Werkzeug with Python, which indicates a Python-based web application, likely related to Flask or Werkzeug. This identifies a web attack surface for later authorized testing.

### p-web-02 - 172.16.10.12

Nmap found:

```text
80/tcp open  http  Apache httpd 2.4.57 ((Debian))
```

This means that `p-web-02` exposes a public HTTP service on TCP port `80` using Apache on Debian. This identifies the server technology and confirms a public-facing web service.

### p-ftp-01 - 172.16.10.11

Nmap found:

```text
21/tcp open  ftp   vsftpd 3.0.5
80/tcp open  http  Apache httpd 2.4.58 ((Ubuntu))
```

This means that `p-ftp-01` exposes both FTP and HTTP services. The FTP service is important because it could be tested later for anonymous login, weak credentials, or FTP misconfigurations inside the isolated lab. The HTTP service also represents a web attack surface.

## Demo Video Plan

The Part 3 demo video should show:

1. Ubuntu VM running in Oracle VirtualBox.
2. Docker and Docker Compose versions.
3. Lab containers running with `sudo docker ps`.
4. Container names with `sudo docker ps --format "{{.Names}}"`.
5. Public and corporate bridge networks with `ip addr | grep br_`.
6. Access to `p-web-01` with `sudo docker exec -it p-web-01 bash`.
7. Nmap scan results for `p-web-01`, `p-web-02`, and `p-ftp-01`.
8. Technical interpretation of the `p-web-01` result.

## Safety Statement

All testing was performed only against the Black Hat Bash lab environment deployed by the group. No scans, attacks, or enumeration activities were performed against public networks, university infrastructure, or third-party systems.
