#!/bin/bash
cp /etc/pulse/daemon.conf ./backup_daemon.conf
sudo cp ./daemon.conf /etc/pulse/daemon.conf
pulseaudio -k
docker run -it --gpus 'device=0' -p 8887:8887 -v $PWD/:/mnt/ --device /dev/snd -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native -v ~/.config/pulse/cookie:/root/.config/pulse/cookie --group-add $(getent group audio | cut -d: -f3) wav2vec2-live
