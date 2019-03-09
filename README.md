Reload the WLAN profile wihtout reboot under Raspbian OS using Raspberry Pi

Usage：

            Mode                 0: SSID      | 1: BSSID
         (B)SSID                 SSID: SAMPLE | AA:BB:CC:DD:EE
             key                 secure key   | password
    country_code                 Taiwan       | TW


For example:


    bash reloadWLAN.sh 0 SAM password TW
