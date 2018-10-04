FROM grafana/grafana
COPY --chown=grafana ./install-plugin.sh /install-plugin.sh
COPY --chown=grafana ./configure.sh /configure.sh
COPY --chown=grafana ./run-and-configure.sh /run-and-configure.sh
COPY --chown=grafana ./dashboard.json /dashboard.json
COPY --chown=grafana ./datasource.json /datasource.json
ENTRYPOINT ["/run-and-configure.sh"]
