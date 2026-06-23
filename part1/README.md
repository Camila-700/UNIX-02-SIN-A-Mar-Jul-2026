# Integrative Project: Create your own layout with Cubic
**Student:** Paula Simbaña

**University:** International University of Ecuador (UIDE)

**Major:** Systems Engineering - Second Semester

**Date:** June 23, 2026


## 1. Base System Used
* **Base Operating System:** Ubuntu 24.04 LTS (Noble Numbat), 64-bit architecture (x86_64).

* **Customization Tool :** Cubic (Custom Ubuntu ISO Creator). This tool was used to extract and modify the original Ubuntu ISO image. Using the chroot environment, changes were made directly to the root filesystem, including package installation, desktop environment customization, and initial system configuration. Once the modifications were complete, Cubic allowed the distribution to be recompiled and the final bootable ISO image to be generated.

The resulting custom distribution was named PaulaOS, developed as part of the course's integrated project, maintaining the stability and compatibility of Ubuntu 24.04 LTS while incorporating configurations and tools adapted to the project's requirements.

![alt text](image.png)


## 2. List of Modifications and Justification

* **Modification 1: Replacement of System Multimedia Software :**

* **What was done:** Within the Cubic `chroot` environment, the repositories were updated with `apt update` and the **`mpv`** multimedia player was installed along with its native dependency libraries.

* **Justification:** Resource and performance optimization. Unix environments geared towards servers or development do not require heavy multimedia players or those with redundant graphical interfaces. The inclusion of `mpv` offers a minimalist, high-performance alternative that consumes less RAM and CPU cycles on the operating system.

> *Note: Initially, the package manager returned a localization error due to a reversal in the letter order ("mvp"), which was corrected and successfully installed as `mpv`.* 

![alt text](image-1.png)
![alt text](image-3.png)

### Modification 2: Implementation of Native Programming Tools
* **What was done:** Essential software development tools were injected into the system root: the advanced text editor neovim and the metapackage build-essential (which installs the gcc and g++ compilers and the makeutility).

**Justification:** Autonomy of the development environment. By integrating these packages directly into the ISO compilation, we ensure that any developer can write, edit, and compile code in languages ​​like C or C++ natively and immediately from the first boot, eliminating the dependency on a post-installation internet connection.

![alt text](image-4.png)
![alt text](image-5.png)

