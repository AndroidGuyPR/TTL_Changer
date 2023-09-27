# TTL_Changer

This code is a shell script that performs several functions related to network traffic and settings. 

1. The script starts by sleeping for 15 seconds, delaying the execution of the remaining code.

2. The function `set_ttl_65()` is defined to set various system properties related to IPv4 and IPv6 networking. It sets the default time to live (TTL) for IPv4 packets to 65, sets the hop limit for IPv6 packets to 65, enables IP forwarding, enables forwarding for all interfaces, enables dynamic IP addressing for IPv4, and disables IPv6.

3. The function `mark_traffic_ttl()` is defined to iterate over network interfaces using the `ip` command, and for each interface, it adds a rule to the mangle table of iptables. This rule sets the TTL for incoming packets on that interface to 65.

4. The script uses the `settings` command to modify two global settings related to tethering. It sets `tether_dun_required` to 0, disabling the requirement for Dial-Up Networking (DUN) tethering, and sets `tether_entitlement_check_state` to 0, disabling the entitlement check for tethering.

5. The script checks if the `iptables` command is available (using the `command -v` command). If `iptables` is available, it checks if there are any existing mangle rules that match the "TTL" keyword. If such rules exist, it iterates over network interfaces using the `ip` command, and for each interface, it adds a rule to the mangle table of iptables. This rule sets the TTL for outgoing packets on that interface to 65. If no existing mangle rules are found, it calls the `set_ttl_65` function to set the system properties and then calls the `mark_traffic_ttl` function to add the mangle rules.

6. If the `iptables` command is not available, the script simply calls the `set_ttl_65` function to set the system properties.

In summary, this script sets the TTL for incoming and outgoing packets on network interfaces to 65 using both system properties and iptables rules. It also modifies some settings related to tethering.




To use this module you will need to have Magisk on your device aka be "rooted" have superuser rights etc.
With this you'll be free to share your phone internet connection to others without the need of a hotspot plan/feature.
Most unlimited plans limit your video resolution to 480p or 720p.
If you want to enjoy watching movies in 4K you'll need to run a VPN or have Stream Saver turned off.

# How to Install
MagiskManager > Modules > Downloads/ttlchanger.zip > Reboot

