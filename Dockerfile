# syntax=docker/dockerfile:1
#FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04 
#FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04
FROM pytorch/pytorch:2.1.2-cuda11.8-cudnn8-devel
#FROM pytorch/pytorch:2.1.2-cuda11.8-cudnn8-runtime

LABEL maintainer="summerhill001@gmail.com"

# ignore interaction
ARG DEBIAN_FRONTEND=noninteractive

# copy context
COPY context/config     /opt/docker/context/config
COPY context/entrypoint /opt/docker/context/entrypoint
COPY context/utils      /opt/docker/context/utils

# /etc/apt/sources.list
RUN echo deb http://th.archive.ubuntu.com/ubuntu jammy main >> /etc/apt/sources.list

# install fundamental packages
RUN apt update && \
    xargs apt install -y < /opt/docker/context/utils/requirements.apt && \
    rm -rf /var/lib/apt/lists/*

# set fundamental configuration
RUN cat /opt/docker/context/config/account | chpasswd && \
    cat /opt/docker/context/config/sshd_config >> /etc/ssh/sshd_config && \
    cat /opt/docker/context/config/bashrc >> /root/.bashrc && \
    cat /opt/docker/context/config/vimrc >> /usr/share/vim/vimrc && \
    ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime

# install python
#RUN /opt/docker/context/utils/install_python.sh

# install poetry
#RUN /opt/docker/context/utils/install_poetry.sh

# install java
#RUN /opt/docker/context/utils/install_java.sh

# install extension packages
COPY context/extension /opt/docker/context/extension
RUN apt update && \
    xargs apt install -y < /opt/docker/context/extension/requirements.apt && \
    rm -rf /var/lib/apt/lists/*

# install extension python package
RUN pip3 install -r /opt/docker/context/extension/requirements.txt

# run entrypoint.sh
#RUN chmod +x /opt/docker/context/entrypoint/entrypoint.sh
#ENTRYPOINT [ "/opt/docker/context/entrypoint/entrypoint.sh" ]
#CMD [ "/bin/bash" ]
ENTRYPOINT [ "sleep", "infinity" ]
