**Do not use this repository anymore - please refer to [the documentation](https://docs.nitrokey.com/nitropad-nitropc/os-reinstallation) on how to properly re-install the OS on a Nitropad/NitroPC**


# Debian Nitrokey Automated Installation ISO

As of now there is no proper OEM installation for Debian. Therefore
a preseeded installation ISO is used, which can be created with these 
scripts.

To create the ISO image run:
```bash

# this will set up a simple debian container and bring you in
make

# run the iso building process
make build

# leave the container
exit
```

This will create an iso file inside `images/` which can be used for installation (or [download](https://www.nitrokey.com/files/ci/nitropad/debian-oem/) the image).

**On boot, make sure to select "Advanced Options" -> "(Graphical) Automated Install".**

During Installation only the following inputs are expected:
* Language / Country / Keymap
* User Account (Full Name, Account Name, Password)
* LUKS Disk Encryption Password

### Packages needed (if building w/o docker)

* `simple-cdd` `make` `tasksel`
