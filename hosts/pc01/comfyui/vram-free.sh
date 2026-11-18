#!/bin/sh
# Every 10 minutes: if ComfyUI's queue is empty and nothing was rendered since
# the last check, ask it to unload models (once per idle period).
COMFY=http://127.0.0.1:8188
last=""
freed=""

while sleep 600; do
  queue=$(curl -sf "$COMFY/queue") || continue
  seen=$(curl -sf "$COMFY/history?max_items=1" | md5sum) || continue

  echo "$queue" | grep -q '"queue_running": *\[\]' || { last=$seen; continue; }
  echo "$queue" | grep -q '"queue_pending": *\[\]' || { last=$seen; continue; }

  if [ "$seen" = "$last" ] && [ "$seen" != "$freed" ]; then
    if curl -sf -X POST -H 'Content-Type: application/json' \
      -d '{"unload_models":true,"free_memory":true}' "$COMFY/free" >/dev/null; then
      echo "$(date -Iseconds) idle: asked ComfyUI to unload models"
      freed=$seen
    fi
  fi
  last=$seen
done
