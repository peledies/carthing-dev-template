# Spotify Car Thing Development
This is meant to expedite the development process and was specifically written to be run on Mac. I dont see any reason why it wont run on linux as well. If you get it to run, please PM me with your harware specs and ill update the compatibility list.

This has been tested and confirmed to work on the following hardware:
- 2018 Intel Mac Mini macOs 14.5

## Summary

- Install prerequsites
- Clone this repository
- Prepare a new firmware
- Install the new firmware
- Modify the webapp
- Profit

## Prerequsites
```
brew install libusb
```

TODO: do this in a virtual environment
```
pip3 install git+https://github.com/superna9999/pyamlboot
```

## Clone this project
> Make sure you have the `--recurse-submodules` at the end so you get the
> dependant submodules.
```
git clone git@github.com:peledies/carthing-dev-template.git --recurse-submodules
```


## Prepare a Firmware
Use the provided helper script to get a new patched firmware.
```
./prepare_firmware.sh
```


## The hack

- hold buttons 1 & 4
- plug in CarThing

> NOTE: This may fail several times but it will eventualy make it all the way
> through the process. It took 4 tries for me. ProTip: dont let your computer
> go to sleep durring this process
```
./prepare_device.sh
```


## The CT script
ADB is included in this repository and can be used on its own to interact with the CarThing. However the included `ct` script will do pretty much everything you need with fewer keystrokes

The following commands work from the project root:

Pull the contents of the webapp directory from the CarThing to your current working directory
```
./ct --pull
```

Push the contents of your `./webapp` directory to the CarThing
```
./ct --push
```

Open a shell to the CarThing
```
./ct --shell
```

Reboot the CarThing
```
./ct --reboot
```