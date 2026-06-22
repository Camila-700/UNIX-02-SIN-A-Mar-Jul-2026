#!/usr/bin/env bash

set -euo pipefail

EVIDENCE_DIR="part3/evidence/3A_lab_setup"
LAB_DIR="${LAB_DIR:-Black-Hat-Bash/lab}"

mkdir -p "$EVIDENCE_DIR"

echo "[+] Black Hat Bash Lab - Part 3A verification"
echo "[+] Evidence will be saved in: $EVIDENCE_DIR"
echo

echo "[1/6] Checking current Git branch..."
git branch --show-current | tee "$EVIDENCE_DIR/01_git_branch.txt"
echo

echo "[2/6] Checking Docker version..."
docker --version | tee "$EVIDENCE_DIR/02_docker_version.txt"
echo

echo "[3/6] Checking Docker Compose version..."
docker compose version | tee "$EVIDENCE_DIR/03_docker_compose_version.txt"
echo

echo "[4/6] Checking lab directory..."
if [ -d "$LAB_DIR" ]; then
    echo "Lab directory found: $LAB_DIR" | tee "$EVIDENCE_DIR/04_lab_directory.txt"
else
    echo "Lab directory NOT found: $LAB_DIR" | tee "$EVIDENCE_DIR/04_lab_directory.txt"
    echo
    echo "Clone the Black Hat Bash repository with:"
    echo "git clone https://github.com/dolevf/Black-Hat-Bash.git"
    exit 1
fi
echo

echo "[5/6] Checking running containers..."
docker ps --format "{{.Names}}" | tee "$EVIDENCE_DIR/05_docker_ps_names.txt"
echo

echo "[6/6] Checking lab bridge networks..."
ip addr | grep "br_" | tee "$EVIDENCE_DIR/06_bridge_networks.txt" || true
echo

echo "[+] Verification script finished."
echo "[+] Review the files inside: $EVIDENCE_DIR"