FROM python:3.5-slim
ARG package_name=gnocchi

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

ADD run-gnocchi.sh /
RUN pip install -U ${package_name}[file,redis,postgresql] uwsgi
RUN mkdir /etc/gnocchi
ADD uwsgi.ini /etc/gnocchi
EXPOSE 8041
