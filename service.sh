#!/system/bin/sh
sleep 15

set_ttl_65()
{
  sysctl net.ipv4.ip_default_ttl=65
  sysctl net.ipv6.conf.all.hop_limit=65
  sysctl net.ipv4.ip_forward=1
  sysctl net.ipv4.conf.all.forwarding=1
  sysctl net.ipv4.ip_dynaddr=1
  sysctl net.ipv6.conf.all.disable_ipv6=1
}

mark_traffic_ttl()
{  
  for i in $(ip -o link show | awk -F': ' '{print $2}'); do (iptables -t mangle -A PREROUTING -i $i -j TTL --ttl-set 65); done
}

settings put global tether_dun_required 0
settings put system tether_entitlement_check_state 0

if [ -x "$(command -v iptables)" ]; then
  if iptables -L -t mangle --line-numbers | grep -q TTL; then
    for i in $(ip -o link show | awk -F': ' '{print $2}'); do (iptables -t mangle -A POSTROUTING -i $i -j TTL --ttl-set 65); done
  else
    set_ttl_65
    mark_traffic_ttl
  fi
else
  set_ttl_65
fi
