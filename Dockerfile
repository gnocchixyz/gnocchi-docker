FROM python:3.5-slim

RUN apt-get update && apt-get install -y \
    build-essential

ADD run-gnocchi.sh /
RUN pip install -U gnocchi[file,redis,postgresql] uwsgi
RUN mkdir /etc/gnocchi
RUN printf "[uwsgi]\n\
http = 0.0.0.0:8041\n\
wsgi-file = /usr/local/bin/gnocchi-api\n\
master = true\n\
die-on-term = true\n\
threads = 32\n\
processes = 2\n\
enabled-threads = true\n\
thunder-lock = true\n\
plugins = python\n\
buffer-size = 65535\n\
lazy-apps = true\n" > /etc/gnocchi/uwsgi.ini

EXPOSE 8041
