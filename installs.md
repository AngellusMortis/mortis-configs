#

## Cluster

curl -sL https://github.com/AngellusMortis/arch-installer/archive/master.tar.gz | tar xz
cd arch-installer-master
./install.sh -n cluster-4 -y -v /dev/sda -v /dev/sdb -u cbailey --no-input

## RPI

```bash
pacman-key --init
pacman-key --populate archlinuxarm
pacman -Syu
pacman -S base-devel rsync uboot-tools python ansible vim

# add `dtparam=i2c_arm=on` to /boot/config.txt
# add `i2c-dev` to /etc/modules-load.d/raspberrypi.conf

# add pcie_brcmstb to MODULES in /etc/mkinitcpio.conf
mkinitcpio -P

cd /opt
git clone https://github.com/UCTRONICS/U6143_ssd1306.git
cd U6143_ssd1306/C/
make clean && sudo make

useradd -m cbailey
echo "cbailey ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/01-admin
sudo su - cbailey
mkdir ~/.ssh/
chmod 700 ~/.ssh/
vim ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

# re-log
userdel alarm
hostnamectl hostname #host

fdisk /dev/sda
# n

mkfs.ext4 /dev/sda1
mkdir /mnt/root
mount /dev/sda1 /mnt/root
rsync --info=progress2 -axHAX / /mnt/root
rm /mnt/root/boot/* -rf

dmesg | grep usb
# SuperSpeed Gen 1 -> idVendor, idProduct

blkid
# /dev/sda1 -> PARTUUID

cp /boot/boot.scr /boot/boot.scr.bak
vim /boot/boot.txt
# comment part uuid
# Add `usb-storage.quirks={idVendor}:{idProduct}:u` to bootargs
# Replace `root=PARTUUID`
/boot/mkscr

# reboot

# verify mounts
fdisk /dev/mmcblk1
# delete partition 2
```
