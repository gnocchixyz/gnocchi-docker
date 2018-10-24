FROM grafana/grafana
USER root
RUN apt-get -qy update \
	&&	apt-get -qy install curl
USER grafana
COPY --chown=grafana ./install-plugin.sh /install-plugin.sh
COPY --chown=grafana ./configure.sh /configure.sh
COPY --chown=grafana ./run-and-configure.sh /run-and-configure.sh
COPY --chown=grafana ./dashboard.json /tmp/dashboard.json
COPY --chown=grafana ./datasource.json /tmp/datasource.json
ENTRYPOINT ["/run-and-configure.sh"]
