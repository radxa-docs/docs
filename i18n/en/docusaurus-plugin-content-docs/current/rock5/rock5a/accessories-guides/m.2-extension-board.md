---
sidebar_position: 20
---

# How to setup M.2 E Key extension board on ROCK 5A

- This is ROCK5A with M.2 Extension Board.
  ![ROCK5A Install M.2 Extension Board](/img/rock5a/rock5a-m2-extension-board-01.webp)

- The picture below shows the RADXA M.2 Extension Board and the included parts.  
  **Please click the link for details.[M.2 Extension Board](../../../accessories/m2-extension-board)**

![ROCK5A Install M.2 Extension Board](/img/accessories/m2-extension-board-03.webp)

- Please distinguish the front and back side of the IPEX cable first. As shown in the picture.

**The two ends of the IPEX cable we provide for ROCK5A are oriented in the same direction.**
![ROCK5A Install M.2 Extension Board](/img/accessories/m2-extension-board-04.webp)

- Please note that the **Ring Buckle** needs to jam into the connector.
  ![E key to M key](/img/accessories/ekey-to-mkey-01.webp)

## Install Guide

1. M.2 E key to M.2 M key Board with IPEX Cable. **Note that the IPEX cable is installed here with the front side up and the ring buckle needs to be jammed to the interface to ensure that it is fixed.**
   ![ROCK5A Install M.2 Extension Board](/img/accessories/m2-extension-board-02.webp)

2. M.2 Extension Board with IPEX Cable. **Note that the IPEX cable is installed here with the front side up and the ring buckle needs to be jammed to the interface to ensure that it is fixed.**
   ![ROCK5A Install M.2 Extension Board](/img/accessories/m2-extension-board-01.webp)

3. Please install the M2.5x18+6 copper post and M2.5x5 copper post included with the product on the ROCK5A as shown in the picture.
   ![ROCK5A Install M.2 Extension Board](/img/rock5a/rock5a-m2-extension-board-04.webp)

4. Please Connect one end of the IPEX cable to the M.2 E key to M Key board and the other end to the M.2 Extension Board and Install the M.2 E key to M key board to the M.2 E key connector of ROCK5A. As shown in the picture.
   ![ROCK5A Install M.2 Extension Board](/img/rock5a/rock5a-m2-extension-board-03.webp)

5. Finally, the M.2 extension board is assembled using M2.5x5+5 copper posts.
   ![ROCK5A Install M.2 Extension Board](/img/rock5a/rock5a-m2-extension-board-02.webp)

## As a storage drive

1.  you can check whether the SSD card is recognized by `lsblk`.

```
radxa@rock-5a:~$ lsblk
NAME         MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
mmcblk0      179:0    0  14.5G  0 disk
├─mmcblk0p1  179:1    0    16M  0 part /config
└─mmcblk0p2  179:2    0  14.4G  0 part /
mmcblk0boot0 179:32   0     4M  1 disk
mmcblk0boot1 179:64   0     4M  1 disk
zram0        254:0    0   3.8G  0 disk [SWAP]
nvme0n1      259:0    0 238.5G  0 disk
radxa@rock-5a:~$
```

2. As you can see, the system has recognized the SSD(**nvme0n1**).

## As a system drive

1. Please check the tutorial [Install OS to M.2 NVMe SSD](../getting-started/install-os)
