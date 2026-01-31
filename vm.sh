#!/usr/bin/env bash

set -e

# Color codes
YELLOW="\e[33m"
GREEN="\e[32m"
CYAN="\e[36m"
RESET="\e[0m"

# Spacer helper
echoh() {
  echo
}

# Banner function
echo_coder_postinstall() {
  echoh
  echo "========================================================================"
  echo -e "                    ${GREEN}POWERED BY DeUp Gaming${RESET}"
  echo "========================================================================"
  echo "For any help- Join Our Discord Server https://discord.gg/V6CrWhyh3M"
  echoh
}

# Show banner
echo_coder_postinstall

sleep 5

# Clear terminal after cooldown
clear

echo -e "${YELLOW}[INFO]${RESET} Updating system packages..."
sleep 2
echo -e "${GREEN}[WARN]${RESET} Fixing Yarn GPG key (if missing)..."
curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg \
  | sudo gpg --dearmor -o /usr/share/keyrings/yarn.gpg || true

echo "deb [signed-by=/usr/share/keyrings/yarn.gpg] https://dl.yarnpkg.com/debian stable main" \
  | sudo tee /etc/apt/sources.list.d/yarn.list > /dev/null || true

sudo apt update
sudo apt install gpg -y

clear

echo -e "${YELLOW}[INFO]${RESET} Installing required packages..."
sleep 2
sudo apt install -y \
  qemu-system-x86 \
  qemu-utils \
  wget \
  novnc \
  websockify

clear

echo -e "${YELLOW}[INFO]${RESET} Downloading Ubuntu QCOW2 image..."
sleep 2
wget -O ubuntu.qcow2 "https://download1335.mediafire.com/o6gtu7bcpaagOqT6TCjyWuEZ8aKZJUDYWHoTx1B_s3IGLKwTG08gx4Zp9x8YF-zaPCi5ZdrMIeMC-o_gGaOflPQYiO6IytLrsyGp-vDdTorkqGAJ9LQlYlvOdvnIU5NaJd2MXQ-cIjYC4jbFgbjCC1MroUfhHj5Ko5Zs_VsMIkvZi1Ti/7biqj69ew1sa99k/ubuntu.qcow2"

clear

echo -e "${YELLOW}[INFO]${RESET} Starting websockify (noVNC) on port 6080..."
sleep 2
websockify --web=/usr/share/novnc/ 6080 localhost:5900 &

clear
# Banner function
echo_coder_postinstall() {
  echoh
  echo "========================================================================"
  echo -e "              ${GREEN}POWERED BY DeUp Gaming${RESET}"
  echo "========================================================================"
  echo "For any help- Join Our Discord Server https://discord.gg/V6CrWhyh3M"
  echoh
}

# Show banner
echo_coder_postinstall
echo -e "${GREEN}[✔]${RESET} Setup complete."
sleep 3
