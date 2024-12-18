# homelab
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
