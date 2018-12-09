#!/bin/bash

# generate or replace alertmanager.yml with credentals (or secrets) from environment
SRC_DIR=`dirname "$(readlink -f "$0")"`
confd -config-file alertmanager-config.toml -confdir $SRC_DIR/confd -onetime -backend env
mv alertmanager.yml $SRC_DIR/../alertmanager/


