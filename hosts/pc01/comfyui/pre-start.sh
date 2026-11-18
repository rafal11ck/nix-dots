#!/bin/bash
# Sourced by the image's entrypoint before every ComfyUI start.
# Installs what nodes.json and the *.curl lists name; anything already there is skipped.
# local/*.curl is for models you don't want in git (local/ is gitignored).
# `|| true`: a failure (e.g. no network at boot) must not stop ComfyUI starting.

# Python packages that nodes need go to /root/.local (on the volume), not into
# the container, where they would vanish when it is recreated.
export PIP_USER=true

python3 /root/ComfyUI/custom_nodes/ComfyUI-Manager/cm-cli.py install-deps /root/user-scripts/nodes.json || true

# --skip-existing: files already on disk are skipped without contacting the server.
# --remove-on-error: a failed download is deleted, so it is retried next start.
for list in /root/user-scripts/models.curl /root/user-scripts/local/*.curl; do
  [ -f "$list" ] || continue
  curl --config "$list" --output-dir /root/ComfyUI/models --create-dirs \
    --skip-existing --remove-on-error --location --fail --retry 5 --silent --show-error || true
done
