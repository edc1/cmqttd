#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

LOG_LEVEL="$(bashio::config 'log_level')"
BROKER_ADDRESS="$(bashio::config 'broker_address')"
BROKER_PORT="$(bashio::config 'broker_port')"
BROKER_USERNAME="$(bashio::config 'broker_username')"
BROKER_PASSWORD="$(bashio::config 'broker_password')"
BROKER_NO_TLS="$(bashio::config 'broker_no_tls')"
CNI_ADDRESS="$(bashio::config 'cni_address')"
CNI_PORT="$(bashio::config 'cni_port')"
TIME_SYNC="$(bashio::config 'time_sync')"
NO_CLOCK="$(bashio::config 'no_clock')"


echo "$BROKER_USERNAME" > /data/mqtt.cfg
echo "$BROKER_PASSWORD" >> /data/mqtt.cfg
cmqttd --verbosity "$LOG_LEVEL" --broker-address "$BROKER_ADDRESS" --broker-port "$BROKER_PORT" --broker-auth /data/mqtt.cfg --tcp "$CNI_ADDRESS":"$CNI_PORT" --timesync "$TIME_SYNC"

