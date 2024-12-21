# Fan control
The fans of the r730 is quite loud. So here are some commands to lower fan speeds.

## Install
To silence the fans, install `ipmitool`
```bash
apt install ipmitool -y
```

## Enable control
Enable manual fan control
```bash
ipmitool raw 0x30 0x30 0x01 0x00
```

Disable manual fan control
```bash
ipmitool raw 0x30 0x30 0x01 0x01
```

# Change speed
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
