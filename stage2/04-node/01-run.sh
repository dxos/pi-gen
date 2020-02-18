#!/bin/bash -e

#
# Copyright 2020 DxOS.
#

# TODO: universal conf (cameron)
CONF_DIR=/home/${FIRST_USER_NAME}/.xbox/installed
PROJECT_DIR=/home/${FIRST_USER_NAME}
HOME_DIR=/home/${FIRST_USER_NAME}

NODE_VERSION=11.15.0
MACH="armv7l"

on_chroot << EOF
	mkdir -p "${CONF_DIR}"
	mkdir -p "${PROJECT_DIR}"

	echo "Installing NodeJS..."
	cd ${PROJECT_DIR}

	wget -O /tmp/nodejs.tgz.$$ https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-${MACH}.tar.gz

	mkdir -p /opt/node
	cd /opt/node

	tar zxvf /tmp/nodejs.tgz.$$

	chown -R root:root node*

	mv node-v${NODE_VERSION}-linux-${MACH}/bin/* /usr/local/bin/

	echo "create install marker"
	touch ${CONF_DIR}/install_nodejs
EOF
