#!/usr/bin/env bash

red=$(tput setaf 1)
gold=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
default=$(tput sgr0)

info_box() {
  NUM=$((${#1} + 4))
  echo "${cyan}"
  eval printf %.0s# '{1..'"${NUM}"\}; echo
  echo "# $1 #"
  eval printf %.0s# '{1..'"${NUM}"\}; echo
  echo "${default}"
}

FIRMWARES=(
  "8.1.6_adb_enabled.tar.xz"
  "8.2.5_adb_enabled"
  "8.2.5_nonpremium.tar.xz"
  "8.2.5_stock.tar.xz"
  "factory_fresh.tar.xz"
)

PS3="${cyan}Select a firmware to download and prepare (q to quit): $gold"
select firmware in "${FIRMWARES[@]}"; do
  case "$firmware" in
    "") break ;;  # This is a fake; any invalid entry makes $firmware=="", not just "q".
    *) break ;;
  esac
done

if [ -z "$firmware" ]; then
  echo "${red}No firmware selected. Exiting.${default}"
  exit 1
fi

info_box "Downloading firmware"
echo "  Downloading [${magenta}${firmware}${default}] firmware to [${magenta}${PWD}/firmware/${firmware}.tar.xz${default}]"
# curl --create-dirs -O --output-dir ./firmware https://car-thing.s3.us-east-2.amazonaws.com/8.2.5_adb_enabled.tar.xz

info_box "Creating firmware directory"
echo "  Creating firmware directory [${magenta}${PWD}/firmware/${firmware}${default}]"
# mkdir -p ./firmware/8.2.5_adb_enabled

info_box "Extracting firmware"
echo "  Extracting [${magenta}${firmware}${default}] firmware to [${magenta}${PWD}/firmware/${firmware}${default}]"
# tar -xf firmware/8.2.5_adb_enabled.tar.xz -C ./firmware/8.2.5_adb_enabled

info_box "Updating firmware extensions"
echo "  Updating extensions in [${magenta}${PWD}/firmware/${firmware}${default}]"
if [ -f ./firmware/${firmware}/data.dump ]; then mv ./firmware/${firmware}/data.dump ./firmware/${firmware}/data.ext4; fi
if [ -f ./firmware/${firmware}/settings.dump ]; then mv ./firmware/${firmware}/settings.dump ./firmware/${firmware}/settings.ext4; fi
if [ -f ./firmware/${firmware}/system_a.dump ]; then mv ./firmware/${firmware}/system_a.dump ./firmware/${firmware}/system_a.ext2; fi
if [ -f ./firmware/${firmware}/system_b.dump ]; then mv ./firmware/${firmware}/system_b.dump ./firmware/${firmware}/system_b.ext2; fi
