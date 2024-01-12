
#!/bin/bash

device_name=$1;

# Make sure bluetooth adapter is discoverable 
bluetoothctl discoverable on

bluetoothctl paired-devices | cut -f2 -d' '|
while read -r uuid
do
    info=`bluetoothctl info $uuid`
    echo $info
    if echo "$info" | grep -q "Connected: no"; then
       mac_address=$( echo $info | grep -oP "([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}")
       echo $mac_address
       bluetoothctl remove $mac_address
    fi
done

bluetoothctl devices | cut -f2 -d' '|
while read -r uuid
do
    info=`bluetoothctl info $uuid`
    if echo "$info" | grep -q "Name: $device_name"; then 
        bluetoothctl pair "$info" | grep "Name" | grep -v "Name: " 
        bluetoothctl connect "$info" | grep "Name" | grep -v "Name: " 
    fi
done