#!/usr/bin/env bash

set -euo pipefail

EVIDENCE_DIR="part3/evidence/3A_lab_setup"
LAB_DIR="${LAB_DIR:-Black-Hat-Bash/lab}"

mkdir -p "$EVIDENCE_DIR"

echo "[+] Black Hat Bash Lab - Part 3A verification"
echo "[+] Evidence directory: $EVIDENCE_DIR"
echo "[+] Lab directory: $LAB_DIR"
echo

echo "[1/9] Saving Git branch..."
git branch --show-current | tee "$EVIDENCE_DIR/01_git_branch.txt"
echo

echo "[2/9] Saving Docker version..."
docker --version | tee "$EVIDENCE_DIR/02_docker_version.txt"
echo

echo "[3/9] Saving Docker Compose version..."
docker compose version | tee "$EVIDENCE_DIR/03_docker_compose_version.txt"
echo

echo "[4/9] Checking Black Hat Bash lab directory..."
if [ -d "$LAB_DIR" ]; then
    echo "Lab directory found: $LAB_DIR" | tee "$EVIDENCE_DIR/04_lab_directory.txt"
else
    echo "Lab directory NOT found: $LAB_DIR" | tee "$EVIDENCE_DIR/04_lab_directory.txt"
    echo
    echo "Clone the lab repository first:"
    echo "git clone https://github.com/dolevf/Black-Hat-Bash.git"
    exit 1
fi
echo

echo "[5/9] Running lab test..."
(
    cd "$LAB_DIR"
    sudo make test
) | tee "$EVIDENCE_DIR/05_make_test.txt"
echo

echo "[6/9] Saving running container names..."
sudo docker ps --format "{{.Names}}" | tee "$EVIDENCE_DIR/06_docker_ps_names.txt"
echo

echo "[7/9] Saving full docker ps output..."
sudo docker ps | tee "$EVIDENCE_DIR/07_docker_ps_full.txt"
echo

echo "[8/9] Saving lab bridge networks..."
ip addr | grep "br_" | tee "$EVIDENCE_DIR/08_bridge_networks.txt" || true
echo

echo "[9/9] Testing shell access to p-web-01..."
sudo docker exec p-web-01 hostname | tee "$EVIDENCE_DIR/09_p_web_01_hostname.txt"
echo

echo "[+] Verification finished."
echo "[+] Evidence saved in: $EVIDENCE_DIR"