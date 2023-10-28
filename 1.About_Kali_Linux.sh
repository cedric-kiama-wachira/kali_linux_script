#!/bin/bash
# Questions
1. What versions of Debian is Kali 1.0, 2.0 and rolling based on?
2. What are the main differences between a Live boot instance of Kali, and an installed instance?
3. What's the difference between live and forensics mode?
4. How can we verify that forensics mode is working?
5. What's the best way to get a tool included in Kali?
6. Name some of the cool features in Kali!
# Answers:
1. Kali 1.0 was based on Debian Wheezy. Kali 2.0 is based on Jessie. Kali rolling is based on Debian Testing.
2. Live mode boots to RAM, and an installed instance of Kali boots to a storage device.
3. Live mode boots to RAM, but may auto-mount disks. Forensics mode does not auto-mount drives.
4. Use the mount command to verify that no disks are mounted. 
   You can also MD5 the system's swap and disk devices, reboot into forensic mode and MD5 again. 
   The MD5 hashes should match if forensics mode succeeded. Try this in a system you don't care about "tainting"!
5. The best way to request for a tool addition is to open a "New Tool Requests" ticket in the Kali Bug Tracker.
6. A live system, forensics mode, a custom Linux kernel, completely customizable, a trusted operating system with default disabled network services, 
   ARM support, preloaded security tools, penetration testing platform! To name a few

ssh -o "IdentitiesOnly yes" -i "DevSecOps_Kali_Linux_Timeline_Re-engineering_Key.pem" kali@ec2-3-29-134-172.me-central-1.compute.amazonaws.com
sudo apt update && sudo apt install -y kali-linux-headless

grep -qP '^flags\s*:.*\blm\b' /proc/cpuinfo && echo 64-bit || echo 32-bit

# NVIDIA Drivers
sudo apt update
sudo apt full-upgrade -y
sudo apt install -y linux-headers-5.7.0-kali3-cloud-amd64
sudo reboot -f
sudo apt install -y nvidia-driver nvidia-cuda-toolkit
sudo reboot -f

#Questions
1. What good examples can you think of for booting Kali live? What about bad examples?
2. Does it strike you weird that you can simply dd an ISO to a USB key, and have it boot?
#Answers:
1. Kali Live is great when you want to: keep a portable copy of Kali in your pocket; test out Kali Linux without making any changes on your computer; 
 need to engage forensics mode. It's a bad idea to use Kali live as any kind of permanent installation, 
 especially if you're hoping to save changes (no persistence!) or if you have limited memory on the boot machine.
2.The Kali (and Debian) ISO is an isohybrid. When the ISO is built, a syslinux utility runs the isohybrid command on the ISO,
  which adds a partition table to the ISO, while still keeping it a valid ISO file.

  