# Part 3 - Black Hat Bash Lab

## Objective

This section documents the deployment, verification, and authorized attack technique for the Black Hat Bash laboratory environment.

The lab is intentionally vulnerable and must only be executed in an isolated environment controlled by the group. No scans or attacks are performed outside the lab network.

## Repository and Branch

- Project repository: UNIX-02-SIN-A-Mar-Jul-2026
- Working branch: integrative-project
- Source branch: dev2
- Part assigned: Part 3 - Black Hat Bash Lab

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

```bash
git clone https://github.com/dolevf/Black-Hat-Bash.git
cd Black-Hat-Bash/lab
