FROM randomdude/gcc-cross-x86_64-elf:latest

RUN apt-get update && apt-get install -y \
    nasm \
    xorriso \
    grub-pc-bin \
    grub-common \
    mtools \
    make \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work