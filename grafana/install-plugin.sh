#!/bin/sh

set -e
set -x

: "${GF_PATHS_PLUGINS:=/var/lib/grafana/plugins}"
mkdir -p ${GF_PATHS_PLUGINS}
cd ${GF_PATHS_PLUGINS}

URL=$(curl https://api.github.com/repos/gnocchixyz/grafana-gnocchi-datasource/releases/latest | awk -F'"' '/browser_download_url/{print $4}')
curl -qL $URL -o  /gnocchixyz-gnocchi-datasource.tar.gz
tar -xf /gnocchixyz-gnocchi-datasource.tar.gz
