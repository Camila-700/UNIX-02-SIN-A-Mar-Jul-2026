# Part 3 - Virtual Machine Evidence Log

## Execution environment

The Black Hat Bash lab was deployed and tested in an Ubuntu virtual machine running on Oracle VirtualBox.

The virtual machine was used because the lab requires Docker, Docker Compose, bridge networks, and privileged container execution. GitHub Codespaces was used for editing documentation, organizing evidence, and committing the project files.

## VM details

- VM name: BHB-Lab-Ubuntu
- Hypervisor: Oracle VirtualBox
- Guest OS: Ubuntu
- Lab path inside VM: ~/Black-Hat-Bash/lab
- Evidence path inside VM: ~/part3-evidence

## Verified evidence files

The following evidence files were generated inside the Ubuntu VM and reproduced in this repository:

- 01_docker_version.txt
- 02_docker_compose_version.txt
- 03_docker_ps.txt
- 04_container_names.txt
- 05_bridge_networks.txt
- 06_p_web_01_access.txt
- 07_nmap_p_web_01.txt
- 08_nmap_p_web_02.txt
- 09_nmap_p_ftp_01.txt

## Lab summary

The lab was verified with 8 running containers:

- p-web-02
- p-jumpbox-01
- p-web-01
- p-ftp-01
- c-backup-01
- c-redis-01
- c-db-02
- c-db-01

The Docker bridge networks were validated:

- br_public: 172.16.10.1/24
- br_corporate: 10.1.0.1/24

Container access was demonstrated with p-web-01.

## Nmap findings

- p-web-01 at 172.16.10.10 exposes HTTP on port 8081 using Werkzeug httpd 3.0.1 with Python 3.12.3.
- p-web-02 at 172.16.10.12 exposes HTTP on port 80 using Apache httpd 2.4.57 on Debian.
- p-ftp-01 at 172.16.10.11 exposes FTP on port 21 using vsftpd 3.0.5 and HTTP on port 80 using Apache httpd 2.4.58 on Ubuntu.

## Note

The original execution was performed in the VirtualBox Ubuntu VM. The repository stores the evidence outputs and documentation for grading and reproduction.
