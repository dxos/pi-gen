#!/bin/bash -e

#
# Copyright 2020 DxOS.
#

# TODO: universal conf (cameron)
CONF_DIR=/home/${FIRST_USER_NAME}/.xbox/installed
PROJECT_DIR=/home/${FIRST_USER_NAME}
HOME_DIR=/home/${FIRST_USER_NAME}

on_chroot << EOF
  echo "Installing Yarn..."
  cd ${PROJECT_DIR}

  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
  apt-get update && apt-get install --no-install-recommends yarn

  echo "home dir is"
  echo 'export PATH=$PATH:$HOME_DIR/.yarn/bin' >> $HOME_DIR/.profile

  # Slow networks often time out during yarn install; increasing the max network-timeout helps.
  echo "network-timeout 600000" >> $HOME_DIR/.yarnrc

  touch ${CONF_DIR}/install_yarn
  echo "OK"
EOF
