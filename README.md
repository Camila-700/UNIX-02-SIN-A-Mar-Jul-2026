# UNIX-02-SIN-A-Mar-Jul-2026
Repo for intro to UNIX
### Answers My own little distro
### 1. Verify the firmware type
When running the command `[ -d /sys/firmware/efi ] && echo "UEFI" || echo "BIOS"`:
- In the Codespace: the result was BIOS.
- In QEMU: the result was also BIOS.
This happens because both the Codespace environment and QEMU (by default) use BIOS-based firmware instead of UEFI. QEMU emulates BIOS unless UEFI is explicitly configured, so this result is expected in both cases.
### 2. Inspect the filesystem structure
When running `ls /` inside QEMU, the root filesystem contains only a few directories and files: `bin`, `dev`, `init`, `root`, `sbin`, and `usr`.
Compared to a full Linux filesystem, several standard directories are missing, such as `/home`, `/var`, `/boot`, `/tmp`, `/etc`, and `/mnt`.
This happens because the system is running from a very small initramfs built with BusyBox, not from a complete Linux root filesystem. It only includes the minimum structure required to boot and provide a basic shell environment.
### 3. Explore BusyBox
When running `ls -la /bin/`, it can be observed that almost all commands (such as `ls`, `cat`, `cp`, etc.) are symbolic links pointing to a single binary: `busybox`. :contentReference[oaicite:0]{index=0}
This means that BusyBox provides multiple utilities through one executable, which behaves differently depending on how it is invoked.
This approach significantly reduces the size of the system, making it ideal for embedded systems or minimal environments with limited resources.
### 4. Examine blocks
When running stat test.txt, it can be observed that the file size is 5 bytes, while the system reports 8 blocks of 512 bytes each (totaling 4096 bytes allocated).
This means that although the file only contains a few bytes, it occupies a full filesystem block of 4 KB.
This occurs because filesystems allocate space in fixed-size blocks, so even very small files use an entire block. This difference between the real file size and the allocated space is known as internal fragmentation, since most of the allocated block remains unused.
### 5. Analyze partitions
When running sudo parted -l && lsblk -f, it can be observed that the system uses both MBR (msdos) and GPT partition tables.
Disk /dev/sda uses MBR with an ext4 partition, while /dev/sdb and /dev/sdc use GPT, including ext4 and a small fat32 (EFI) partition for boot.
Additionally, several loop devices are present, which are used for virtual environments.
Overall, ext4 is the main filesystem, and GPT is used on most modern disks.
