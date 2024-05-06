#!/bin/bash
# Debian Ubuntu 22.04
# AMD Drivers & ROCm on Ubuntu
# Update system
sudo apt update -y && sudo apt full-upgrade -y
# Based on https://phazertech.com/tutorials/rocm.html
# Follow phazertech on Youtube https://phazertech.com/youtube.html
# Here are the new official instructions for installing the AMD drivers using the package manager. 
# The necessary steps have been copied here for your convenience.
# First download and convert the package signing key:
sudo mkdir --parents --mode=0755 /etc/apt/keyrings
wget https://repo.radeon.com/rocm/rocm.gpg.key -O - | gpg --dearmor | sudo tee /etc/apt/keyrings/rocm.gpg > /dev/null
# Add the AMDGPU Repository and Install the Kernel-mode Driver:
ver=6.0.2
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] https://repo.radeon.com/amdgpu/$ver/ubuntu jammy main" | sudo tee /etc/apt/sources.list.d/amdgpu.list
sudo apt update
echo -e 'Package: *\nPin: release o=repo.radeon.com\nPin-Priority: 600' | sudo tee /etc/apt/preferences.d/rocm-pin-600
# Install the kernel mode driver and reboot the system:
sudo apt install amdgpu-dkms
sudo reboot now
