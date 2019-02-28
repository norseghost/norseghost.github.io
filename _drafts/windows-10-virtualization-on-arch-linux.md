---
title: "windows 10 virtualization on arch Linux"
date: "2019-02-04 17:04:09 +0100"
tags: ""
---

Goal: performant windows 10 installation, running as close to bare metal
as possible.


# Setup

- enabling virtuelisation in bios
- enabling virtualization kernel modules
- enabling passthrough modules
- installing qemu/kvm
- installing virt-manager (and network bridge toolchain)
- installing virtio
- installing OVMF; pointing libvirt to ovmf 
- setting up GVT

