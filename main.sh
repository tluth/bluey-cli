
#!/bin/bash

device_name=$#;
all_instances=()

while IFS= read -r line; do
    all_instances+=( "$line" )
    case "$line" in 
    *$device_name*)
        # echo $line

        ;;
    esac

done < <( bluetoothctl devices )

printf '%s\n' "${all_instances[@]}"


# get_mac_address () {
#   return $1 | grep -oP "^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$"
# }


echo "Device CD:49:CC:9B:50:FD Modern Mobile Mouse" | grep -oP "([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}"

