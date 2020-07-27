# kubectl-debug-image

## Supported Tool
kubectl-debug-image is based on https://github.com/nicolaka/netshoot

in addition, below packages are included
* vmstat
* iostat
* pidstat
* mpstat
* htop
* sar
* perf
* dool

## Usecase
mainly used as debug container from https://github.com/aylei/kubectl-debug

### Triage
dool is a good choice to overlook the whole system
```bash
$ dool-all
$ dool-cpu
$ dool-mem
$ dool-io
```

### USE Method
#### CPU
utilization
```bash
# whole system (1 - id)
$ vmstat

# per CPU (1 - %idle)
$ mpstat -P ALL

# per process (%CPU)
$ pidstat
$ dool-cpu

# per thread (%CPU)
$ pidstat -t
```

saturation
```bash
# whole system (r)
$ vmstat
```

#### Memory
utilization
```bash
# whole system (Swap/Mem)
$ free -m

# per process (VIRT/RES)
$ htop
```

saturation
```bash
# whole system (si/so)
$ vmstat

# per process
# dmesg is not acceptable
# $ dmesg | grep killed
$ dool-mem
```

#### Network Interface
utilization
```bash
# per network interface (RX/TX)
$ ip -s link
```

saturation
```bash
# per network interface (dropped/overrun)
$ ip -s link
```

#### Block I/O
utilization
```bash
# per block device (%used)
$ iostat -xz

# per process
# iotop is not acceptable
# $ iotop
```

saturation
```bash
# per process (avgqu-sz,await)
$ iostat -xz
```

#### Storage Capacity
utilization
```bash
$ swapon
```

saturation
```bash
$ df -h
```

### Network Reachability
```bash
$ curl -IL google.com
$ drill -V 5 google.com @8.8.8.8 A
$ ip r
```

