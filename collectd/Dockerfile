FROM collectd-base
ARG package_name=collectd-gnocchi

RUN pip install envtpl ${package_name}
COPY collectd.conf.tpl /etc/collectd
COPY run.sh /
CMD /run.sh
