#!/bin/bash
# Sync Vagrant private keys into ~/.vagrant_keys with proper permissions

set -euo pipefail

KEY_DIR="$HOME/.vagrant_keys"
SRC_DIR="/mnt/c/Users/ahmed/PFE/soc-lab/.vagrant/machines"

mkdir -p "$KEY_DIR"

declare -A HOSTS=(
  [elk]="$SRC_DIR/elk/virtualbox/private_key"
  [wazuh]="$SRC_DIR/wazuh/virtualbox/private_key"
  [ids]="$SRC_DIR/ids/virtualbox/private_key"
  [vpn]="$SRC_DIR/vpn/virtualbox/private_key"
  [client]="$SRC_DIR/client/virtualbox/private_key"

)

for host in "${!HOSTS[@]}"; do
  src="${HOSTS[$host]}"
  dest="$KEY_DIR/$host"
  if [ -f "$src" ]; then
    cp -f "$src" "$dest"
    chmod 600 "$dest"
    echo "✔ Synced key for $host"
  else
    echo "✘ No key found for $host"
  fi
done
