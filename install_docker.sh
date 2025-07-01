#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status,
# if any variable is unset, and propagate errors in pipelines.
set -euo pipefail

echo "[INFO] Updating package lists..."
apt-get update

echo "[INFO] Installing required dependencies..."
apt-get install -y ca-certificates curl gnupg lsb-release

echo "[INFO] Creating /etc/apt/keyrings directory if it does not exist..."
install -m 0755 -d /etc/apt/keyrings

echo "[INFO] Downloading Docker GPG key..."
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc

echo "[INFO] Setting read permissions for the Docker GPG key..."
chmod a+r /etc/apt/keyrings/docker.asc

echo "[INFO] Adding Docker repository to APT sources..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
  > /etc/apt/sources.list.d/docker.list

echo "[INFO] Updating package lists after adding Docker repository..."
apt-get update

echo "[INFO] Installing Docker Engine, CLI, containerd, Buildx, and Compose plugin..."
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "[INFO] Enabling and starting Docker service..."
systemctl enable docker
systemctl start docker

echo "[INFO] Verifying Docker installation..."
docker --version
docker compose version

echo "[INFO] Docker installation completed successfully."
