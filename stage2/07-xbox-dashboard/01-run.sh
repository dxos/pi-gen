#!/bin/bash -e

#
# Copyright 2020 DxOS.
#

# TODO: stub, universal conf (cameron)
CONF_DIR=/home/${FIRST_USER_NAME}/.xbox/installed
PROJECT_DIR=/home/${FIRST_USER_NAME}

on_chroot << EOF
  echo "Installing Dashboard..."
  cd ${PROJECT_DIR}

  git clone https://github.com/dxos/dashboard.git

  # TODO(burdon): Build.
  sudo yarn install

  touch ${CONF_DIR}/install_dashboard
  echo "OK"
EOF
