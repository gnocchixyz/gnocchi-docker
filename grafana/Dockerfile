FROM grafana/grafana
COPY ./install-plugin.sh /install-plugin.sh
COPY ./configure.sh /configure.sh
COPY ./run-and-configure.sh /run-and-configure.sh
COPY ./dashboard.json /dashboard.json
COPY ./datasource.json /datasource.json
ENTRYPOINT ["/run-and-configure.sh"]
