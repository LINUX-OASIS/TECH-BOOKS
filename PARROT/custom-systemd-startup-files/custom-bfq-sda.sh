#!/bin/bash
sudo modprobe bfq-iosched
sudo echo "bfq" | sudo tee /sys/block/sda/queue/scheduler
sleep 2 && echo "0" | sudo tee /sys/block/sda/queue/iosched/low_latency

sudo echo "0" | sudo tee /sys/module/dm_mod/parameters/use_blk_mq

#sleep 1 && echo "1" | sudo tee /sys/block/sda/queue/iosched/strict_guarantees
