#!/usr/bin/env bash

# We need to run 32bit QEMU -- see https://github.com/RPi-Distro/pi-gen/issues/271
# dpkg --add-architecture i386
# apt-get update

# apt-get install -y coreutils quilt parted qemu-user-static:i386 debootstrap zerofree zip \
# dosfstools bsdtar libcap2-bin grep rsync xz-utils file git curl bc

apt-get install -y quilt parted qemu-user-static debootstrap zerofree zip dosfstools bsdtar git