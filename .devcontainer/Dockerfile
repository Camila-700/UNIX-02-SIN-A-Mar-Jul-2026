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