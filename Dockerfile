FROM python:3.5-slim

RUN apt-get update && apt-get install -y \
    build-essential

ADD run-gnocchi.sh /
RUN pip install -U gnocchi[file,redis,postgresql] uwsgi
RUN mkdir /etc/gnocchi
ADD uwsgi.ini /etc/gnocchi
EXPOSE 8041
