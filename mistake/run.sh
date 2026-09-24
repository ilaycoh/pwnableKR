#!/bin/sh
set -eu

image="mistake"
container="mistake"

docker build -t "$image" .
docker rm -f "$container" >/dev/null 2>&1 || true
docker run -d \
  --name "$container" \
  --restart always \
  --cap-drop ALL \
  --security-opt no-new-privileges \
  --pids-limit 20 \
  --memory 128m \
  --cpus 1.0 \
  -p 127.0.0.1:10008:10008 \
  "$image"

printf 'running: nc 127.0.0.1 10008\n'
