#!/bin/bash
sudo cp ./backup_daemon.conf /etc/pulse/daemon.conf
pulseaudio -k
