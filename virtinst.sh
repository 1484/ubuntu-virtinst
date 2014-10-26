#!/bin/bash

TOP_DIR=$(cd $(dirname "$0") && pwd)

NAME=ubu01
RELEASE_NAME=trusty
NUM_CPU=2
MEMORY=4096
ARCH=amd64
VIRT_ARCH=x86_64

#SITE=http://ftp.riken.go.jp/Linux/ubuntu
#LOCATION=$SITE/dists/$RELEASE_NAME/main/installer-$ARCH/
LOCATION=/home/motoki/iso/ubuntu/ubuntu-14.04.1-server-amd64.iso

DISKFORMAT=raw
DISK=$TOP_DIR/../images/$NAME.img

sudo virt-install \
    --name $NAME \
    --os-type linux \
    --os-variant ubuntu${RELEASE_NAME} \
    --virt-type kvm \
    --connect=qemu:///system \
    --vcpus $NUM_CPU \
    --ram $MEMORY \
    --arch $VIRT_ARCH \
    --serial pty \
    --console pty \
    --disk=$DISK,format=$DISKFORMAT,size=128,sparse=true \
    --nographics \
    --location $LOCATION \
    --initrd-inject $TOP_DIR/preseed.cfg \
    --extra-args "
console=ttyS0,115200
file=/preseed.cfg
auto=true
priority=critical
interface=auto
language=en
country=JP
locale=en_US.UTF-8
console-setup/layoutcode=jp
console-setup/ask_detect=false
DEBCONF_DEBUG=5
" \
    --network network=default,model=virtio
