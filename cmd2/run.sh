#!/bin/sh
set -eu

image="cmd2"
container="cmd2"

docker build -t "$image" .
docker rm -f "$container" >/dev/null 2>&1 || true
docker run -d \
  --name "$container" \
  --restart always \
  --privileged \
  --pids-limit 100 \
  --memory 128m \
  --cpus 1.0 \
  -p 127.0.0.1:10013:10013 \
  "$image"

printf 'running: socat STDIO,raw,echo=0,opost,onlcr TCP:127.0.0.1:10013\n'
