FROM gnocchi-base
ARG package_name=gnocchi

ADD run-gnocchi.sh /
RUN pip install -U ${package_name}[file,redis,postgresql] uwsgi
RUN mkdir /etc/gnocchi
ADD uwsgi.ini /etc/gnocchi
EXPOSE 8041
