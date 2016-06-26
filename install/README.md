# IOVisor-bcc

BCC is tools for BPF(Berkeley Packet Filter)-based Linux IO analysis, networking, monitoring and more.

## Installtion IO Visor BCC(BPF Complier Collections)
I made following four shell script files to set up BCC easily. But It could be operated properly in specific OS version(Ubuntu-14.04.3-server) which is Ubuntu-Trusty. For more information, please refer official iovisor bcc installaion markdown [INSTALL.md](https://github.com/TaekhoNam/IOVisor-bcc/blob/master/bcc/INSTALL.md) page.

 1. kernel_upgrade.sh (and then reboot your PC)
 2. install_iovisor.sh
 

First, you need to upgrade our kernel version. To upgrade, run **kernel_upgrade.sh** then you have to reboot your computer. After rebooting, you should execute to install some packages, some dependencies and compilation. using **install_iovisor.sh**. Finally, you can see bcc directory in your current directory.


```javascript
$sudo ./kernel_upgrade.sh
$sudo reboot
$sudo ./install_iovisor.sh
```

Then, bcc directory will be made in your current directory.
