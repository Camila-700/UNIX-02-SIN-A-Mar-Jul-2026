sudo apt update
#Updates the package lists on your system so it knows about the latest available software versions.
sudo apt install -y git vim make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools qemu-
#Installs multiple development tools and system utilities needed for compiling, building, and running software environments.
git clone --depth 1 https://github.com/torvalds/linux.git
#Downloads a shallow copy of the Linux kernel source code repository.
cd linux
#Changes the current directory to the downloaded Linux source folder.
make menuconfig
#Opens a menu-based interface to configure the kernel options.
make -j 2
#Compiles the kernel source code using 2 parallel jobs to speed up the build process.
sudo mkdir /boot-files
#Creates a new directory named /boot-files with administrator privileges.
sudo cp arch/x86/boot/bzImage /boot-files/
#Copies the compiled kernel image to the /boot-files directory.
cd ..
#Moves up one level to the parent directory.
git clone --depth 1 https://git.busybox.net/busybox
#Downloads a shallow copy of the BusyBox source code repository.
cd busybox
#Changes the current directory to the BusyBox source folder.
make menuconfig
#Opens a configuration menu to customize BusyBox features.
make -j 2
#Compiles BusyBox using 2 parallel jobs to speed up the process.
sudo mkdir /boot-files/initramfs
#Creates a directory for the initramfs filesystem with administrator privileges.
sudo make CONFIG_PREFIX=/boot-files/initramfs install
#Installs BusyBox files into the initramfs directory specified by CONFIG_PREFIX.
cd /boot-files/initramfs
#Changes the current directory to the initramfs folder.
sudo vi init
#Opens the init file for editing with root privileges.
!/bin/sh
/bin/sh
#Defines a simple init script that launches a shell.
sudo rm linuxrc
#Removes the default linuxrc file.
sudo chmod +x init
#Makes the init script executable.
sudo find . | cpio -o -H newc > ../init.cpio
#Creates an initramfs archive from the current directory.
cd ..
#Moves up one level to the parent directory.

