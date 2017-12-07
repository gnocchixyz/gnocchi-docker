FROM ubuntu:xenial
ARG package_name=collectd-gnocchi

RUN apt-get update -y && apt-get install -y \
    collectd \
    python \
    python-dev \
    python-pip \
    libyaml-dev \
    build-essential \
    curl \
    git \
 && rm -rf /var/lib/apt/lists/*

RUN pip install envtpl ${package_name}

