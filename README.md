# bootc-server
Personal server image

## Build disk image

Set --type to whatever you need (e.g., raw, anaconda-iso, qcow2, etc):

```bash
mkdir -p $(pwd)/output
run0 podman pull ghcr.io/lauritskarl/bootc-server:latest
run0 sudo podman run \
    --rm \
    -it \
    --privileged \
    --pull=newer \
    --security-opt label=type:unconfined_t \
    -v /var/lib/containers/storage:/var/lib/containers/storage \
    -v $(pwd)/config.toml:/config.toml \
    -v $(pwd)/output:/output \
    quay.io/centos-bootc/bootc-image-builder:latest \
    --type qcow2 \
    --rootfs btrfs \
    --use-librepo=True \
    ghcr.io/lauritskarl/bootc-server:latest
```
