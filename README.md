# env
Github repo for development environment container: ewright362/env

## Setup
```
./start.sh
```

## Setup without cloning repo
```
export MOUNTDIR=share # this is dir to mount into container
sudo docker run -v "$MOUNTDIR":/root/mount -it ewright362/env:latest bash
```
