#!/bin/sh

# Check pool health.
health=$(zpool status -x)

# Report health status to kuma.
if [[ "$health" == "all pools are healthy" ]]; then
    curl http://kuma:3001/api/push/S31NEb6pbr?status=up&msg=OK&ping=
fi
