# Part 2 - Build a 64-bit Kernel
**Student:** Ashley Espinoza

**University:** International University of Ecuador (UIDE)

**Major:** Systems Engineering - Second Semester

**Date:** June 24, 2026

This folder contains the files for Part 2 of the integrative project.
The objective is to build a minimal 64-bit kernel that boots in QEMU using GRUB and Multiboot2.

## Step 0 - Repository setup

In this step, I prepared the project repository in my Ubuntu virtual machine.

I first verified that Git was available in the system. After that, I moved to my personal workspace and cloned the group repository from GitHub. I used the project branch called `integrative-project`, because this is the branch where my group is organizing the integrative project.

After cloning the repository, I entered the project folder and checked the active branch. The terminal confirmed that I was working inside the `integrative-project` branch.

This step is important because it connects my local Ubuntu environment with the group repository. From this point, I will create and test all files for Part 2 inside the `part2` folder. Later, I will save my changes with commits and upload them to GitHub.

### Evidence
![alt text](image-1.png)![alt text](image-2.png)

## Step 1 - Local environment preparation

## Step 1 - Local environment preparation

In this step, I prepared my Ubuntu virtual machine for the kernel development process. I installed and verified the main tools needed for Part 2. These tools are Docker, QEMU, Make, and Tree.

This step is important because the kernel needs a local Linux environment to build and test correctly. Docker will help me create a reproducible build environment. QEMU will help me boot and test the generated ISO file. Make will help me automate the compilation process.

After the installation, I checked the versions of the tools in the terminal. The output confirms that my environment is ready to continue with the 64-bit kernel build.

### Evidence
![alt text](image-4.png)
![alt text](image-3.png)

## Step 2 - Docker build environment

In this step, I created the Dockerfile for Part 2 of the project.

This file is located inside the `part2` folder. The Dockerfile prepares the build environment for the 64-bit kernel.

I used a Docker image with the x86_64 cross compiler as the base. Then, I added the required tools for the kernel build process, such as NASM, GRUB, xorriso, mtools, and Make.

This step is important because the project requires a reproducible build environment. With Docker, the kernel can be compiled using the same tools every time, even on another computer.

### Evidence
![alt text](image-8.png)

## Step 3 - Makefile creation

In this step, I created the Makefile for Part 2.

The Makefile is located inside the `part2` folder. This file organizes the build process for the kernel.

The Makefile will assemble the boot files, compile the C file, link all object files, and generate the final bootable ISO.

This step is important because it makes the project easier to build. Instead of running many separate commands manually, the build process is controlled from one file.

The Makefile also includes a verification option to check if the generated kernel is compatible with Multiboot2. This is required because GRUB needs to recognize the kernel before it can boot it.

### Evidence
![alt text](image-6.png)![alt text](image-7.png)

## Step 4 - Linker and GRUB configuration

In this step, I created the linker script and the GRUB configuration file.

The linker script is located in `targets/x86_64/linker.ld`. This file defines how the kernel sections are organized in memory. It places the kernel at 1 MB and keeps the Multiboot2 header at the beginning of the boot section. This is important because GRUB needs to find the Multiboot2 header when it loads the kernel.

The GRUB configuration file is located in `targets/x86_64/grub.cfg`. This file defines the boot menu entry for the kernel. It tells GRUB to load `/boot/kernel.bin` using Multiboot2.

This step prepares the project so the kernel can be linked correctly and later loaded by GRUB inside the bootable ISO.

### Evidence
![alt text](image-9.png)
![alt text](image-10.png)

![alt text](image-11.png)
![alt text](image-12.png)
