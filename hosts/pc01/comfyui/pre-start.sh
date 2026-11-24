#!/bin/bash

export PIP_USER=true

python3 /root/ComfyUI/custom_nodes/ComfyUI-Manager/cm-cli.py install-deps /root/user-scripts/nodes.json || true

for list in /root/user-scripts/models.curl /root/user-scripts/local/*.curl; do
  [ -f "$list" ] || continue
  curl --config "$list" --output-dir /root/ComfyUI/models --create-dirs \
    --skip-existing --remove-on-error --location --fail --retry 5 --silent --show-error || true
done
