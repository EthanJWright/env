currentdir="$(pwd)"
parentdir="$(dirname "$currentdir")"
docker run -v "$parentdir":/root/mount -it ewright362/env:latest bash
