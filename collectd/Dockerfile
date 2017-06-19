FROM ubuntu:xenial

RUN apt-get update -y && apt-get install -y \
    collectd \
    python \
    python-dev \
    python-pip \
    libyaml-dev \
    build-essential \
    git \
    stress \
 && rm -rf /var/lib/apt/lists/*

RUN pip install envtpl collectd-gnocchi
COPY collectd.conf.tpl /etc/collectd
COPY run.sh /
CMD /run.sh
