# Spotify Car Thing Development on a Mac

## Prerequsites
brew install libusb


### Clone this project
```
git clone git@github.com:peledies/carthing-dev-template.git --recurse-submodules
```

TODO: do this in a virtual environment
pip3 install git+https://github.com/superna9999/pyamlboot


## Get a Firmware
https://mega.nz/folder/NxNXQCaT#-n1zkoXsJuw-5rQ-ZYzRJw/folder/5kECGT5C

8.2.5_adb_enabled

- extract it

cd 8.2.5_adb_enabled

mv data.dump data.ext4 \
  && mv settings.dump settings.ext4 \
  && mv system_a.dump system_a.ext2 \
  && mv system_b.dump system_b.ext2

## The hack

- hold buttons 1 & 4
- plug in CarThing

python3 superbird-tool/superbird_tool.py --find_device
python3 superbird_tool.py --restore_device ../8.2.5_adb_enabled


## ADB
https://www.xda-developers.com/install-adb-windows-macos-linux/

./platform-tools/adb devices
./platform-tools/adb shell mount -o remount,rw /
./platform-tools/adb shell


## Web App
Get the web app so you can explore it locally

### Pull
./platform-tools/adb pull /usr/share/qt-superbird-app/webapp webapp

### Push
./platform-tools/adb push webapp /usr/share/qt-superbird-app/webapp

