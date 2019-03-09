Reload the WLAN profile wihtout reboot under Raspbian OS using Raspberry Pi

Usage：

            Mode                 0: SSID      | 1: BSSID
         (B)SSID                 SSID: SAMPLE | BSSID: AA:BB:CC:DD:EE
             key                 secure key   | password
    country_code                 Taiwan       | TW


For example:


    bash reloadWLAN.sh 0 SAM password TW
    bash reloadWLAN.sh 1 AA:BB:CC:DD:EE password TW
