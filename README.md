# LabInstall
A curated list of all the things I found helpful building my lab along with all sorts of other stuff.


## Contents

- [ESXi](#ESXi)
- [Cisco 3750](#c3750)
- [Dell R1950](#DellR1950)
- [Ubiquiti EdgeRouter-X](#UbiquitiEdgeRouter-X)
- [Ubiquiti UniFi Controller](#UbiquitiUniFiController)


## ESXi

- [Node.js](https://github.com/sindresorhus/awesome-nodejs#readme) - no 1
- [VMware KB VLAN](https://kb.vmware.com/s/article/1006628) - VMware KB article on how to configure Cisco switch ports for VLANs and Trunks to/from ESXi.
- [Templates w/o templates](https://www.vladan.fr/how-to-create-a-nested-esxi-6-5-template/) - How to create "templates" in the free version of ESXi 6.5 using export since templates aren't available.


## c3750

- [main](https://github.com) - no 2


## DellR1950

- [BIOS Settings](https://www.thegeekstuff.com/2011/07/bios-cpu-vt-setting-for-vmware/) - BIOS Settings to enable VT-X so 64-bit VM's will work. You'll get an error message when you try to create a VM if this isn't configured.


## UbiquitiEdgeRouter-X

- [Renumbering Rules](https://help.ubnt.com/hc/en-us/articles/205232890-EdgeRouter-Reordering-Firewall-and-NAT-Rules) - Sometimes it's necessary to renumber ER-X rules to move them up or down in the order, this works.
- [Hardening the ER-X](https://networkjutsu.com/hardening-edgerouter-lite-part-1/) - GREAT set of articles on how to configure and harden the ER-X

## UbiquitiUniFiController

-[1]() - no 1