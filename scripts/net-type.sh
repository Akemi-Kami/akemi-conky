#!/bin/bash

# A simple script to show if it's wifi or ethernet
# By AkemiKami201

# Detectar si hay conexión WiFi o Ethernet
WIFI_SSID=$(/sbin/iwgetid -r)  # WiFi network name, if connected
ETH_INTERFACE=$(ip link | grep -oP 'en\w+')  # detect ethernet interfaces

# Check if there is an IP assigned to the Ethernet interface
ETH_IP=$(ip -o -4 addr show dev ${ETH_INTERFACE} | awk '{print $4}' | cut -d/ -f1)

if [[ "$WIFI_SSID" != "" ]]; then
  # connected via WiFi
  echo "Wifi"
elif [[ "$ETH_IP" != "" ]]; then
  # connected via Ethernet
  echo "Ethernet"
else
  # if there is no connection
  echo "None"
fi

exit