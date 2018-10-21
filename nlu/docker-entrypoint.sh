#!/bin/bash
set -e

if [ "$1" = 'snips-nlu' ]; then
  # check if assistant folder is mounted
  if [ -z "$(ls -A /assistant)" ]; then
    echo "The /assistant directory must contain the extracted assistent downloaded from https://console.snips.ai"
    error=1
  fi

  # check if MQTT_HOST and MQTT_PORT are set
  if [ ! "$MQTT_HOST" -a "$MQTT_PORT" ]; then
    echo "MQTT_HOST and MQTT_PORT must be set"
  fi

  # check if MQTT_USERNAME and MQTT_PASSWORD are set
  if [ ! "$MQTT_USERNAME" -a "$MQTT_PASSWORD" ]; then
    echo "MQTT_USERNAME and MQTT_PASSWORD must be set"
  fi

  if [ ! -z "$error" ]; then
    echo "please mount the assistant folder to /assistant and set the needed environment variables"
    exit 1
  else
    exec "$1" --assistant "/assistant" --bus "mqtt" --mqtt "'$MQTT_HOST:$MQTT_PORT'" --mqtt_username "'$MQTT_USERNAME'" --mqtt_password "'$MQTT_PASSWORD'"
  fi
fi

exec "$@"
