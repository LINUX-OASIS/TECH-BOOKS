#!/bin/bash

sudo swapoff -a
sysctl vm.swappiness=1
systemctl start ntp
