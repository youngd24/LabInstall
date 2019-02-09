# LabInstall
A curated list of all the things I found helpful building my lab along with all sorts of other stuff.


## Contents

- [ESXi 6.5](#ESXi)
- [Cisco 3750](#c3750)
- [Dell R1950](#DellR1950)
- [Ubiquiti EdgeRouter-X](#UbiquitiEdgeRouter-X)
- [Ubiquiti UniFi Controller](#UbiquitiUniFiController)


## ESXi 6.5

- [VMware KB VLAN](https://kb.vmware.com/s/article/1006628) - VMware KB article on how to configure Cisco switch ports for VLANs and Trunks to/from ESXi.
- [Templates w/o templates](https://www.vladan.fr/how-to-create-a-nested-esxi-6-5-template/) - How to create "templates" in the free version of ESXi 6.5 using export since templates aren't available.
- [Changing ESXi 6.5 hostname using the web console](9http://www.ntweekly.com/2017/02/22/how-to-change-an-esxi-6-5-hostname-using-the-web-client/) - It defaults to localhost, use this to change it. Note that you'll have to static the DNS then too. Maybe there's a way to statically DHCP it down to the machine, not sure.


## c3750

- [main](https://github.com) - no 2


## DellR1950

- [BIOS Settings](https://www.thegeekstuff.com/2011/07/bios-cpu-vt-setting-for-vmware/) - BIOS Settings to enable VT-X so 64-bit VM's will work. You'll get an error message when you try to create a VM if this isn't configured.


## UbiquitiEdgeRouter-X

- [Renumbering Rules](https://help.ubnt.com/hc/en-us/articles/205232890-EdgeRouter-Reordering-Firewall-and-NAT-Rules) - Sometimes it's necessary to renumber ER-X rules to move them up or down in the order, this works.
- [Hardening the ER-X](https://networkjutsu.com/hardening-edgerouter-lite-part-1/) - GREAT set of articles on how to configure and harden the ER-X
- [mjp66 Github repo](https://github.com/mjp66/Ubiquiti) - One user's home network setup in a massive PDF file, he also hangs out in the UBNT forums.
- [ER-X script example](https://community.ubnt.com/t5/EdgeRouter/Running-cli-script/m-p/2262198/highlight/true#M199118) - An example of how to use the Vyatta cmd wrapper for a script to automate ER-X operations.
- [Difk full](https://community.ubnt.com/t5/EdgeRouter/EdgeRouter-X-SFP-disk-is-full/m-p/2520119/highlight/true#M224348) - The ER-X keeps a copy of the previous OS/firmware on disk after upgrades, it consumes most of the flash, remove it when you're sure the OS is stable. sudo -s; configure; delete system image
- [Integrate Spamhaus](https://community.ubnt.com/t5/EdgeRouter/Using-spamhaus-lists/m-p/644151) - This post has a shell script to consume one of the Spamhaus lists.
- [Using IPSet](https://www.linuxjournal.com/content/advanced-firewall-configurations-ipset) - The IPSet utility allows you to manipulate the iptables firewall rules differently (and easier) than the iptables command.
- [The man page](http://ipset.netfilter.org/ipset.man.html) - zee (very) long man page.

## UbiquitiUniFiController

-[1]() - no 1

## Intrusion Detection

- [Defensive Raspberry Pi - Part 1](https://www.tripwire.com/state-of-security/security-data-protection/cyber-security/sweet-security-deploying-a-defensive-raspberry-pi/) - Building a Raspberry Pi based IDS. Part 1.
- [Defensive Raspberry Pi - Part 2](https://www.tripwire.com/state-of-security/security-data-protection/sweet-security-part-2-creating-a-defensible-raspberry-pi/) - Buiding a Raspberry Pi based IDS. Part 2.

## Securituy Intelligence Feeds

- [Threat Connect](https://app.threatconnect.com/auth/index.xhtml) - They offer a 1 user free account of their intel feeds.
- [Rutgers IP Block list](https://report.cs.rutgers.edu/mrtg/drop/dropstat.cgi?start=-3h) Rutgers publishes a feed of know attacker IP addresses they sweep in from syslog there. I'm working on a way to integrate that into the ER-X-Lite.
- [Emerging Threat List](https://doc.emergingthreats.net/bin/view/Main/EmergingFirewallRules) - Includes Spamhaus and a few others.

## Project/Task Management

- [Backlog](http://www.backlog.com) - A free Jira alternative, free up to 10 users. So far it seems decent, I upped to the "Starter" plan so I can get sub-tasks for $20 for the first month.

## NEXX WT3020

- [$20 Tor Router](https://www.securityskeptic.com/2016/01/how-to-turn-a-nexx-wt3020-router-into-a-tor-router.html) - Turn a $20 WT3020 into a Tor router.
- [OpenWRT Project Page](https://openwrt.org/toh/nexx/wt3020) - The OpenWRT project page for it.

## RFID Hacking

- [Wie Gotcha Long Ranger collector](https://exfil.co/2017/01/17/wiegotcha-rfid-thief/) - Snag RFID's up to some number of feet more than 3.