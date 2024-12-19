# Homelab
My homelab setup with Dell PowerEdge R730 running Proxmox and K0s

## Fan control
To silence the fans, install `ipmitool`
```bash
apt install ipmitool -y
```

Enable manual fan control
```bash
ipmitool raw 0x30 0x30 0x01 0x00
```

Disable manual fan control
```bash
ipmitool raw 0x30 0x30 0x01 0x01
```

Turn fan to 10% - 0xA is 10
```bash
ipmitool raw 0x30 0x30 0x02 0xff 0xA
```

Turn fan to 20% - 0x19 is 20
```bash
ipmitool raw 0x30 0x30 0x02 0xff 0x19
```

Monitor some relevant metrics
```bash
ipmitool sdr elist full
```

## Tailscale VPN
Setup tailscale to access network externally

### Proxmox access
1. [Install tailscale client on access devices](https://tailscale.com/download)
2. [Install tailscale on target device](https://tailscale.com/kb/1031/install-linux)
```bash
curl -fsSL https://tailscale.com/install.sh | sh
```
3. Access target device by enabling tailscale VPN and access via assigned IPv4 or IPv6

### LXC access
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
