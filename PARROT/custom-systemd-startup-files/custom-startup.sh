#!/bin/bash

sudo systemctl start ntp

#set io scheduler to bfq
sudo modprobe bfq-iosched
sudo echo "bfq" | sudo tee /sys/block/sda/queue/scheduler
#sleep 1 && echo "0" | sudo tee /sys/block/sda/queue/iosched/low_latency

#set cpu freq to performance
sudo echo "performance" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

#fix wlan0 name
sudo systemctl stop NetworkManager
sudo ip link set wlan1 down
sudo ip link set wlan1 name wlan0
sudo ip link set wlan0 up
sudo systemctl start NetworkManager

#enable pci passthrough for kvm
sudo modprobe pci_stub
sudo modprobe vfio
sudo modprobe vfio_iommu_type1
sudo modprobe vfio_pci
sudo modprobe kvm
sudo modprobe kvm_intel

