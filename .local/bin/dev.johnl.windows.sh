#!/bin/sh

# Making efibootmgr -n usable without sudo password
# echo "%wheel ALL=(root) NOPASSWD: /usr/sbin/efibootmgr" | sudo tee /etc/sudoers.d/efibootmgr-config

# Look up the boot number for Windows in the EFI records
boot_number=$(echo $(efibootmgr) | grep -Po "(?<=Boot)\S{4}(?=( |\* )Windows)" | head -n1)

# Check that Windows EFI entry was found
if [ -z "$boot_number" ]; then
    echo "Cannot find Windows boot in EFI, exiting"
    exit 1
fi

# Set next boot to be Windows and reboot the machine
sudo efibootmgr -n "${boot_number}"
reboot
