# ============================================================================
# Dockerfile — Recipe for building the course development environment image
# ============================================================================
# A Dockerfile is a text configuration script containing sequential, top-down
# instructions that the Docker engine (or GitHub Codespaces) reads to build a
# static container "image". 
# 
# As established in Black Hat Bash (BHB) Ch. 3, a container image acts as a 
# blueprint or frozen mold of a Linux operating system, while a "container" 
# is an active, isolated instance instantiated from that blueprint. Modifying 
# or destroying a running container does not alter the underlying image blueprint.
# ============================================================================

# ----------------------------------------------------------------------------
# Block a: FROM kalilinux/kali-rolling:latest
# ----------------------------------------------------------------------------
# The FROM instruction defines the foundational base image for our environment.
# Instead of compiling a system from scratch, we build atop the official 
# Kali Linux "rolling" distribution image (which receives continuous security 
# and tool updates). Kali is selected because it comes pre-configured with 
# repositories optimized for security analysis, penetration testing, and advanced 
# network utilities discussed throughout the course (BHB Ch. 3).
FROM kalilinux/kali-rolling:latest
# ----------------------------------------------------------------------------
# Block b & c: ENV (Image layers, caching, and environment variables)
# ----------------------------------------------------------------------------
# Block b (Layer/Cache Idea): Each Dockerfile instruction (FROM, ENV, RUN) 
# creates a distinct, read-only filesystem layer. Docker caches these layers. 
# Ordering matters: if a top layer remains unchanged, Docker reuses the cached version, 
# drastically accelerating rebuilds. Hence, static configurations like environment variables 
# are grouped near the top.
#
# Block c (ENV Variables): The ENV instruction sets permanent environment variables 
# inside the container filesystem. These variables act as global configuration switches 
# that processes and shells query to determine runtime behavior (BHB Ch. 1).
#
#   DEBIAN_FRONTEND=noninteractive
#     Instructs the Debian/Kali package manager (apt) to suppress interactive GUI/TUI 
#     prompts and accept default settings. This prevents the image build process from 
#     hanging indefinitely waiting for user keyboard inputs.
#
#   LANG / LC_ALL=es_ES.UTF-8
#     Configures the system localization and character encoding parameters to Spanish 
#     using UTF-8 format, ensuring that symbols, accented characters, and localized outputs 
#     render cleanly without text corruption.
#
#   TERM=xterm-256color
#     Informs terminal-based software (like vim or nvim) that the active terminal emulator 
#     supports a 256-color palette, optimizing syntax highlighting and visual presentation.
#
# Note: The trailing backslash "\" functions as a shell line-continuation operator, 
# allowing a single multi-line instruction for improved human readability (BHB Ch. 1).
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color
# ----------------------------------------------------------------------------
# Block d: RUN ... debconf-set-selections
# ----------------------------------------------------------------------------
# During the installation of network analysis packages like Wireshark/tshark, 
# the installer triggers an interactive prompt asking whether non-root users 
# should be allowed to capture raw packets. 
#
# To maintain an automated, non-interactive build, we pre-seed the configuration database. 
# Using a standard pipeline shell redirection (BHB Ch. 1), we "echo" the string 
# parameter and pass it via the pipe ("|") operator directly into the standard input (stdin) 
# of the 'debconf-set-selections' command, pre-answering "false" so the installer proceeds smoothly.
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections
# ----------------------------------------------------------------------------
# Blocks e, f, g: The monolithic RUN instruction (Advanced text tools, utility tools, cleanups)
# ----------------------------------------------------------------------------
# Block e (The Big RUN): We combine package synchronization, package installation, 
# configuration, and cleanup tasks into one monolithic RUN block using the logical 
# AND control operator ("&&"). In shell scripting (BHB Ch. 2), "&&" ensures that 
# subsequent commands execute only if the preceding command exits with a success code (0).
#
# Why one single RUN block instead of multiple individual RUNs? 
# Because every separate RUN instruction commits a new immutable filesystem layer. 
# If we installed utilities and cleaned up in separate steps, deleted files would 
# still remain trapped in intermediate layers, bloating the final image size. 
# Consolidating everything inside one RUN keeps the layer footprint lean.
#
# Key Package Flags Explained:
#   apt-get update              -> Pulls the latest package indexes from remote metadata repositories.
#   apt-get install             -> Downloads and configures the requested binaries.
#   -y                          -> Automatically answers "yes" to all installation confirmation prompts.
#   --no-install-recommends    -> Discards non-essential or optional dependencies, saving hundreds of megabytes.
#
# Selected Core Tools Explained:
#   - gawk, sed, grep: Powerful string manipulation utilities for text processing, regex searching, 
#     and inline file transformations (BHB Ch. 2).
#   - shellcheck: A static analysis linter tool that flags bugs, syntax violations, and structural 
#     errors in Bash shell scripts (BHB Ch. 1).
#   - nmap: A premier network exploration, port scanning, and security auditing utility (BHB Ch. 3).
#   - tcpdump / tshark: Command-line packet sniffers used to capture, inspect, and analyze live 
#     network traffic protocols.
#   - tor / proxychains4: Privacy utilities; tor routes data over an anonymized network, while proxychains4 
#     forces third-party applications to route through custom proxy chains.
#   - jq: A specialized command-line utility used to parse, filter, and extract structured JSON data stream data.
#   - man-db: Re-enables local Unix manuals (`man` pages), which are stripped by default in lean Kali base images.
RUN apt-get update && apt-get install -y --no-install-recommends \
    \
    # === Text Editors & Shell Interpreters ===
    neovim \
    vim \
    zsh \
    bash-completion \
    \
    # === 4th Generation Text Manipulation Engines (BHB Ch. 2) ===
    perl \
    make \
    gawk \
    sed \
    grep \
    \
    # === Core UNIX Base Utilities ===
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    \
    # === Manual Pages and System Documentation ===
    man-db \
    manpages \
    manpages-posix \
    \
    # === Networking Protocols & Asset Downloads ===
    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \
    # === Shell Script Linters ===
    shellcheck \
    \
    # === Network Reconnaissance & Mapping (BHB Ch. 3) ===
    nmap \
    masscan \
    \
    # === Traffic Capture & Deep Packet Analysis ===
    tcpdump \
    tshark \
    \
    # === Core Network Diagnostics & Tunnels ===
    netcat-traditional \
    socat \
    dnsutils \
    whois \
    traceroute \
    mtr-tiny \
    iproute2 \
    net-tools \
    iputils-ping \
    \
    # === Anonymization, Proxies, and Tor Networking ===
    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    # === Modern Readable HTTP Client Utilities ===
    httpie \
# ----------------------------------------------------------------------------
 # Block f: Locale activation with sed
 # ----------------------------------------------------------------------------
 # We use the stream editor 'sed' with the in-place modification flag '-i' (BHB Ch. 2) 
 # to locate the commented Spanish locale entry ("# es_ES.UTF-8") inside the system configuration 
 # file `/etc/locale.gen`, stripping the comment symbol to uncomment it. 
 # The subsequent 'locale-gen' command reads this file to compile and activate the Spanish system locale.
 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \
 # ----------------------------------------------------------------------------
 # Block g: Post-Installation Cache Cleanup
 # ----------------------------------------------------------------------------
 # To minimize image weight, 'apt-get clean' wipes the downloaded package archives (.deb files) 
 # from the local cache directory. 'rm -rf /var/lib/apt/lists/*' force-deletes the unneeded 
 # metadata index files fetched during 'apt-get update'. Performing this extraction and purge 
 # inside the exact same RUN instruction guarantees the discarded files are never written 
 # to the final layer history.
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
 