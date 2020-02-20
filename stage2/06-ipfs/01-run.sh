#!/bin/bash -e

#
# Copyright 2020 DxOS.
#

# TODO: stub, universal conf (cameron)
CONF_DIR=/home/${FIRST_USER_NAME}/.xbox/installed
PROJECT_DIR=/home/${FIRST_USER_NAME}
HOME_DIR=/home/${FIRST_USER_NAME} # Everything is run as root

IPFS_VERSION=v0.4.21
IPFS_CLEAR_BOOTSTRAP=${IPFS_CLEAR_BOOTSTRAP:-0}
IPFS_CUSTOM_BOOTSTRAP=${IPFS_CUSTOM_BOOTSTRAP:-"/ip4/35.196.115.235/tcp/4001/ipfs/QmaKMt4v8HW1VXKcgvuevAhSLfgDGZfvNLXnuTCVmABKvG"}

on_chroot << EOF
  echo "Installing IPFS..."
  cd ${PROJECT_DIR}

	git clone https://github.com/claudiobizzotto/ipfs-rpi

	cd ${PROJECT_DIR}/ipfs-rpi

	./install v0.4.21
EOF
