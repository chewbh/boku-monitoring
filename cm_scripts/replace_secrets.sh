#!/bin/bash

main() {
    ensure_confd_exists

    # generate or replace alertmanager.yml with credentals (or secrets) from environment
    SRC_DIR=`dirname "$(readlink -f "$0")"`
    rm $SRC_DIR/../alertmanager/alertmanager.yml
    confd -config-file alertmanager-config.toml -confdir $SRC_DIR/confd -onetime -backend env
    mv alertmanager.yml $SRC_DIR/../alertmanager/
}

ensure_confd_exists() {
  if ! [ -x "$(command -v confd)" ]; then
    echo 'Error: confd is not installed. Downloading it now from Github...' >&2
    wget https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64
    chmod +x confd-0.16.0-linux-amd64
    sudo mv confd-0.16.0-linux-amd64 /usr/local/bin/confd
  fi
}

main





