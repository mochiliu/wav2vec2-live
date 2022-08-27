FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-runtime

# Instal basic utilities
RUN apt-get update && \
    apt-get install -y --no-install-recommends nano tmux git wget unzip bzip2 sudo ca-certificates && \
    apt-get install -y portaudio19-dev libsndfile1 && \
    apt-get clean

COPY ./requirements.txt /requirements.txt

RUN python -m pip install -r /requirements.txt
