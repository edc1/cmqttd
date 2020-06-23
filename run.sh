#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

LOG_LEVEL="$(bashio::config 'log_level')"
BROKER_ADDRESS="$(bashio::config 'broker_address')"
BROKER_PORT="$(bashio::config 'broker_port')"
BROKER_USERNAME="$(bashio::config 'broker_username')"
BROKER_PASSWORD="$(bashio::config 'broker_password')"
CNI_ADDRESS="$(bashio::config 'cni_address')"
CNI_PORT="$(bashio::config 'cni_port')"

echo Hello world!
echo "$LOG_LEVEL"
echo "$BROKER_ADDRESS"
echo "$BROKER_PORT"
echo "$BROKER_USERNAME"
echo "$BROKER_PASSWORD"
echo "$CNI_ADDRESS"
echo "$CNI_PORT"

python3 -V
cmqttd -h
