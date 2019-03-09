#!/bin/bash
# Purpose: 
# Configure the wpa_supplicant file and then restart the dhcpcd service under raspbian OS using Raspberry Pi
# Notice:
# If your sercure is open/ None, please input the key as NONE (upper letter)

mod=$1
SSID=$2
key=$3
country_code=$4

IFCE="wlan0"


if [ -z ${mode} ] || [ -z ${SSID} ] || [ -z ${key} ] || [ -z ${country_code}; then
  printf "Usage:\n\t$0 [0:SSID|1:BSSID] [SSID] [KEY] [country code]\n\t   ex. $0 0 ssid-5G password TW or $0 1 AA:BB:CC:DD:EE password TW"
  exit 0
fi

# configure the wpa_supplicant file. 
wpa_cli -i ${IFCE} remove_network 0
wpa_cli -i ${IFCE} add_network 0

if [ ${mode} -eq 0 ]; then
  wpa_cli -i ${IFCE} set_network 0 ssid "${SSID}"
else
  wpa_cli -i ${IFCE} set_network 0 bssid ${SSID}
fi

if [ ${key} == "NONE" ]; then
  wpa_cli -i ${IFCE} set_network 0 key_mgmt NONE
else
  wpa_cli -i ${IFCE} set_network 0 psk "${key}"
fi

wpa_cli -i ${IFCE} set country ${country_code}
wpa_cli -i ${IFCE} enable_network 0
wpa_cli -i ${IFCE} reconfigure
wpa_cli -i ${IFCE} save_config

# reload the wpa_supplicant configured file and then restat the DHCPCD service
systemctl daemon-reload
systemctl restart dhcpcd.service
