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
    