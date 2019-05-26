currentdir="$(pwd)"
parentdir="$(dirname "$currentdir")"
sudo docker run -v "$parentdir":/root/mount -it ewright362/env:latest bash
