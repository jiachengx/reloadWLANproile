#!/bin/bash
# Purpose: 
# Configure the wpa_supplicant file and then restart the dhcpcd service under raspbian OS using Raspberry Pi

SSID=$1
key=$2
IFCE="wlan0"

if [ -z ${SSID} ] || [ -z ${key} ]; then
  printf "Usage:\n\t$0 [SSID] [KEY] ex. $0 ssid-5G password"
  exit 0
fi

# configure the wpa_supplicant file. 
wpa_cli -i ${IFCE} remove_network 0
wpa_cli -i ${IFCE} add_network 0
wpa_cli -i ${IFCE} set_network 0 ssid "${SSID}"
wpa_cli -i ${IFCE} set_network 0 psk "${key}"
wpa_cli -i ${IFCE} set country TW
wpa_cli -i ${IFCE} enable_network 0
wpa_cli -i ${IFCE} save_config

# reload the wpa_supplicant configured file and then get the dynamic IP from DHCP server
systemctl daemon-reload
systemctl restart dhcpcd.service
