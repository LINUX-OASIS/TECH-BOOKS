#!/bin/bash

sudo systemctl stop NetworkManager
sleep 1 && sudo ip link set wlan0 down
sleep 1 && sudo ip link set wlx60e32712a007 down
sleep 1 && sudo ip link set wlan0 up 
sleep 1 && sudo ip link set wlx60e32712a007 up
sudo systemctl start NetworkManager

