# Spotify Car Thing Development on a Mac

## Summary

- Install prerequsites
- Clone this repository
- Download a new firmware
- Install the new firmware
- Modify the webapp
- Profit

## Prerequsites
```
brew install libusb
```

### Clone this project
```
git clone git@github.com:peledies/carthing-dev-template.git --recurse-submodules
```

TODO: do this in a virtual environment
```
pip3 install git+https://github.com/superna9999/pyamlboot
```

## Get a Firmware
Use the provided helper script to get a new patched firmware.
```
./prepare_firmware.sh
```


## The hack

- hold buttons 1 & 4
- plug in CarThing

```
python3 superbird-tool/superbird_tool.py --find_device
```

```
python3 superbird_tool.py --restore_device ../8.2.5_adb_enabled
```
> NOTE: This may fail several times but it will eventualy make it all the way
> through the process. It took 4 tries for me. ProTip: dont let your computer
> go to sleep durring this process

## ADB
ADB is included in this repository. The following commands work from the project root

```
./platform-tools/adb devices
```

```
./platform-tools/adb shell mount -o remount,rw /
```

```
./platform-tools/adb shell
```

```
./platform-tools/adb shell reboot
```

## Web App
Get the web app so you can explore it locally

### Pull
```
./platform-tools/adb pull /usr/share/qt-superbird-app/webapp ./
```

### Push
```
./platform-tools/adb push ./webapp /usr/share/qt-superbird-app && ./platform-tools/adb shell reboot
```
