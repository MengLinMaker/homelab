
# Tailscale VPN
Access the homelab on a different network, using tailscale.

## Proxmox access
1. [Install tailscale client on access devices](https://tailscale.com/download)
2. [Install tailscale on target device](https://tailscale.com/kb/1031/install-linux)
```bash
curl -fsSL https://tailscale.com/install.sh | sh
```
3. Access target device by enabling tailscale VPN and access via assigned IPv4 or IPv6

## LXC access
Instructions taken from https://dustri.org/b/running-tailscale-inside-of-a-proxmox-container.html

1. Add some lxc config in proxmox specifying correct ID  - 100 in this example
```bash
echo 'lxc.cgroup.devices.allow: c 10:200 rwm' >> /etc/pve/lxc/100.conf
echo 'lxc.mount.entry: /dev/net/tun dev/net/tun none bind,create=file' >> /etc/pve/lxc/100.conf
```
2. Enter lxc container
```bash
pct enter 100
```
3. Install and configure tailscale
```bash
curl -fsSL https://tailscale.com/install.sh | sh
echo 'net.ipv4.ip_forward = 1' | tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | tee -a /etc/sysctl.conf
sysctl -p /etc/sysctl.conf
reboot
```
